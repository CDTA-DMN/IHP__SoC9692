v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1270 90 2070 490 {flags=graph
y1=-7.1e-05
y2=1.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.0055378439
x2=0.0089776974
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="BGR
VLDO
VA

"
color="7 8 15 11"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 1270 500 2070 900 {flags=graph
y1=-0.074
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.0055378439
x2=0.0089776974
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="
VLDO
RESET

"
color="8 7 16"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 1270 920 2070 1320 {flags=graph
y1=-1.2e-09
y2=6e-05
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.0055378439
x2=0.0089776974
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="
i(vmeas1)
i(vmeas2)
i(vmeas3)
"
color="8 12 18"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 460 90 1260 490 {flags=graph
y1=-0.038
y2=0.64
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.0055378439
x2=0.0089776974
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="


RESETA
"
color=8
dataset=-1
unitx=1
logx=0
logy=0
}
N 770 760 810 760 {lab=VLDO}
N 710 800 810 800 {lab=VBGR}
N 800 820 810 820 {lab=VSS}
N 800 820 800 860 {lab=VSS}
N 640 780 810 780 {lab=RESET}
N 2450 670 2450 720 {lab=#net1}
N 2450 780 2450 810 {lab=GND}
N 2450 590 2450 610 {lab=VSS}
N 2450 920 2450 960 {lab=GND}
N 2450 840 2450 860 {lab=VLDO}
N 2450 1080 2450 1120 {lab=GND}
N 2450 1000 2450 1020 {lab=VBGR}
C {simulator_commands_shown.sym} 2120 340 0 0 {name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/simulations/POR/output/POR__POR/magic_RC/POR.pex.spice
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
"
      }
C {simulator_commands_shown.sym} 2120 130 0 0 {name=SimulatorNGSPICE1
simulator=ngspice
only_toplevel=false 
value="
.param temp=27
.save all
.control
dc TEMP -40 150 5
plot reset
.endc
"
spice_ignore=true}
C {devices/launcher.sym} 120 290 0 0 {name=h3
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw tran
xschem setprop rect 2 0 fullxzoom
"
}
C {launcher.sym} 120 230 0 0 {name=h4
descr=SimulateNGSPICE
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults
puts $sim(spice,1,cmd) 

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,1,cmd) \{ngspice  \\"$N\\" -a\}

# change the simulator to be used (Xyce)
set sim(spice,default) 0

# Create FET and BIP .save file
mkdir -p $netlist_dir
write_data [save_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save

# run netlist and simulation
xschem netlist
simulate
"}
C {lab_pin.sym} 770 760 0 0 {name=p16 sig_type=std_logic lab=VLDO}
C {lab_pin.sym} 710 800 0 0 {name=p1 sig_type=std_logic lab=VBGR
}
C {lab_pin.sym} 640 780 0 0 {name=p2 sig_type=std_logic lab=RESET}
C {lab_pin.sym} 800 860 0 0 {name=p3 sig_type=std_logic lab=VSS}
C {/foss/designs/simulations/POR/POR.sym} 820 750 0 0 {name=X1}
C {lab_pin.sym} 2450 590 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {gnd.sym} 2450 810 0 0 {name=l1 lab=GND}
C {vsource.sym} 2450 750 0 0 {name=vin1 value=0 savecurrent=false}
C {ammeter.sym} 2450 640 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {simulator_commands_shown.sym} 2120 610 0 0 {name=SimulatorNGSPICE
simulator=ngspice
only_toplevel=false 
value="
.param temp=27
.save all
.control
tran 1u 1m
write tb_por.raw
plot vldo reset
.endc
"
}
C {vsource.sym} 2450 890 0 0 {name=vin2 value="PWL(0 0 20u 0 40u 1.2 600u 1.2 620u 0.8 640u 0.8 660u 1.2 760u 1.2 780u 0)" savecurrent=false}
C {gnd.sym} 2450 960 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 2450 840 0 0 {name=p20 sig_type=std_logic lab=VLDO}
C {vsource.sym} 2450 1050 0 0 {name=vin3 value="PWL(0 0 20u 0 30u 0.8)" savecurrent=false}
C {gnd.sym} 2450 1120 0 0 {name=l7 lab=GND}
C {lab_pin.sym} 2450 1000 0 0 {name=p35 sig_type=std_logic lab=VBGR}
