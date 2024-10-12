module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

wire [3:0] a0 = a[3:0];
wire [3:0] a1 = a[7:4];
wire [3:0] a2 = a[11:8];
wire [3:0] a3 = a[15:12];

wire [3:0] b0 = b[3:0];
wire [3:0] b1 = b[7:4];
wire [3:0] b2 = b[11:8];
wire [3:0] b3 = b[15:12];

wire cout0, cout1, cout2;


wire [3:0] s0;
wire [3:0] s1;
wire [3:0] s2;
wire [3:0] s3;

bcd_fadd u0_bcd_fadd(
    .a(a0),
    .b(b0),
    .cin(cin),
    .cout(cout0),
    .sum(s0)
);

bcd_fadd u1_bcd_fadd(
    .a(a1),
    .b(b1),
    .cin(cout0),
    .cout(cout1),
    .sum(s1)
);

bcd_fadd u2_bcd_fadd(
    .a(a2),
    .b(b2),
    .cin(cout1),
    .cout(cout2),
    .sum(s2)
);

bcd_fadd u3_bcd_fadd(
    .a(a3),
    .b(b3),
    .cin(cout2),
    .cout(cout),
    .sum(s3)
);

assign sum[3:0]   = s0;
assign sum[7:4]   = s1;
assign sum[11:8]  = s2;
assign sum[15:12] = s3;

endmodule

