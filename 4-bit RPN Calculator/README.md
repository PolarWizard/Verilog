# 4-bit RPN Calculator


This is a 4-bit RPN Calculator designed using Verilog HDL. The original idea comes from ECE 394 - Digital Systems Lab where this Calculator was built using IC chips. The purpose of this project was to implement this on FPGA using Verilog. The original project used a hard wired control unit and 16x4 Memory with a separate counter to keep track of where we were in memory. In the project I implemented a FSM for the push and func inputs and put it on a ROM and I have also implemented a dedicated stack memory module.


## Hardware Block Diagram
![Image](https://github.com/PolarWizard/4-bit-RPN-Calculator/blob/master/Images/RPN%20Calculator.PNG)

## Contents of FSM
![Image](https://github.com/PolarWizard/4-bit-RPN-Calculator/blob/master/Images/FSM%20Implementation.PNG)

## Inputs
##### ALU Opcode:
- 00: Addition
- 01: Subtraction
- 10: Multiplication
- 11: Undefined

##### DataIn:
* Input number you want pushed onto the stack

##### Push/Func:
* We can either push a number onto the stack or pop two numbers off the stack and perform your chosen ALU operation


## Outputs
##### Result
- Will show the result when func is set to high

## Computing (1+2)*(15-11)
This equates to 12
#### Simulating (1+2)*(15-11):
![Image](https://github.com/PolarWizard/4-bit-RPN-Calculator/blob/master/Images/Simulation.PNG)
