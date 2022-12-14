`timescale 1ns/1ps
module CLOCK_DIVIDER_tb;

//parameters
parameter RATIO_WIDTH_TB=5;
parameter CLOCK=10;

reg                        i_ref_clk_tb;
reg                        i_rst_n_tb;
reg                        i_clk_en_tb;
reg  [RATIO_WIDTH_TB-1:0]  i_div_ratio_tb;

wire                       o_div_clk_tb;

initial
  begin
   
   $dumpfile("CLOCK DIVIDER.vcd");
   $dumpvars;

   initialize();
   reset();


//////////////////////////////////////////// case 1  /////////////////////////////////// 
$display ("\ncase 1 output clock must be the same of input");
i_clk_en_tb='b0;
#CLOCK;
#CLOCK;
#CLOCK;

if(o_div_clk_tb==i_ref_clk_tb)
$display ("case 1p1 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 1p1 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#(CLOCK/2);

if(o_div_clk_tb==i_ref_clk_tb)
$display ("case 1p2 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 1p2 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);


//////////////////////////////////////////// case 2  /////////////////////////////////// 
$display ("\ncase 2 output clock must be the same of input");
i_clk_en_tb='b1;
i_div_ratio_tb='b1;

#CLOCK;
#CLOCK;
#CLOCK;

if(o_div_clk_tb==i_ref_clk_tb)
$display ("case 2p1 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 2p1 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#(CLOCK/2);

if(o_div_clk_tb==i_ref_clk_tb)
$display ("case 2p2 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 2p2 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);



//////////////////////////////////////////// case 3 odd dividing ratio /////////////////////////////////// 
$display ("\ncase 3 output clock must be dividing by 5 of input");
i_clk_en_tb='b1;
i_div_ratio_tb='d5;

#CLOCK;
#CLOCK;
#CLOCK;
#CLOCK;
#CLOCK;

if(o_div_clk_tb=='b1)
$display ("case 3p1 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 3p1 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#CLOCK;
if(o_div_clk_tb=='b1)
$display ("case 3p2 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 3p2 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#CLOCK;
if(o_div_clk_tb=='b0)
$display ("case 3p3 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 3p3 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#CLOCK;
if(o_div_clk_tb=='b0)
$display ("case 3p4 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 3p4 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#CLOCK;
if(o_div_clk_tb=='b0)
$display ("case 3p5 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 3p5 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);


///////////////////////////////////////////////   case 4 even diving ratio ////////////////////////////////////////
$display ("\ncase 4 output clock must be dividing by 6 of input");
i_clk_en_tb='b1;
i_div_ratio_tb='d6;

#CLOCK;
#CLOCK;
#CLOCK;
#CLOCK;
#CLOCK;
#CLOCK;
#CLOCK;

if(o_div_clk_tb=='b1)
$display ("case 4p1 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 4p1 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#CLOCK;
if(o_div_clk_tb=='b1)
$display ("case 4p2 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 4p2 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#CLOCK;
if(o_div_clk_tb=='b1)
$display ("case 4p3 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 4p3 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#CLOCK;
if(o_div_clk_tb=='b0)
$display ("case 4p4 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 4p4 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#CLOCK;
if(o_div_clk_tb=='b0)
$display ("case 4p5 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 4p5 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);

#CLOCK;
if(o_div_clk_tb=='b0)
$display ("case 4p6 CORRECT ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);
else
$display ("case 4p6 FALSE   ,i_rst_n_tb=%b  ,i_clk_en_tb=%b  ,i_div_ratio_tb=%b  ,o_div_clk_tb=%b",i_rst_n_tb,i_clk_en_tb,i_div_ratio_tb,o_div_clk_tb);



#CLOCK;
#CLOCK;
#CLOCK;
#CLOCK;
#CLOCK;
#CLOCK;
$stop;

  end

task initialize ;
  begin
    i_ref_clk_tb   ='b0;
    i_clk_en_tb    ='b0;
    i_div_ratio_tb ='b0;
  end
endtask

task reset;
  begin
  i_rst_n_tb =1;
  #CLOCK;
  i_rst_n_tb =0;
  #CLOCK;
  i_rst_n_tb=1;
  #CLOCK;  
  end
endtask    

//clock generator
always #(CLOCK/2) i_ref_clk_tb=~i_ref_clk_tb;

//module instantation
CLOCK_DIVIDER 
#(
    .RATIO_WIDTH (RATIO_WIDTH_TB )
)
u_CLOCK_DIVIDER(
    .i_ref_clk   (i_ref_clk_tb   ),
    .i_rst_n     (i_rst_n_tb     ),
    .i_clk_en    (i_clk_en_tb    ),
    .i_div_ratio (i_div_ratio_tb ),
    .o_div_clk   (o_div_clk_tb   )
);

endmodule
