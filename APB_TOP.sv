import uvm_pkg::*;
`include "uvm_macros.svh"
`include "APB_IF.sv"
//`include "APB_DESIGN.sv"
`include "APB_DUT.sv"
`include "APB_SEQ_ITEM.sv"
`include "APB_SEQR.sv"
`include "APB_SEQ.sv"
`include "APB_DRV.sv"
`include "APB_MON1.sv"
`include "APB_MON2.sv"
`include "APB_AGENT1.sv"
`include "APB_AGENT2.sv"
`include "APB_SB.sv"
`include "APB_ENV.sv"
`include "APB_TEST.sv"

`include"APB_ASSERTION.sv"

module apb_top;
bit pclk,prst;

apb_if intf(pclk,prst);
APB_dut dut(intf);
bind apb_design_n apb_asser aa(.pclk(intf.pclk),.prst(intf.prst),.pwrite(intf.pwrite),.paddr(intf.paddr),.pwdata(intf.pwdata),.psel(intf.psel),.pen(intf.pen),.pready(intf.pready),.prdata(intf.prdata));

initial begin
prst=1;
#10;
prst=0;
end

initial begin
pclk=1'b0;
forever #5 pclk=~pclk;
end

initial begin
uvm_config_db#(virtual apb_if)::set(uvm_root::get(),"*","intf",intf);
run_test("apb_test");
end
endmodule

