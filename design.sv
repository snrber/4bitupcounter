// 4-bit Up Counter

  module up_counter(
    input clk,
    input reset,
    input enable,
    output reg [3:0] count
  );

  always @(posedge clk) begin
    if (reset)				// If reset = 1
      count <= 4'b0000;		// count = 0, counter resets to 0 (or, in binary: 0000)
    else if (enable)
      count <= count + 1;
  end
  
endmodule