v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -510 40 -510 70 {lab=GND}
N -510 -90 -510 -20 {lab=VSS}
N -130 40 -10 40 {lab=VDD}
N -80 60 -10 60 {lab=VLDO}
N -720 -140 -720 -130 {lab=VDD}
N -720 -80 -720 -70 {lab=GND}
C {simulator_commands_shown.sym} -400 -160 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/simulations/LDO/output/LDO__LDO/magic_RC/LDO.pex.spice
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
"
      }
C {vsource.sym} -200 160 0 0 {name=V3 value="0.8 " savecurrent=false}
C {gnd.sym} -200 190 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -200 130 0 0 {name=p5 sig_type=std_logic lab=VBGR
}
C {lab_pin.sym} -510 -90 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {gnd.sym} -510 70 0 0 {name=l1 lab=GND}
C {vsource.sym} -510 10 0 0 {name=vin1 value=0 savecurrent=false}
C {lab_pin.sym} -10 20 0 0 {name=p1 sig_type=std_logic lab=VBGR}
C {lab_pin.sym} -10 0 0 0 {name=p3 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -80 60 2 1 {name=p2 sig_type=std_logic lab=VLDO}
C {lab_pin.sym} -130 40 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {/foss/designs/simulations/LDO/LDO.sym} 10 -10 0 0 {name=X1}
C {gnd.sym} -720 -70 0 0 {name=l3 lab=GND}
C {vsource.sym} -720 -110 0 0 {name=V1 value=3.3 savecurrent=false}
C {vdd.sym} -720 -140 0 0 {name=l5 lab=VDD}
C {code_shown.sym} -810 140 2 1 {name=s2 only_toplevel=false value=" 
.control
save all
op 

tran 0.1u 200u 
plot vldo

.endc"
}
