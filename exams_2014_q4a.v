module top_module (
    input wire clk,
    input wire x,
    output wire z
); 

wire a0, a1, a2;
reg q0, q1, q2;
assign a0 = x ^^q0;
assign a1 = x && (!q1);
assign a2 = x || (!q2);

DFF u0(
    .clk(clk),
    .d(a0),
    .q(q0)
);

DFF u1(
    .clk(clk),
    .d(a1),
    .q(q1)
);

DFF u2(
    .clk(clk),
    .d(a2),
    .q(q2)
);

assign z = !(q1||q2||q0);

endmodule

module DFF
(
    input wire clk,
    input wire d,
    output reg q
);

always @ (posedge clk) begin
    q <= d;
end

endmodule
