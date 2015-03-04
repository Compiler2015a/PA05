package IC.CodeGeneration;

import java.util.ArrayList;
import java.util.List;

import IC.lir.Instructions.*;

public class CodeGenerator implements IC.lir.Instructions.Visitor {
	
	private List<Instruction> instructionsList;
	private StringBuffer assemblyStrBuffer;
	
	public CodeGenerator(List<Instruction> instructionsList) {
		this.instructionsList = instructionsList;
		this.assemblyStrBuffer = new StringBuffer("");
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
		// TODO Auto-generated method stub
		
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
}
