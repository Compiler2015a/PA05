package IC.CodeGeneration;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import IC.lir.Instructions.*;

public class CodeGenerator implements IC.lir.Instructions.Visitor {
	
	private final String PROLOGUE_COMMENT = "prologue";
	private final String EPILOGUE_COMMENT = "epilogue";
	
	private List<Instruction> instructionsList;
	private Map<String, AssemblyMethod> assemblyMethods;
	
	private StringBuffer assemblyStrBuffer;
	
	private String currentMethod;
	
	public CodeGenerator(List<Instruction> instructionsList, Map<String, AssemblyMethod> assemblyMethods) {
		this.instructionsList = instructionsList;
		this.assemblyMethods = assemblyMethods;
		this.assemblyStrBuffer = new StringBuffer("");
		
		this.currentMethod = null;
	}
	
	public void generateCode() {
		for (Instruction inst : this.instructionsList) {
			inst.accept(this);
		}
	}
	
	@Override
	public void visit(MoveInstr instr) {
		addAssemblyLine("mov " + getCurrentAssemblyMethod().getStackLocation(instr.src) + ", %eax");
		addAssemblyLine("mov %eax, " + getCurrentAssemblyMethod().getStackLocation(instr.dst));

		
	}

	@Override
	public void visit(BinOpInstr instr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(CompareInstr instr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(UnaryOpInstr instr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(LabelInstr instr) {
		String labelName = instr.label.name;
		boolean isMethodLabel = (assemblyMethods.keySet().contains(labelName));
		if (isMethodLabel) {
			if (currentMethod != null) 
				generateEpilogueStatements(currentMethod);
			currentMethod = labelName;
			dropLine();
			addAssemblyComment("-------------------");
		}
		addAssemblyLine(instr.toString());
		if (isMethodLabel)
			generatePrologueStatements(currentMethod);
	}

	@Override
	public void visit(MoveArrayInstr instr) {
		addAssemblyLine("mov " + getCurrentAssemblyMethod().getStackLocation(instr.base) + ", %eax");
		addAssemblyLine("mov " + getCurrentAssemblyMethod().getStackLocation(instr.offset) + ", %ebx");
		if (instr.isLoad)
			addAssemblyLine(String.format("mov (%s,%s,4), %s)", "%eax", "%ebx", getCurrentAssemblyMethod().getStackLocation(instr.mem);
		else
			addAssemblyLine(String.format("mov %s, (%s,%s,4)", getCurrentAssemblyMethod().getStackLocation(instr.mem), "%eax", "%ebx");
	}

	@Override
	public void visit(MoveFieldInstr instr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(ArrayLengthInstr instr) {
		addAssemblyLine("mov " + getCurrentAssemblyMethod().getStackLocation(instr.arr) + ", %eax");
		addAssemblyLine("mov -4(%eax), %eax)");
		addAssemblyLine("mov %eax, " + getCurrentAssemblyMethod().getStackLocation(instr.dst));
		
	}

	@Override
	public void visit(JumpInstr instr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(CondJumpInstr instr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(StaticCall instr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(VirtualCall instr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(LibraryCall instr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(ReturnInstr instr) {
		// TODO Auto-generated method stub
		
	}
	
	private void addAssemblyLine(String line) {
		assemblyStrBuffer.append(line + '\n');
	}
	
	private void addAssemblyLineWithComment(String line, String comment) {
		assemblyStrBuffer.append(line + "\t# " + comment + '\n');
	}
	
	private void addAssemblyComment(String comment) {
		assemblyStrBuffer.append("# " + comment + '\n');
	}
	
	private void dropLine() {
		assemblyStrBuffer.append('\n');
	}
	
	private void generatePrologueStatements(String methodName) {
		addAssemblyLineWithComment("push %ebp", PROLOGUE_COMMENT);
		addAssemblyLine("mov %esp, %ebp");
		addAssemblyLine("sub $" + (getCurrentAssemblyMethod().getSize() * 4) + ", %esp");
	}
	
	private void generateEpilogueStatements(String methodName) {
		addAssemblyLineWithComment("mov %ebp, %esp", EPILOGUE_COMMENT);
		addAssemblyLine("pop %ebp");
		addAssemblyLine("ret");
	}

	private AssemblyMethod getCurrentAssemblyMethod() {
		AssemblyMethod currentAssemblyMethod = (AssemblyMethod)assemblyMethods.get(currentMethod);
		return  currentAssemblyMethod;
	}
}
