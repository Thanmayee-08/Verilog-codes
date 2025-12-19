`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2025 17:51:21
// Design Name: 
// Module Name: code
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


// ============================================
// FULL ADDER - DATAFLOW MODEL
// ============================================
module full_adder_dataflow (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    // Dataflow modeling using assign statements
    assign sum = a ^ b ^ cin;           // XOR operation for sum
    assign cout = (a & b) | (b & cin) | (a & cin);  // Carry out logic
endmodule