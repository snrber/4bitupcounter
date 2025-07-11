// Testbench

module testbench;
  
reg clk;
reg reset;
reg enable;
wire [3:0] count;
  
// Instantiate the counter
up_counter uut (
  .clk(clk),
  .reset(reset),
  .enable(enable),
  .count(count)
);
  
// Clock generation
always #5 clk = ~clk;
  
initial begin
  $dumpfile("waveform.vcd");
  $dumpvars(0, testbench);
    
  // Initialise signals
  clk = 0;
  reset = 1;
  enable = 0;
    
  #10 reset = 0; enable = 1; // Start counting
  #100 enable = 0;		  // Stop counting
  #20 enable = 1;			  // Start again
  #50 reset = 1;			  // Reset
  #10 reset = 0; enable = 1;
    
  #50 $finish;
    
end
  
endmodule