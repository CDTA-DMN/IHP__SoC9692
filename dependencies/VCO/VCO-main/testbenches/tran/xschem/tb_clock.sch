v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -430 -90 -430 40 {lab=VDD}
N -430 90 -430 210 {lab=GND}
N -300 70 -300 210 {lab=GND}
N -300 -90 -300 10 {lab=Vcon}
N 160 -20 170 -20 {lab=VDD}
N 170 -30 170 -20 {lab=VDD}
N 170 20 170 30 {lab=GND}
N 160 20 170 20 {lab=GND}
N -160 -20 -140 -20 {lab=Vcon}
N 160 -0 170 -0 {lab=VOUT}
C {vsource.sym} -430 60 0 0 {name=VDD value=1.2 savecurrent=false}
C {vdd.sym} -430 -90 0 0 {name=l3 lab=VDD}
C {gnd.sym} -430 210 0 0 {name=l4 lab=GND}
C {vsource.sym} -300 40 0 0 {name=Vcon value=0.5 savecurrent=false}
C {gnd.sym} -300 210 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -300 -90 0 0 {name=p2 sig_type=std_logic lab=Vcon}
C {code_shown.sym} -760 -230 0 0 {
name=TT_MODELS
only_toplevel=true
value="
** IHP models
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
"
spice_ignore=false
      }
C {code_shown.sym} -1190 -60 0 0 {name=NGSPICE1 only_toplevel=false value=" 
.include /foss/designs/clock_final_2_gds.spice
.control
.temp 27
save all
tran 1n 6uu
meas tran t_rise1 when v(vout)=0.6 rise=0
meas tran t_fall1 when v(vout)=0.6 fall=0
meas tran t_rise2 when v(vout)=0.6 rise=1
let t_on = t_fall1-t_rise1
let t_off = t_rise2-t_fall1
let period = (t_rise2-t_rise1)
let frequency = 1/period
let duty_cycle = (t_on/period)*100
print period duty_cycle frequency 
plot VOUT
plot i(vmeas11)
.endc
"
}
C {vdd.sym} 170 -30 0 1 {name=l1 lab=VDD}
C {gnd.sym} 170 30 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -160 -20 0 0 {name=p1 sig_type=std_logic lab=Vcon}
C {lab_pin.sym} 170 0 0 1 {name=p3 sig_type=std_logic lab=VOUT}
C {clock_final_2_gds.sym} 10 0 0 0 {name=x1}
