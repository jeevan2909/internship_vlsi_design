
module alu4 (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] OP,
    output reg [3:0] RESULT,
    output reg CARRY,
    output ZERO
);

    reg [4:0] TEMP;

    always @(*) begin
        RESULT = 4'b0000;
        CARRY  = 1'b0;
        TEMP   = 5'b00000;

        case (OP)

            3'b000: begin
                TEMP = {1'b0, A} + {1'b0, B};
                RESULT = TEMP[3:0];
                CARRY = TEMP[4];
            end

            3'b001: begin
                TEMP = {1'b0, A} - {1'b0, B};
                RESULT = TEMP[3:0];
                CARRY = TEMP[4];
            end

            3'b010: RESULT = A & B;
            3'b011: RESULT = A | B;
            3'b100: RESULT = A ^ B;
            3'b101: RESULT = ~A;

            3'b110: begin
                RESULT = A << 1;
                CARRY = A[3];
            end

            3'b111: begin
                RESULT = A >> 1;
                CARRY = A[0];
            end

            default: RESULT = 4'b0000;

        endcase
    end

    assign ZERO = (RESULT == 4'b0000);

endmodule
