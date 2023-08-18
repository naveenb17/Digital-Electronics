`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2023 19:42:48
// Design Name: 
// Module Name: shifter_16bit
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


module shifter_16bit(data, shift_amt, op);
    input [15:0]data, shift_amt;
    output [15:0] op;
    assign op = data << shift_amt; 
endmodule


module shifter_tb();
    reg [15:0] data_in, shift_amt;
    wire [15:0]op;
    
    shifter_16bit CUT(data_in, shift_amt, op);
    
    initial begin
        data_in = 16'h0001;
        shift_amt = 16'h0001;
        #10 shift_amt = 16'h0002;
        #10 $finish;
    end 
endmodule;