`timescale 1ns / 1ps

module TB;   
    reg Button, clk, rst;
    wire [1:0] Y;
    
    Volume v(Y, clk, Button, rst);
    
    initial begin
      clk = 1'b0;
      rst = 1'b0;
    end
    
    always begin
        #1 clk = ~clk;
    end
      
    initial begin
      $monitor($time, ": Button: %x, ANS: %x", Button, Y);
      Button = 1'b0;
      #2;
      rst = 1'b1;
      Button = 1'b1;
      #10;
    end
endmodule
