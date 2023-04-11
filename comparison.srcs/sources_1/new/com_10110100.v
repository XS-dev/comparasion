`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 14:20:38
// Design Name: 
// Module Name: com_10110100
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


module com_10110100(
    input [10239:0] cmp_512,
    input en,
    input rst_n,
    input clk,
    output [19:0]biggst
);
    //    wire [19:0] cmp_256[255:0];
    wire [19:0] cmp_256[255:0];
    wire [19:0] cmp_128[127:0];
    wire [19:0] cmp_64[63:0];
    wire [19:0] cmp_32[31:0];
    wire [19:0] cmp_16[15:0];
    wire [19:0] cmp_8[7:0];
    wire [19:0] cmp_4[3:0];
    wire [19:0] cmp_2[1:0];

    wire [19:0] cmp_256_tmp[255:0];
//    wire [19:0] cmp_128_tmp[127:0];
    wire [19:0] cmp_64_tmp[63:0];
    wire [19:0] cmp_32_tmp[31:0];
//    wire [19:0] cmp_16_tmp[15:0];
    wire [19:0] cmp_8_tmp[7:0];
//    wire [19:0] cmp_4_tmp[3:0];
//    wire [19:0] cmp_2_tmp[1:0];

    genvar i;
    generate
        for(i=0; i<256; i=i+1)
        begin: Compare_512
            compare_20 u_com_512(
                .rst_n(rst_n),
                .en(en),
                .num1(cmp_512[i*40+19:i*40]),
                .num2(cmp_512[i*40+39:i*40+20]),
                .greater(cmp_256[i])
            );
        end
        for(i=0; i<256; i=i+1)
        begin: T_512
            ADDTiming u_ADDTiming_512(
                .rst_n(rst_n),
                .clk(clk),
                .data(cmp_256[i]),
                .result(cmp_256_tmp[i])
            );
        end


        for(i=0; i<128; i=i+1)
        begin: Compare_256
            compare_20 u_com_256(
                .rst_n(rst_n),
                .en(en),
                .num1(cmp_256_tmp[i*2]),
                .num2(cmp_256_tmp[i*2+1]),
                .greater(cmp_128[i])
            );
        end
        
        for(i=0; i<64; i=i+1)
        begin: Compare_128
            compare_20 u_com_128(
                .rst_n(rst_n),
                .en(en),
                .num1(cmp_128[i*2]),
                .num2(cmp_128[i*2+1]),
                .greater(cmp_64[i])
            );
        end
        for(i=0; i<64; i=i+1)
        begin: T_128
            ADDTiming u_ADDTiming_128(
                .rst_n(rst_n),
                .clk(clk),
                .data(cmp_64[i]),
                .result(cmp_64_tmp[i])
            );
        end

        for(i=0; i<32; i=i+1)
        begin: Compare_64
            compare_20 u_com_64(
                .rst_n(rst_n),
                .en(en),
                .num1(cmp_64_tmp[i*2]),
                .num2(cmp_64_tmp[i*2+1]),
                .greater(cmp_32[i])
            );
        end
        for(i=0; i<32; i=i+1)
        begin: T_64
            ADDTiming u_ADDTiming_64(
                .rst_n(rst_n),
                .clk(clk),
                .data(cmp_32[i]),
                .result(cmp_32_tmp[i])
            );
        end
        for(i=0; i<16; i=i+1)
        begin: Compare_32
            compare_20 u_com_32(
                .rst_n(rst_n),
                .en(en),
                .num1(cmp_32_tmp[i*2]),
                .num2(cmp_32_tmp[i*2+1]),
                .greater(cmp_16[i])
            );
        end
        for(i=0; i<8; i=i+1)
        begin: Compare_16
            compare_20 u_com_16(
                .rst_n(rst_n),
                .en(en),
                .num1(cmp_16[i*2]),
                .num2(cmp_16[i*2+1]),
                .greater(cmp_8[i])
            );
        end
        for(i=0; i<8; i=i+1)
        begin: T_16
            ADDTiming u_ADDTiming_16(
                .rst_n(rst_n),
                .clk(clk),
                .data(cmp_8[i]),
                .result(cmp_8_tmp[i])
            );
        end
        for(i=0; i<4; i=i+1)
        begin: Compare_8
            compare_20 u_com_8(
                .rst_n(rst_n),
                .en(en),
                .num1(cmp_8_tmp[i*2]),
                .num2(cmp_8_tmp[i*2+1]),
                .greater(cmp_4[i])
            );
        end
        for(i=0; i<2; i=i+1)
        begin: Compare_4
            compare_20 u_com_4(
                .rst_n(rst_n),
                .en(en),
                .num1(cmp_4[i*2]),
                .num2(cmp_4[i*2+1]),
                .greater(cmp_2[i])
            );
        end
        compare_20 u_com_2(
            .rst_n(rst_n),
            .en(en),
            .num1(cmp_2[0]),
            .num2(cmp_2[1]),
            .greater(biggst)
        );
    endgenerate

endmodule
