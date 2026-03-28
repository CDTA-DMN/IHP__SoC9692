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
N -340 60 -10 60 {lab=VLDO}
N -120 120 -120 220 {lab=GND}
N -200 220 -200 230 {lab=GND}
N -200 220 -120 220 {lab=GND}
N -200 120 -200 220 {lab=GND}
N 550 -20 550 -10 {lab=VDD}
N 550 40 550 50 {lab=GND}
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
C {simulator_commands_shown.sym} 220 -280 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.include /foss/designs/simulations/LDO/output/LDO__LDO/magic_RC/LDO.pex.spice
.lib cornerMOSlv.lib mos_tt_stat
.lib cornerMOShv.lib mos_tt_stat

.lib cornerRES.lib res_typ_stat
.lib cornerCAP.lib cap_typ_stat
"
      }
C {code_shown.sym} -150 -120 2 1 {name=mc_op only_toplevel=false value=" 

.param mc_ok = 1
.control
let mc_runs = 1000
let run = 0
shell rm mc_op.csv
dowhile run < mc_runs
reset
set run=$&run
save all
op 
print Vout2 >> mc_op.csv
let run=run+1
end



.endc"
}
C {capa.sym} -200 90 0 0 {name=C1
m=1
value=100p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -200 230 0 0 {name=l8 lab=GND}
C {res.sym} -120 90 0 0 {name=R4
value=6k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 550 50 0 0 {name=l2 lab=GND}
C {vsource.sym} 550 10 0 0 {name=V1 value=3.3 savecurrent=false}
C {vdd.sym} 550 -20 0 0 {name=l6 lab=VDD}
