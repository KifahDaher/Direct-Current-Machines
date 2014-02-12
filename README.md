Direct-Current-Machines
=======================

This project analyzes the dynamic behavior of a DC generator. The dynamic behavior of a cumulative short DC generator 
is studied and simulated using MATLAB. The selected generator is rated at 300 V, 30 kW, four poles. Different tasks are 
considered:
1.	In task 1 the steady state characteristics (VT vs IL) are obtained. As well the Torque vs speed and analysis is done regarding those characteristics.
2.	In task 2 the transient behaviors of the generator during a temporary change in the speed maintaining a constant load current.
3.	The third task is to simulate the dynamic behavior of the machine when changing the load while maintaining a constant speed.
4.	In the final task the generator is simulated to show the effect of the filed change by varying resistor values.
The system of differential equations is numerically solved using MATLAB.
The DC generator is a 300V Cumulatively Compounded type with short shunt connection having the following data:
	Shunt field resistance rf = 130 Ohms
	Series field resistance rfs = 0.14 Ohms
	Armature resistance ra = 1.65 Ohms
	Mutual inductance between shunt and series fields Lffs = 0.154 H
	Lumped damping coefficient Bm = 0.25 N.m.s
Lumped Inertia J = 11 Kg.m2
Shunt field time constant τf = 0.36 sec
Series field time constant τfs = 0.005 sec
Armature winding time constant τa = 0.02 sec
If the machine has 4 poles running at 1000rpm, the output voltage due to each the fields separately excited are given respectively by:
a)	250V / 1A of shunt field.

b)	0.5V / 1A of series field. 

