package IC.CodeGeneration;

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
		addAssemblyLine("mov " + getOperandReference(instr.src) + ", %eax");
		addAssemblyLine("mov %eax, " + getOperandReference(instr.dst));
	}

	@Override
	public void visit(BinOpInstr instr) {
		addAssemblyLine("mov " + getOperandReference(instr.dst) + ", %eax");
		addAssemblyLine(String.format("%s %s, %s", instr.op, getOperandReference(instr.src), "%eax"));
		addAssemblyLine("mov %eax, " + getOperandReference(instr.dst));
	}

	@Override
	public void visit(CompareInstr instr) {
		addAssemblyLine("mov " + getOperandReference(instr.dst) + ", %eax");
		addAssemblyLine(String.format("%s %s, %s", instr.op, getOperandReference(instr.src), "%eax"));
	}

	@Override
	public void visit(UnaryOpInstr instr) {
		addAssemblyLine("mov " + getOperandReference(instr.dst) + ", %eax");
		addAssemblyLine(String.format("%s %s", instr.op, "%eax"));
		addAssemblyLine("mov %eax, " + getOperandReference(instr.dst));
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
		addAssemblyLine("mov " + getOperandReference(instr.base) + ", %eax");
		addAssemblyLine("mov " + getOperandReference(instr.offset) + ", %ebx");
		if (instr.isLoad)
			addAssemblyLine(String.format("mov (%s,%s,4), %s", "%eax", "%ebx", getOperandReference(instr.mem)));
		else
			addAssemblyLine(String.format("mov %s, (%s,%s,4)", getOperandReference(instr.mem), "%eax", "%ebx"));
	}

	@Override
	public void visit(MoveFieldInstr instr) {
		addAssemblyLine("mov "+getOperandReference(instr.base)+", %eax");
		addAssemblyLine("mov " + getOperandReference(instr.offset) + ", %ebx");
		if(instr.isLoad) {
			addAssemblyLine(String.format("move (%s,%s,4), %s", "%eax", "%ebx", getOperandReference(instr.mem)));
		} else {
			addAssemblyLine(String.format("move %s, (%s,%s,4)", getOperandReference(instr.mem), "%eax", "%ebx"));
		}
	}

	@Override
	public void visit(ArrayLengthInstr instr) {
		addAssemblyLine("mov " + getOperandReference(instr.arr) + ", %eax");
		addAssemblyLine("mov -4(%eax), %eax)");
		addAssemblyLine("mov %eax, " + getOperandReference(instr.dst));
		
	}

	@Override
	public void visit(JumpInstr instr) {
		addAssemblyLine("JMP "+instr.label);
	}

	@Override
	public void visit(CondJumpInstr instr) {
		switch(instr.cond) {
		case True:
			addAssemblyLine("JNZ "+instr.label);
			break;
		case False:
			addAssemblyLine("JZ "+instr.label);
			break;
		case G:
			addAssemblyLine("JG "+instr.label);
			break;
		case GE:
			addAssemblyLine("JGE "+instr.label);
			break;
		case L:
			addAssemblyLine("JL "+instr.label);
			break;
		case LE:
			addAssemblyLine("JLE "+instr.label);
			break;
		}
	}

	@Override
	public void visit(StaticCall instr) {
		for (int i = instr.args.size() - 1; i >= 0; i--) {
			addAssemblyLine("mov " + getOperandReference(instr.args.get(i).op) + ", %eax");
			addAssemblyLine("push %eax");
		}
		addAssemblyLine("call " + instr.func.name);
		if (instr.args.size() > 0)
			addAssemblyLine("add $" + Integer.toString(instr.args.size() * 4) + ", %esp");
		addAssemblyLine("mov %eax, " + getOperandReference(instr.dst));
		
	}

	@Override
	public void visit(VirtualCall instr) {
		addAssemblyLine("mov " + getOperandReference(instr.obj) + ", %eax");
		for (int i = instr.args.size() - 1; i >= 0; i--) {
			addAssemblyLine("mov " + getOperandReference(instr.args.get(i).op) + ", %ebx");
			addAssemblyLine("push %ebx");
		}
		addAssemblyLine("push %eax");
		addAssemblyLine("mov (%eax), %eax");
		addAssemblyLine("call *" + (((Immediate)instr.func).val * 4) + "(%eax)");
		if (instr.args.size() > 0)
			addAssemblyLine("add $" + Integer.toString((instr.args.size() + 1) * 4) + ", %esp");
		addAssemblyLine("mov %eax, " + getOperandReference(instr.dst));
	}

	@Override
	public void visit(LibraryCall instr) {
		for (int i = instr.args.size() - 1; i >= 0; i--) {
			addAssemblyLine("mov " + getOperandReference(instr.args.get(i)) + ", %eax");
			addAssemblyLine("push %eax");
		}
		addAssemblyLine("call " + instr.func.name);
		if (instr.args.size() > 0)
			addAssemblyLine("add $" + Integer.toString(instr.args.size() * 4) + ", %esp");
		addAssemblyLine("mov %eax, " + getOperandReference(instr.dst));
	}

	@Override
	public void visit(ReturnInstr instr) {
		addAssemblyLine("mov " + getOperandReference(instr.dst) + ", %eax");
		addAssemblyLine("ret");
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
		addAssemblyLine("sub $" + (getCurrentAssemblyMethod().getStackFrameSize() * 4) + ", %esp");
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
	
	private String getOperandReference(Operand operand) {
		if (operand instanceof Immediate)
			return "&" + Integer.toString(((Immediate)operand).val);
		else 
			return Integer.toString(getCurrentAssemblyMethod().getStackOffset(operand.toString())) + "(%ebp)";
	}
}
