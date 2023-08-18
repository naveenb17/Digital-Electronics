`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2023 17:32:03
// Design Name: 
// Module Name: reg_bank_16bit
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


module reg_bank_16bit(reg_a, reg_b, rega_select, regb_select, write, write_addr, write_data, reset);
    input [15:0] write_data;
    input [2:0] write_addr, rega_select, regb_select;
    input write, reset;
    output reg [15:0] reg_a, reg_b;
    
    reg [15:0] regs[7:0];
    
    always @(*) begin
        if(reset) begin
            regs[0] <= 16'd0;
            regs[1] <= 16'd1;
            regs[2] <= 16'd2;
            regs[3] <= 16'd0;
            regs[4] <= 16'd0;
            regs[5] <= -16'd3;
            regs[6] <= 16'd0;
            regs[7] <= 16'd0;
            reg_a <= 16'd0;
            reg_b <= 16'd0;
        end
        else if(write) begin
            regs[write_addr] <= write_data;
        end
        else begin
           reg_a <= regs[rega_select];
           reg_b <= regs[regb_select]; 
        end
    end
endmodule
