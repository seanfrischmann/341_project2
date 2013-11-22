module one_bit_alu();
	wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;
	wire a1, a2, b1, b2, b3, b4, c2, cout, d1, l1, r1, op3, op4, out, s1, sub2;
	reg a, b, cin, op1, op2, sub1;

	and
		g3(w1, b1, sub2),				//subtract
		g4(w2, b2, sub1),				//
		g7(w3, cin, a1),				//carry out
		g8(w4, cin, b3),				//
		g9(w5, a1, b3),					//
		g10(w6, a2, c2, b3),			//sum
		g11(w7, b4, c2, a1),			//
		g12(w8, b4, a2, cin),			//
		g13(w9, cin, b3, a1),			//
		g14(d1, a1, b1),				//and
		g21(w10, s1, op3, op2),			//multiplexer
		g22(w11, d1, op3, op4),			//
		g23(w12, l1, op1, op2),			//
		g24(w13, r1, op4, op1);			//
	or
		g5(b3, w1, w2),					//subtract
		g16(cout, w3, w4, w5),			//carry out
		g17(s1, w6, w7, w8, w9),		//sum
		g15(r1, a1, b1),				//or
		g26(out, w10, w11, w12, w13);	//multiplexer
	not
		g1(sub2, sub1),					//subtract
		g2(b2, b1),						//
		g6(c2, cin),					//sum
		g18(a2, a1),					//
		g19(b4, b3),					//
		g20(op3, op1),					//mulitplexer
		g25(op4, op2);					//

endmodule
