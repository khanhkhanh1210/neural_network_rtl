all: clean run
#verify:
#	xmvlog -64bit -sv -linedebug -f $(WORKAREA)/03_verif/verif/script/rtl.f \
		-logfile $(WORKAREA)/03_verif/sim_result/rtl.log

#tb: 
#	xmsim -64bit -sv -f $(WORKAREA)/03_verif/verif/script/ben.f \
		-logfile $(WORKAREA)/03_verif/sim_result/ben.log \

run:
	        xrun -64bit -access +rwc -f $(WORKAREA)/03_verif/verif/script/rtl.f \
			-l $(WORKAREA)/03_verif/sim_result/sim.log \
			-timescale 1ns/1ps 

#syn: clean
#	genus -f genus_shell.tcl

clean:
	rm -rf *.cmd* *.log*	
