class apb_seq_item extends uvm_sequence_item;
		`uvm_object_utils(apb_seq_item)

		rand bit [7:0]pwdata;
		rand bit [7:0]paddr;
			 bit psel,pen;
		     bit pwrite;
		     bit pready;
		     bit [7:0]prdata;
		
			bit [7:0] prev_pwdata;
			bit [7:0] prev_paddr;
	
		function new(string name="apb_seq_item");
				super.new(name);
		endfunction

		function void post_randomize();
			
				prev_pwdata=pwdata;
				prev_paddr=paddr;
		endfunction

		constraint post_rand_con {
								  pwdata!=prev_pwdata;
								  pwdata!=prev_pwdata;
								 }
endclass

