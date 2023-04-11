`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 10:24:48
// Design Name: 
// Module Name: ADDTiming
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ADDTiming(
    input [19:0]data,
    input clk,
    input rst_n,
    output reg [19:0] result
);

    reg intermediate_result;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)begin
            intermediate_result <= 0;
            result <= 0;
        end
        else begin
            // 处理input，将结果存储到intermediate_result中
            intermediate_result <= data;

            // 将intermediate_result写入output
            result <= intermediate_result;
        end
    end
endmodule
