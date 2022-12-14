module CLOCK_DIVIDER #(parameter RATIO_WIDTH =5)(
input       wire                     i_ref_clk,
input       wire                     i_rst_n,
input       wire                     i_clk_en,
input       wire  [RATIO_WIDTH-1:0]  i_div_ratio,

output      reg                      o_div_clk
);

//counters
reg  [RATIO_WIDTH-1:0] COUNTER;
reg  ft_flag;
wire [RATIO_WIDTH-1:0] even_toggle;
wire [RATIO_WIDTH-1:0] First_odd_toggle;
wire [RATIO_WIDTH-1:0] Second_odd_toggle;

always@(posedge i_ref_clk or negedge i_rst_n)
    begin
       if(!i_rst_n)
        begin 
         o_div_clk<=i_ref_clk;
         COUNTER<='b1;
         ft_flag<='b1;
        end
       else if(i_div_ratio=='d0 || i_div_ratio=='d1 || !i_clk_en)
        begin 
         o_div_clk<=i_ref_clk;
         ft_flag<='b1;
        end
       else if(!(i_div_ratio[0]) && i_clk_en )                             //Even Ratio
        begin
          if(COUNTER == even_toggle)
           begin
             COUNTER<='b1;
             o_div_clk=~o_div_clk; 
           end
         else
            begin
              COUNTER<=COUNTER+1;
            end
        end

       else if(i_div_ratio[0] && i_clk_en)                              //Odd Ratio
        begin
          if(((COUNTER==First_odd_toggle)&&ft_flag)||((COUNTER==Second_odd_toggle)&&!ft_flag))
            begin
              ft_flag<=~ft_flag;
              o_div_clk<=~o_div_clk;
              COUNTER<='b1;
            end
          else
            begin
              COUNTER<=COUNTER+1;
            end  
        end   
     end


always@(negedge i_ref_clk or negedge i_rst_n)
    begin
       if(!i_rst_n)
        begin 
         ft_flag<='b1;
         o_div_clk<=i_ref_clk;
         COUNTER<='b1;
         end
       else if(i_div_ratio=='d0 || i_div_ratio=='d1 || !i_clk_en)
        begin 
        o_div_clk<=i_ref_clk;
        ft_flag<='b1;
        COUNTER<='b1;
        end   
      end

assign even_toggle = i_div_ratio >>1;
assign First_odd_toggle = i_div_ratio >>1;
assign Second_odd_toggle = (i_div_ratio >>1)+1;

endmodule