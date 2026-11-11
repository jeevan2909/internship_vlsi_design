
`timescale 1ns/1ps

module alu4_tb;

    reg [3:0] A, B;
    reg [2:0] OP;

    wire [3:0] RESULT;
    wire CARRY, ZERO;

    alu4 uut (
        .A(A),
        .B(B),
        .OP(OP),
        .RESULT(RESULT),
        .CARRY(CARRY),
        .ZERO(ZERO)
    );

    initial begin

        $dumpfile("alu4.vcd");
        $dumpvars(0, alu4_tb);

        $monitor(
            "Time=%0t A=%d B=%d OP=%b RESULT=%d CARRY=%b ZERO=%b",
            $time, A, B, OP, RESULT, CARRY, ZERO
        );

        A=4'd5; B=4'd3; OP=3'b000; #10;
        A=4'd9; B=4'd4; OP=3'b001; #10;
        A=4'd6; B=4'd3; OP=3'b010; #10;
        A=4'd6; B=4'd3; OP=3'b011; #10;
        A=4'd6; B=4'd3; OP=3'b100; #10;
        A=4'd6; B=4'd0; OP=3'b101; #10;
        A=4'd5; B=4'd0; OP=3'b110; #10;
        A=4'd8; B=4'd0; OP=3'b111; #10;

        $finish;
    end

endmodule
