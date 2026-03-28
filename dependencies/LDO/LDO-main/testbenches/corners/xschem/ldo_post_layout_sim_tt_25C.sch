v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -60 200 -60 230 {lab=GND}
N -60 70 -60 140 {lab=VSS}
N -200 130 -200 140 {lab=VDD}
N -200 200 -200 210 {lab=GND}
N -430 140 -430 240 {lab=GND}
N -510 240 -510 250 {lab=GND}
N -510 240 -430 240 {lab=GND}
N -510 140 -510 240 {lab=GND}
N -570 80 -360 80 {lab=VLDO}
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
C {vsource.sym} 50 160 0 0 {name=V3 value="0.8 " savecurrent=false}
C {gnd.sym} 50 190 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 50 130 0 0 {name=p5 sig_type=std_logic lab=VBGR
}
C {lab_pin.sym} -60 70 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {gnd.sym} -60 230 0 0 {name=l1 lab=GND}
C {vsource.sym} -60 170 0 0 {name=vin1 value=0 savecurrent=false}
C {gnd.sym} -200 210 0 0 {name=l3 lab=GND}
C {vsource.sym} -200 170 0 0 {name=V1 value=3.3 savecurrent=false}
C {vdd.sym} -200 130 0 0 {name=l5 lab=VDD}
C {lab_pin.sym} -360 40 0 0 {name=p1 sig_type=std_logic lab=VBGR}
C {lab_pin.sym} -360 20 0 0 {name=p3 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -570 80 2 1 {name=p2 sig_type=std_logic lab=VLDO}
C {lab_pin.sym} -360 60 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {/foss/designs/simulations/LDO/LDO.sym} -340 10 0 0 {name=X1}
C {capa.sym} -510 110 0 0 {name=C1
m=1
value=100p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -510 250 0 0 {name=l8 lab=GND}
C {res.sym} -430 110 0 0 {name=R4
value=6k
footprint=1206
device=resistor
m=1}
C {code_shown.sym} -650 -30 2 1 {name=s1 only_toplevel=false value=" 
.temp 25
.control
save all
op 
tran 0.1u 200u 
plot vldo

.endc"
}
