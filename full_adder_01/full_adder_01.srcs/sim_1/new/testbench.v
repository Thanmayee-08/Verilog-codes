`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2025 17:51:54
// Design Name: 
// Module Name: testbench
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
// 4-BIT FULL ADDER (Ripple Carry)
// ============================================
module full_adder_4bit_dataflow (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
    assign {cout, sum} = a + b + cin;
endmodule

// ============================================
// TESTBENCH for 1-bit Full Adder
// ============================================
module tb_full_adder;
    reg a, b, cin;
    wire sum, cout;
    
    // Instantiate the full adder
    full_adder_dataflow uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin
        $display("========================================");
        $display("    1-Bit Full Adder Truth Table");
        $display("========================================");
        $display("A\tB\tCin\t|\tSum\tCout");
        $display("----------------------------------------");
        
        // Test all 8 combinations
        a = 0; b = 0; cin = 0; #10;
        $display("%b\t%b\t%b\t|\t%b\t%b", a, b, cin, sum, cout);
        
        a = 0; b = 0; cin = 1; #10;
        $display("%b\t%b\t%b\t|\t%b\t%b", a, b, cin, sum, cout);
        
        a = 0; b = 1; cin = 0; #10;
        $display("%b\t%b\t%b\t|\t%b\t%b", a, b, cin, sum, cout);
        
        a = 0; b = 1; cin = 1; #10;
        $display("%b\t%b\t%b\t|\t%b\t%b", a, b, cin, sum, cout);
        
        a = 1; b = 0; cin = 0; #10;
        $display("%b\t%b\t%b\t|\t%b\t%b", a, b, cin, sum, cout);
        
        a = 1; b = 0; cin = 1; #10;
        $display("%b\t%b\t%b\t|\t%b\t%b", a, b, cin, sum, cout);
        
        a = 1; b = 1; cin = 0; #10;
        $display("%b\t%b\t%b\t|\t%b\t%b", a, b, cin, sum, cout);
        
        a = 1; b = 1; cin = 1; #10;
        $display("%b\t%b\t%b\t|\t%b\t%b", a, b, cin, sum, cout);
        
        $display("========================================");
        $display("       Test Completed Successfully");
        $display("========================================");
        $finish;
    end
endmodule

// ============================================
// TESTBENCH for 4-bit Full Adder
// ============================================
module tb_full_adder_4bit;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    
    full_adder_4bit_dataflow uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin
        $display("========================================");
        $display("      4-Bit Full Adder Test");
        $display("========================================");
        $display("Time\tA\tB\tCin\t|\tSum\tCout\t(Decimal)");
        $display("------------------------------------------------------------------------");
        
        // Test Case 1: 0 + 0 + 0 = 0
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        $display("%0t\t%b\t%b\t%b\t|\t%b\t%b\t(%d + %d + %d = %d)", 
                 $time, a, b, cin, sum, cout, a, b, cin, {cout,sum});
        
        // Test Case 2: 5 + 3 + 0 = 8
        a = 4'b0101; b = 4'b0011; cin = 0; #10;
        $display("%0t\t%b\t%b\t%b\t|\t%b\t%b\t(%d + %d + %d = %d)", 
                 $time, a, b, cin, sum, cout, a, b, cin, {cout,sum});
        
        // Test Case 3: 7 + 6 + 0 = 13
        a = 4'b0111; b = 4'b0110; cin = 0; #10;
        $display("%0t\t%b\t%b\t%b\t|\t%b\t%b\t(%d + %d + %d = %d)", 
                 $time, a, b, cin, sum, cout, a, b, cin, {cout,sum});
        
        // Test Case 4: 15 + 1 + 0 = 16 (overflow)
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        $display("%0t\t%b\t%b\t%b\t|\t%b\t%b\t(%d + %d + %d = %d)", 
                 $time, a, b, cin, sum, cout, a, b, cin, {cout,sum});
        
        // Test Case 5: 15 + 15 + 1 = 31 (max overflow)
        a = 4'b1111; b = 4'b1111; cin = 1; #10;
        $display("%0t\t%b\t%b\t%b\t|\t%b\t%b\t(%d + %d + %d = %d)", 
                 $time, a, b, cin, sum, cout, a, b, cin, {cout,sum});
        
        // Test Case 6: 9 + 7 + 1 = 17
        a = 4'b1001; b = 4'b0111; cin = 1; #10;
        $display("%0t\t%b\t%b\t%b\t|\t%b\t%b\t(%d + %d + %d = %d)", 
                 $time, a, b, cin, sum, cout, a, b, cin, {cout,sum});
        
        // Test Case 7: 12 + 10 + 0 = 22
        a = 4'b1100; b = 4'b1010; cin = 0; #10;
        $display("%0t\t%b\t%b\t%b\t|\t%b\t%b\t(%d + %d + %d = %d)", 
                 $time, a, b, cin, sum, cout, a, b, cin, {cout,sum});
        
        $display("========================================");
        $display("       Test Completed Successfully");
        $display("========================================");
        $finish;
    end
    
    // Real-time monitoring
    initial begin
        $monitor("Monitor: Time=%0t A=%d B=%d Cin=%b | Sum=%d Cout=%b", 
                 $time, a, b, cin, sum, cout);
    end
endmodule