# RISCV-Processor

Changes to be made:
1. Sign extension of IMM to be added to PC. **DONE**
2. Adding Hazard Detection Unit. Stalling the IF and ID in case of unresolved register dependency. **DONE**
3. Update INST_UNIT for testing all cases. **DONE**
4. Branch Instruction Case: Prevent garbage instruction from creeping into the Pipeline. Data forwarding from EX and MEM in case of register dependency. **DONE**
