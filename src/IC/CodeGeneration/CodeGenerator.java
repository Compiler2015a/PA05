package IC.CodeGeneration;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import IC.lir.Instructions.*;

public class CodeGenerator implements IC.lir.Instructions.Visitor {
	
	private final String PROLOGUE_COMMENT = "prologue";
	private final String EPILOGUE_COMMENT = "epilogue";
	
	private List<Instruction> instructionsList;
	private Map<String, Integer> methodStackFrames;
	
	private StringBuffer assemblyStrBuffer;
	
	private String currentMethod;
	
	public CodeGenerator(List<Instruction> instructionsList, Map<String, Integer> methodStackFrames) {
		this.instructionsList = instructionsList;
		this.methodStackFrames = methodStackFrames;
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
		// TODO Auto-generated method stub
		
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
		boolean isMethodLabel = (methodStackFrames.keySet().contains(labelName));
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(MoveFieldInstr instr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(ArrayLengthInstr instr) {
		// TODO Auto-generated method stub
		
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
		addAssemblyLine("sub $" + methodStackFrames.get(methodName) + ", %esp");
	}
	
	private void generateEpilogueStatements(String methodName) {
		addAssemblyLineWithComment("mov %ebp, %esp", EPILOGUE_COMMENT);
		addAssemblyLine("pop %ebp");
		addAssemblyLine("ret");
	}
}
