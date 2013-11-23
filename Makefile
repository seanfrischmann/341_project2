all:
	iverilog -t vvp alu_zero.v -o out_alu_zero
	iverilog -t vvp alu_unit.v -o out_alu_unit
