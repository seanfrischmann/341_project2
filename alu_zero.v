/*
******************************************************************
* One Bit ALU
******************************************************************
*/
`timescale 1ns/1ns
module one_bit_alu(a,b,c,sum,cout,op1,op2,out,sub,less);
		input a, b, c, op1, op2, sub, less;
		output cout, out, sum;
		//wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;
		//wire  a2, b2, b3, b4, c2, cout, d1, less, r1, op3, op4, out, sum, sub2;
		//reg a, b, c, op1, op2, sub;

		and
			g3(w1, b, sub2),				//subtract
			g4(w2, b2, sub),				//
			g7(w3, c, a),					//carry out
			g8(w4, c, b3),					//
			g9(w5, a, b3),					//
			g14(d1, a, b),					//and
			g21(w10, sum, op1, op4),		//multiplexer
			g22(w11, d1, op3, op4),			//
			g23(w12, less, op1, op2),		//
			g24(w13, r1, op3, op2);			//
		xor
			xg1(w6, a, b3),					//sum
			xg2(sum, w6, c);				//
		or
			g5(b3, w1, w2),					//subtract
			g16(cout, w3, w4, w5),			//carry out
			g15(r1, a, b),					//or
			g26(out, w10, w11, w12, w13);	//multiplexer
		not
			g1(sub2, sub),					//subtract
			g2(b2, b),						//
			g20(op3, op1),					//mulitplexer
			g25(op4, op2);					//
/*
******************************************************************
* Simulator--> comment out input and output, uncomment wire's and 
* reg, remove variables from one_bit_alu.
******************************************************************
*/
/*
	initial
		begin
			$monitor($time,,,, "a=%b, b=%b, c=%b, op1=%b, op2=%b, sub=%b, cout=%b, out=%b" ,a,b,c,op1,op2,sub,cout,out);
			$display($time,,,, "a=%b, b=%b, c=%b, op1=%b, op2=%b, sub=%b, cout=%b, out=%b" ,a,b,c,op1,op2,sub,cout,out);
			#10	a=0; b=0; c=0; op1=0; op2=0; sub=0;
			#10	a=1;
			#10	b=1;
			#10	sub=1; c=cout;
			#10 op1=1;
			#10
			$display($time,,,, "a=%b, b=%b, c=%b, op1=%b, op2=%b, sub=%b, cout=%b, out=%b" ,a,b,c,op1,op2,sub,cout,out);
		end
*/
endmodule
/*
******************************************************************
* Thirty two Bit ALU
******************************************************************
*/
module thirty_two_alu(a,b,cin,sum,cout,op1,op2,out,sub, zero);
		input	[31:0]	a,b,op1,op2,sub;
		output	[31:0]	sum,out;
		input	cin;
		output	cout, zero;
		wire	c[31:0];

		one_bit_alu	a0	(a[0] ,b[0], cin, sum[0], c[0], op1[0], op2[0], out[0], sub[0], less);
		one_bit_alu	a1	(a[1] ,b[1], c[0], sum[1], c[1], op1[1], op2[1], out[1], sub[1], 0);
		one_bit_alu	a2	(a[2] ,b[2], c[1], sum[2], c[2], op1[2], op2[2], out[2], sub[2], 0);
		one_bit_alu	a3	(a[3] ,b[3], c[2], sum[3], c[3], op1[3], op2[3], out[3], sub[3], 0);
		one_bit_alu	a4	(a[4] ,b[4], c[3], sum[4], c[4], op1[4], op2[4], out[4], sub[4], 0);
		one_bit_alu	a5	(a[5] ,b[5], c[4], sum[5], c[5], op1[5], op2[5], out[5], sub[5], 0);
		one_bit_alu	a6	(a[6] ,b[6], c[5], sum[6], c[6], op1[6], op2[6], out[6], sub[6], 0);
		one_bit_alu	a7	(a[7] ,b[7], c[6], sum[7], c[7], op1[7], op2[7], out[7], sub[7], 0);
		one_bit_alu	a8	(a[8] ,b[8], c[7], sum[8], c[8], op1[8], op2[8], out[8], sub[8], 0);
		one_bit_alu	a9	(a[9] ,b[9], c[8], sum[9], c[9], op1[9], op2[9], out[9], sub[9], 0);
		one_bit_alu	a10	(a[10] ,b[10], c[9], sum[10], c[10], op1[10], op2[10], out[10], sub[10], 0);
		one_bit_alu	a11	(a[11] ,b[11], c[10], sum[11], c[11], op1[11], op2[11], out[11], sub[11], 0);
		one_bit_alu	a12	(a[12] ,b[12], c[11], sum[12], c[12], op1[12], op2[12], out[12], sub[12], 0);
		one_bit_alu	a13	(a[13] ,b[13], c[12], sum[13], c[13], op1[13], op2[13], out[13], sub[13], 0);
		one_bit_alu	a14	(a[14] ,b[14], c[13], sum[14], c[14], op1[14], op2[14], out[14], sub[14], 0);
		one_bit_alu	a15	(a[15] ,b[15], c[14], sum[15], c[15], op1[15], op2[15], out[15], sub[15], 0);
		one_bit_alu	a16	(a[16] ,b[16], c[15], sum[16], c[16], op1[16], op2[16], out[16], sub[16], 0);
		one_bit_alu	a17	(a[17] ,b[17], c[16], sum[17], c[17], op1[17], op2[17], out[17], sub[17], 0);
		one_bit_alu	a18	(a[18] ,b[18], c[17], sum[18], c[18], op1[18], op2[18], out[18], sub[18], 0);
		one_bit_alu	a19	(a[19] ,b[19], c[18], sum[19], c[19], op1[19], op2[19], out[19], sub[19], 0);
		one_bit_alu	a20	(a[20] ,b[20], c[19], sum[20], c[20], op1[20], op2[20], out[20], sub[20], 0);
		one_bit_alu	a21	(a[21] ,b[21], c[20], sum[21], c[21], op1[21], op2[21], out[21], sub[21], 0);
		one_bit_alu	a22	(a[22] ,b[22], c[21], sum[22], c[22], op1[22], op2[22], out[22], sub[22], 0);
		one_bit_alu	a23	(a[23] ,b[23], c[22], sum[23], c[23], op1[23], op2[23], out[23], sub[23], 0);
		one_bit_alu	a24	(a[24] ,b[24], c[23], sum[24], c[24], op1[24], op2[24], out[24], sub[24], 0);
		one_bit_alu	a25	(a[25] ,b[25], c[24], sum[25], c[25], op1[25], op2[25], out[25], sub[25], 0);
		one_bit_alu	a26	(a[26] ,b[26], c[25], sum[26], c[26], op1[26], op2[26], out[26], sub[26], 0);
		one_bit_alu	a27	(a[27] ,b[27], c[26], sum[27], c[27], op1[27], op2[27], out[27], sub[27], 0);
		one_bit_alu	a28	(a[28] ,b[28], c[27], sum[28], c[28], op1[28], op2[28], out[28], sub[28], 0);
		one_bit_alu	a29	(a[29] ,b[29], c[28], sum[29], c[29], op1[29], op2[29], out[29], sub[29], 0);
		one_bit_alu	a30	(a[30] ,b[30], c[29], sum[30], c[30], op1[30], op2[30], out[30], sub[30], 0);
		one_bit_alu	a31	(a[31] ,b[31], c[30], sum[31], cout, op1[31], op2[31], out[31], sub[31], 0);
		nor
			ng(zero, out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7], out[8], out[9], out[10], out[11], out[12], out[13], out[14], out[15], out[16], out[17], out[18], out[19], out[20], out[21], out[22], out[23], out[24], out[25], out[26], out[27], out[28], out[29], out[30], out[31]);
		xor
			xg1(overflow, cin, cout),
			xg2(less, overflow, sum[31]);
endmodule
/*
******************************************************************
* Testbench for 32 bit ALU
******************************************************************
*/
// **Test Bench** //
module testbench();
		wire[31:0]	a,b,sum,op1,op2,out,sub;
		wire	cin,cout, zero;
			testALU	test	(a,b,cin,sum,cout,op1,op2,out,sub, zero);
			thirty_two_alu	alu	(a,b,cin,sum,cout,op1,op2,out,sub, zero);
endmodule
// **Test ALU** //
module testALU(a,b,cin,sum,cout,op1,op2,out,sub, zero);
		input[31:0]	sum,out;
		input	cout, zero;
		output[31:0]	a,b,op1,op2,sub;
		output	cin;
		reg[31:0]	a,b,op1,op2,sub;
		reg	cin;
// ***********Simulation*********** //
	initial
		begin
			$monitor($time,, "a=%d, b=%d, c=%b, op1=%d, op2=%d, sub=%d, cout=%b, sum=%d, out=%d, zero=%d" ,a,b,cin,op1,op2,sub,cout,sum,out,zero);
			$display($time,, "a=%d, b=%d, c=%b, op1=%d, op2=%d, sub=%d, cout=%b, sum=%d, out=%d, zero=%d" ,a,b,cin,op1,op2,sub,cout,sum,out,zero);
			#10	a=0; b=0; cin=0; op1=0; op2=0; sub=0;
			#10	a=40;
			#10	b=10;
			#10 op1=1;
			#10 sub=1;
			#10	a=400;
			#10	b=100;
			#10 op1=0;
			#10 op2=1;
			#10	sub=0;
			#10	b=0;
			#10 op1=1;
			#10 sub=1;
			#10	a=60;
			#10	b=30;
			#10 op1=0;
			#10 sub=0;
			#10 op2=0;
			#10	a=400000000;
			#10	b=100000000;
			#10 op1=1;
			#10 sub=1;
			#10	a=40;
			#10	b=10;
			#10 op2=1;
			#10 sub=0;
			#10 op1=0;
			#10 sub=1;
			#10
			#20	a=40;
			#20	b=10;
			#20 op1=1;
			#20 sub=1;
			#20 a=10;
			#20
			$display($time,, "a=%d, b=%d, c=%b, op1=%d, op2=%d, sub=%d, cout=%b, sum=%d, out=%d, zero=%d" ,a,b,cin,op1,op2,sub,cout,sum,out,zero);
		end
endmodule
