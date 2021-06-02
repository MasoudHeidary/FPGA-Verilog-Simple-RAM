`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: MasoudHeidaryDeveloper@gmail.com
// 
// Create Date:    23:08:07 05/30/2021 
// Design Name: 
// Module Name:    test_RAM 
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

module test_RAM(      
    );

    wire [7:0] _data;
    reg [7:0] _data_temp;
    reg [9:0] _address = 0;
    reg _rw = 0;
    reg _en = 0;

    //             want  write      : read;
    assign _data = _rw ? _data_temp : 8'HZ ;

    reg clk = 0;
    always #5 clk = !clk;

    RAM ut(
        .Address(_address),
        .Data(_data),
        .RW(_rw),
        .En(_en),
        .clk(clk)
    );

    initial begin
        _rw <= 1;   //write
        _en <= 0;   //disable
        _data_temp <= 8'HF0;
        _address <= 10'b_0000_0000_11;
        #10;        //should not write the data
        
        _rw <= 0;   //read
        _en <= 1;   //enable
        #10;
        $display("test readed data: %b", _data);      //reurn X

        _rw <= 1;   //write
        _en <= 1;   //enable
        _address <= 10'b_0000_0000_11;
        _data_temp <= 8'b10101010;
        #10;        //should write to memory


        _rw <= 0;    //read
        #10;        //should read from memory same value
        $display("test readed data: %b", _data); 
    end
endmodule