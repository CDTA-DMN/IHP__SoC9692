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
N -220 60 -10 60 {lab=VLDO}
N -60 120 -60 220 {lab=GND}
N -140 220 -140 230 {lab=GND}
N -140 220 -60 220 {lab=GND}
N -140 120 -140 220 {lab=GND}
C {lab_pin.sym} -10 20 0 0 {name=p1 sig_type=std_logic lab=VBGR}
C {lab_pin.sym} -10 0 0 0 {name=p3 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -220 60 2 1 {name=p2 sig_type=std_logic lab=VLDO}
C {lab_pin.sym} -10 40 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {gnd.sym} 200 50 0 0 {name=l2 lab=GND}
C {vsource.sym} 200 20 0 0 {name=V1 value=3.3 savecurrent=false}
C {vdd.sym} 200 -10 0 0 {name=l6 lab=VDD}
C {vsource.sym} 310 20 0 0 {name=V3 value="0.8 " savecurrent=false}
C {gnd.sym} 310 50 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 310 -40 0 0 {name=p5 sig_type=std_logic lab=VBGR}
C {vsource.sym} 430 10 0 0 {name=V2 value="0" savecurrent=false}
C {gnd.sym} 430 40 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 430 -40 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {simulator_commands_shown.sym} 120 -240 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/simulations/LDO/output/LDO__LDO/magic_RC/LDO.pex.spice
.lib cornerMOSlv.lib mos_sf
.lib cornerMOShv.lib mos_sf
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.lib cornerCAP.lib cap_typ
"
      }
C {/foss/designs/simulations/LDO/LDO.sym} 10 -10 0 0 {name=X1}
C {capa.sym} -140 90 0 0 {name=C1
m=1
value=100p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -140 230 0 0 {name=l8 lab=GND}
C {res.sym} -60 90 0 0 {name=R4
value=6k
footprint=1206
device=resistor
m=1}
C {code_shown.sym} -280 -90 2 1 {name=s1 only_toplevel=false value=" 
.temp 25
.control
save all
op 
tran 0.1u 200u 
plot vldo

.endc"
}
