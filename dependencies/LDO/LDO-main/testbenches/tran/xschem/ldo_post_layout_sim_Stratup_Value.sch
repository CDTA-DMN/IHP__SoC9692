v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 -680 -450 {}
N 310 -40 310 -10 {lab=VBGR}
N 430 -40 430 -20 {lab=VSS}
N -110 60 -10 60 {lab=VLDO}
N -110 150 -110 230 {lab=GND}
N -220 230 -110 230 {lab=GND}
N -110 60 -110 90 {lab=VLDO}
N -220 120 -220 230 {lab=GND}
N -340 60 -110 60 {lab=VLDO}
N 530 -30 530 -20 {lab=VDD}
N 530 30 530 40 {lab=GND}
C {lab_pin.sym} -10 20 0 0 {name=p1 sig_type=std_logic lab=VBGR}
C {lab_pin.sym} -10 0 0 0 {name=p3 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -340 60 2 1 {name=p2 sig_type=std_logic lab=VLDO}
C {lab_pin.sym} -10 40 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {vsource.sym} 310 20 0 0 {name=V3 value="0.8 " savecurrent=false}
C {gnd.sym} 310 50 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 310 -40 0 0 {name=p5 sig_type=std_logic lab=VBGR}
C {vsource.sym} 430 10 0 0 {name=V2 value="0" savecurrent=false}
C {gnd.sym} 430 40 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 430 -40 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {/foss/designs/simulations/LDO/LDO.sym} 10 -10 0 0 {name=X1}
C {simulator_commands_shown.sym} 200 -240 0 0 {
name=Libs_Ngspice1
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
C {capa.sym} -220 90 0 0 {name=C1
m=1
value=100p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -220 230 0 0 {name=l8 lab=GND}
C {res.sym} -110 120 0 0 {name=R4
value=1.2k
footprint=1206
device=resistor
m=1}
C {code_shown.sym} -170 -110 2 1 {name=s1 only_toplevel=false value=" 
.control
save all
op 

tran 0.1u 150u 
plot v(VDD) v(VLDO)
.endc"
}
C {gnd.sym} 530 40 0 0 {name=l2 lab=GND}
C {vsource.sym} 530 0 0 0 {name=V1 value="PULSE(0 3.3 1u 50u 10u  200u 400u)" savecurrent=false}
C {vdd.sym} 530 -30 0 0 {name=l6 lab=VDD}
