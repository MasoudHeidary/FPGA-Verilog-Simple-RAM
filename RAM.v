`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MasoudHeidaryDeveloper@gmail.com
// 
// Create Date:    23:07:56 05/30/2021 
// Design Name: 
// Module Name:    RAM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

// 1KByte RAM
module RAM(
    input [9:0] Address,
    inout [7:0] Data,
    input RW,               // 0->read 1->write
    input En,
    input clk
    );

    reg [7:0] Memory[1023:0];
    reg [7:0] temp = 7'Hz;
    assign Data = RW ? 8'Hz : temp;

    always @(posedge clk)
    begin
        if(En)
        begin
            if(!RW)
            begin
            // want read from RAM
                temp <= Memory[Address];
                $display("RAM: read data from address %b",
                Address
                );
            end
            else
            begin
            // want write to RAM
                Memory[Address] <= Data;
                $display("RAM: write data %b to address %b",
                Data,
                Address
                );
            end
        end
        else
        begin
            temp = 8'HZ;
            $display("RAM: not enable");
        end
    end
endmodule