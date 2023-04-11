`timescale 1ns / 1ps
module compare_20(
    input [19:0] num1,
    input [19:0] num2,
    input rst_n,
    input en,
    output[19:0] greater
);
    
// Check if num1 is equal to num2
assign greater = (!rst_n || !en)?0:(num1 >= num2)?num1:num2;

endmodule
