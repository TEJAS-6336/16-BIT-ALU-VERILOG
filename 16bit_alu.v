`timescale 1ns / 1ps
module bit_alu(
    input [15:0] a,b,
    input [3:0] sel,
    output reg carry_out,
    output reg [15:0] result
    );
    always@(*)
    begin
    carry_out=0;
    case(sel)
    
    
        4'b0000:result=a+b;//add
        4'b0001:result=a-b;//sub
        4'b0010:result=a&b;//and
        4'b0011:result=a^b;//xor
        4'b0100:result=~(a^b);//xnor
        4'b0101:result=a+1;//increment by 1
        4'b0110:result=a-1;// decrement by 1
        4'b0111:result=~a;// not a
        default:result=16'h0000;// default case
        endcase
        
        if(sel==4'b0000&(a+b>16'hffff))
             carry_out=1;
     end
        
endmodule

module bit_alu_tb;
         reg [15:0] a,b;
         reg [3:0] sel;
         wire carry_out;
         wire [15:0] result;
         
         bit_alu m1(a,b,sel,carry_out,result);
         
         initial
         begin
         #10 a=16'h000A;b=16'h000B; sel=4'b0000; // add
         #10 a=16'h000A;b=16'h000B; sel=4'b0001; // sub
         #10 a=16'h000A;b=16'h000B; sel=4'b0010; // and
         #10 a=16'h000A;b=16'h000B; sel=4'b0011; // xor
         #10 a=16'h000A;b=16'h000B; sel=4'b0100; //  xnor
         #10 a=16'h000A;b=16'h000B; sel=4'b0101; //  increment by 1
         #10 a=16'h000A;b=16'h000B; sel=4'b0110; //  decrement by 1
         #10 $finish;
         end
         
         endmodule
        
