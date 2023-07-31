`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2023 21:00:11
// Design Name: 
// Module Name: ALU
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
module alu(
           a         ,  //input
           b         ,  //input
           select    ,  //input
           zero      ,  //zero flag
           carry     ,  //carry flag
           sign      ,  //sign flag
           parity    ,  //parity flag
           overflow  ,  //overflow flag
           out          //output
           )         ;

input [3:0]a, b                                 ;
input [1:0] select                              ;
output reg [3:0]out                             ;
output reg zero, carry, sign, parity, overflow  ;

always @ (a or b)
   begin
      case (select)
         0 : {carry, out} = a + b   ;
         1 : {carry, out} = a - b   ;
         2 : {carry, out} = a * b   ;
         3 : {carry, out} = a / b   ;
      endcase
      zero     =  ~|out                                              ;
      sign     =  out[3]                                             ;
      parity   =  ~^out                                              ;
      overflow =  (a[3] & b[3] & ~out[3]) | (~a[3] & ~b[3] & out[3]) ;
   end
endmodule