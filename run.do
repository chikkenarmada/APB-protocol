vlog APB_DUT.sv APB_TOP.sv +acc
vsim -assertdebug apb_top -l run.log  +UVM_TESTNAME=apb_test +UVM_NO_RELNOTES
do wave.do
run -all

