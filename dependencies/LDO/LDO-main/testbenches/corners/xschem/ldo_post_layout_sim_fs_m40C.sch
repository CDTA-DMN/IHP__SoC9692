v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 -820 60 {}
N 200 -10 200 0 {lab=VDD}
N 310 -40 310 -10 {lab=VBGR}
N 430 -40 430 -20 {lab=VSS}
N -230 -30 -20 -30 {lab=VLDO}
C {gnd.sym} 200 50 0 0 {name=l2 lab=GND}
C {vsource.sym} 200 20 0 0 {name=V1 value=3.3 savecurrent=false}
C {vdd.sym} 200 -10 0 0 {name=l6 lab=VDD}
C {vsource.sym} 310 20 0 0 {name=V3 value="0.8 " savecurrent=false}
C {gnd.sym} 310 50 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 310 -40 0 0 {name=p5 sig_type=std_logic lab=VBGR}
C {vsource.sym} 430 10 0 0 {name=V2 value="0" savecurrent=false}
C {gnd.sym} 430 40 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 430 -40 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {simulator_commands_shown.sym} -10 -350 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/simulations/LDO/output/LDO__LDO/magic_RC/LDO.pex.spice
.lib cornerMOSlv.lib mos_fs
.lib cornerMOShv.lib mos_fs
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
"
      }
C {lab_pin.sym} -20 -70 0 0 {name=p1 sig_type=std_logic lab=VBGR}
C {lab_pin.sym} -20 -90 0 0 {name=p3 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -230 -30 2 1 {name=p2 sig_type=std_logic lab=VLDO}
C {lab_pin.sym} -20 -50 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {/foss/designs/simulations/LDO/LDO.sym} 0 -100 0 0 {name=X1}
C {code_shown.sym} -240 -210 2 1 {name=s1 only_toplevel=false value=" 
.temp -40
.control
save all
op 
tran 0.1u 200u 
plot vldo

.endc"
}
