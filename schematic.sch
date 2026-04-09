# File saved with Nlview 7.8.0 2024-04-26 e1825d835c VDI=44 GEI=38 GUI=JA:21.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 15
property maxzoom 6.25
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlaycolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 15
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new riscv_top work:riscv_top:NOFILE -nosplit
load symbol ex_stage work:ex_stage:NOFILE HIERBOX pin alu_src input.left pin branch_in input.left pin branch_out output.right pin clk input.left pin mem_read_in input.left pin mem_read_out output.right pin mem_to_reg_in input.left pin mem_to_reg_out output.right pin mem_write_in input.left pin mem_write_out output.right pin reg_write_in input.left pin reg_write_out output.right pin reset input.left pin zero_out output.right pinBus alu_ctrl input.left [3:0] pinBus alu_result_out output.right [7:0] pinBus ex_mem_result input.left [7:0] pinBus fwd_a input.left [1:0] pinBus fwd_b input.left [1:0] pinBus imm input.left [7:0] pinBus mem_wb_result input.left [7:0] pinBus op1 input.left [7:0] pinBus op2 input.left [7:0] pinBus pc_in input.left [7:0] pinBus pc_out output.right [7:0] pinBus rd_in input.left [4:0] pinBus rd_out output.right [4:0] pinBus src2_raw_out output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol forwarding_unit work:forwarding_unit:NOFILE HIERBOX pin reg_write_mem input.left pin reg_write_wb input.left pinBus fwd_a output.right [1:0] pinBus fwd_b output.right [1:0] pinBus rd_mem input.left [4:0] pinBus rd_wb input.left [4:0] pinBus rs1_ex input.left [4:0] pinBus rs2_ex input.left [4:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol id_stage work:id_stage:NOFILE HIERBOX pin alu_src_out output.right pin branch_out output.right pin clk input.left pin mem_read_out output.right pin mem_to_reg_out output.right pin mem_write_out output.right pin pc_out output.right pin reg_write_out output.right pin reg_write_wb input.left pin reset input.left pinBus alu_ctrl_out output.right [3:0] pinBus imm_out output.right [7:0] pinBus instruction input.left [31:0] pinBus pc_in input.left [7:0] pinBus rd_out output.right [4:0] pinBus rd_wb input.left [4:0] pinBus read_data1_out output.right [7:0] pinBus read_data2_out output.right [7:0] pinBus rs1_out output.right [4:0] pinBus rs2_out output.right [4:0] pinBus write_data input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol if_stage work:if_stage:NOFILE HIERBOX pin clk input.left pin pc_src input.left pin reset input.left pinBus instruction_out output.right [31:0] pinBus pc_jump input.left [7:0] pinBus pc_out output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol mem_stage work:mem_stage:NOFILE HIERBOX pin branch_in input.left pin clk input.left pin mem_read_in input.left pin mem_to_reg_in input.left pin mem_to_reg_out output.right pin mem_write_in input.left pin pc_src output.right pin reg_write_in input.left pin reg_write_out output.right pin reset input.left pin zero_in input.left pinBus alu_result_in input.left [7:0] pinBus alu_result_out output.right [7:0] pinBus pc_branch_in input.left [7:0] pinBus pc_branch_out output.right [7:0] pinBus rd_in input.left [4:0] pinBus rd_out output.right [4:0] pinBus read_data_out output.right [7:0] pinBus write_data_in input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol wb_stage work:wb_stage:NOFILE HIERBOX pin mem_to_reg input.left pinBus alu_result input.left [7:0] pinBus read_data input.left [7:0] pinBus write_data output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol alu work:alu:NOFILE HIERBOX pin zero output.right pinBus a input.left [7:0] pinBus alu_ctrl input.left [3:0] pinBus b input.left [7:0] pinBus result output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_REG_SYNC__BREG_1 work GEN pin C input.clk.left pin D input.left pin Q output.right pin RST input.top fillcolor 1
load symbol RTL_ADD0 work RTL(+) pinBus I0 input.left [7:0] pinBus I1 input.left [7:0] pinBus O output.right [7:0] fillcolor 1
load symbol RTL_MUX41 work MUX pinBus I0 input.left [7:0] pinBus I1 input.left [7:0] pinBus O output.right [7:0] pinBus S input.bot [1:0] fillcolor 1
load symbol RTL_MUX work MUX pin S input.bot pinBus I0 input.left [7:0] pinBus I1 input.left [7:0] pinBus O output.right [7:0] fillcolor 1
load symbol RTL_REG_SYNC__BREG_1 work[7:0]swws GEN pin C input.clk.left pinBus D input.left [7:0] pinBus Q output.right [7:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 8
load symbol RTL_REG_SYNC__BREG_1 work[4:0]swws GEN pin C input.clk.left pinBus D input.left [4:0] pinBus Q output.right [4:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 5
load symbol data_memory work:data_memory:NOFILE HIERBOX pin clk input.left pin read input.left pin write input.left pinBus addr input.left [7:0] pinBus read_data output.right [7:0] pinBus write_data input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_AND work AND pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_INV work INV pin I0 input pin O output fillcolor 1
load symbol RTL_EQ1 work RTL(=) pin O output.right pinBus I0 input.left [4:0] pinBus I1 input.left [4:0] fillcolor 1
load symbol RTL_NEQ work RTL(!=) pin O output.right pinBus I0 input.left [4:0] pinBus I1 input.left [4:0] fillcolor 1
load symbol RTL_MUX45 work MUX pin S input.bot pinBus I0 input.left [1:0] pinBus I1 input.left [1:0] pinBus O output.right [1:0] fillcolor 1
load symbol alu_control work:alu_control:NOFILE HIERBOX pinBus alu_ctrl output.right [3:0] pinBus alu_op input.left [1:0] pinBus func3 input.left [2:0] pinBus func7 input.left [6:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol control_unit work:control_unit:NOFILE HIERBOX pin alu_src output.right pin branch output.right pin mem_read output.right pin mem_to_reg output.right pin mem_write output.right pin reg_write output.right pinBus alu_op output.right [1:0] pinBus opcode input.left [6:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol imm_gen work:imm_gen:NOFILE HIERBOX pinBus imm_out output.right [7:0] pinBus instruction input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol register_file work:register_file:NOFILE HIERBOX pin clk input.left pin reg_write input.left pin reset input.left pinBus read_data1 output.right [7:0] pinBus read_data2 output.right [7:0] pinBus rs1 input.left [4:0] pinBus rs2 input.left [4:0] pinBus write_addr input.left [4:0] pinBus write_data input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_REG_SYNC__BREG_1 work[3:0]swws GEN pin C input.clk.left pinBus D input.left [3:0] pinBus Q output.right [3:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 4
load symbol instruction_memory work:instruction_memory:NOFILE HIERBOX pinBus addr input.left [7:0] pinBus instruction output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol program_counter work:program_counter:NOFILE HIERBOX pin clk input.left pin reset input.left pinBus pc_in input.left [7:0] pinBus pc_out output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_ADD work RTL(+) pin I1 input.left pinBus I0 input.left [7:0] pinBus O output.right [7:0] fillcolor 1
load symbol RTL_REG_SYNC__BREG_1 work[31:0]swws GEN pin C input.clk.left pinBus D input.left [31:0] pinBus Q output.right [31:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 32
load port clk input -pg 1 -lvl 0 -x 0 -y 210
load port reset input -pg 1 -lvl 0 -x 0 -y 450
load inst EX ex_stage work:ex_stage:NOFILE -unfold -autohide -attr @cell(#000000) ex_stage -attr @fillcolor #fafafa -pinBusAttr alu_ctrl @name alu_ctrl[3:0] -pinBusAttr alu_result_out @name alu_result_out[7:0] -pinBusAttr ex_mem_result @name ex_mem_result[7:0] -pinBusAttr fwd_a @name fwd_a[1:0] -pinBusAttr fwd_b @name fwd_b[1:0] -pinBusAttr imm @name imm[7:0] -pinBusAttr mem_wb_result @name mem_wb_result[7:0] -pinBusAttr op1 @name op1[7:0] -pinBusAttr op2 @name op2[7:0] -pinBusAttr pc_in @name pc_in[7:0] -pinBusAttr pc_out @name pc_out[7:0] -pinBusAttr rd_in @name rd_in[4:0] -pinBusAttr rd_out @name rd_out[4:0] -pinBusAttr src2_raw_out @name src2_raw_out[7:0] -pg 1 -lvl 5 -x 7171 -y 268
load inst FWD_UNIT forwarding_unit work:forwarding_unit:NOFILE -unfold -autohide -attr @cell(#000000) forwarding_unit -attr @fillcolor #fafafa -pinBusAttr fwd_a @name fwd_a[1:0] -pinBusAttr fwd_b @name fwd_b[1:0] -pinBusAttr rd_mem @name rd_mem[4:0] -pinBusAttr rd_wb @name rd_wb[4:0] -pinBusAttr rs1_ex @name rs1_ex[4:0] -pinBusAttr rs2_ex @name rs2_ex[4:0] -pg 1 -lvl 4 -x 4981 -y 378
load inst ID id_stage work:id_stage:NOFILE -autohide -attr @cell(#000000) id_stage -attr @fillcolor #fafafa -pinBusAttr alu_ctrl_out @name alu_ctrl_out[3:0] -pinBusAttr imm_out @name imm_out[7:0] -pinBusAttr instruction @name instruction[31:0] -pinBusAttr pc_in @name pc_in[7:0] -pinBusAttr rd_out @name rd_out[4:0] -pinBusAttr rd_wb @name rd_wb[4:0] -pinBusAttr read_data1_out @name read_data1_out[7:0] -pinBusAttr read_data2_out @name read_data2_out[7:0] -pinBusAttr rs1_out @name rs1_out[4:0] -pinBusAttr rs2_out @name rs2_out[4:0] -pinBusAttr write_data @name write_data[7:0] -pg 1 -lvl 3 -x 3280 -y 328
load inst IF if_stage work:if_stage:NOFILE -autohide -attr @cell(#000000) if_stage -attr @fillcolor #fafafa -pinBusAttr instruction_out @name instruction_out[31:0] -pinBusAttr pc_jump @name pc_jump[7:0] -pinBusAttr pc_out @name pc_out[7:0] -pg 1 -lvl 2 -x 1580 -y 328
load inst MEM mem_stage work:mem_stage:NOFILE -autohide -attr @cell(#000000) mem_stage -attr @fillcolor #fafafa -pinBusAttr alu_result_in @name alu_result_in[7:0] -pinBusAttr alu_result_out @name alu_result_out[7:0] -pinBusAttr pc_branch_in @name pc_branch_in[7:0] -pinBusAttr pc_branch_out @name pc_branch_out[7:0] -pinBusAttr rd_in @name rd_in[4:0] -pinBusAttr rd_out @name rd_out[4:0] -pinBusAttr read_data_out @name read_data_out[7:0] -pinBusAttr write_data_in @name write_data_in[7:0] -pg 1 -lvl 1 -x 370 -y 268
load inst WB wb_stage work:wb_stage:NOFILE -autohide -attr @cell(#000000) wb_stage -attr @fillcolor #fafafa -pinBusAttr alu_result @name alu_result[7:0] -pinBusAttr read_data @name read_data[7:0] -pinBusAttr write_data @name write_data[7:0] -pg 1 -lvl 2 -x 1580 -y 696
load inst EX|ALU alu work:alu:NOFILE -hier EX -autohide -attr @cell(#000000) alu -attr @name ALU -pinBusAttr a @name a[7:0] -pinBusAttr alu_ctrl @name alu_ctrl[3:0] -pinBusAttr b @name b[7:0] -pinBusAttr result @name result[7:0] -pg 1 -lvl 4 -x 8201 -y 428
load inst EX|branch_out_reg RTL_REG_SYNC__BREG_1 work -hier EX -attr @cell(#000000) RTL_REG_SYNC -attr @name branch_out_reg -pg 1 -lvl 5 -x 8491 -y 308
load inst EX|mem_read_out_reg RTL_REG_SYNC__BREG_1 work -hier EX -attr @cell(#000000) RTL_REG_SYNC -attr @name mem_read_out_reg -pg 1 -lvl 5 -x 8491 -y 558
load inst EX|mem_to_reg_out_reg RTL_REG_SYNC__BREG_1 work -hier EX -attr @cell(#000000) RTL_REG_SYNC -attr @name mem_to_reg_out_reg -pg 1 -lvl 5 -x 8491 -y 678
load inst EX|mem_write_out_reg RTL_REG_SYNC__BREG_1 work -hier EX -attr @cell(#000000) RTL_REG_SYNC -attr @name mem_write_out_reg -pg 1 -lvl 5 -x 8491 -y 798
load inst EX|pc_branch_i RTL_ADD0 work -hier EX -attr @cell(#000000) RTL_ADD -attr @name pc_branch_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr I1 @name I1[7:0] -pinBusAttr O @name O[7:0] -pg 1 -lvl 4 -x 8201 -y 928
load inst EX|reg_write_out_reg RTL_REG_SYNC__BREG_1 work -hier EX -attr @cell(#000000) RTL_REG_SYNC -attr @name reg_write_out_reg -pg 1 -lvl 5 -x 8491 -y 1428
load inst EX|src10_i RTL_MUX41 work -hier EX -attr @cell(#000000) RTL_MUX -attr @name src10_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=2'b01 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pinBusAttr S @name S[1:0] -pg 1 -lvl 2 -x 7661 -y 398
load inst EX|src1_i RTL_MUX41 work -hier EX -attr @cell(#000000) RTL_MUX -attr @name src1_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=2'b10 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pinBusAttr S @name S[1:0] -pg 1 -lvl 3 -x 7961 -y 418
load inst EX|src2_i RTL_MUX work -hier EX -attr @cell(#000000) RTL_MUX -attr @name src2_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pg 1 -lvl 3 -x 7961 -y 598
load inst EX|src2_raw0_i RTL_MUX41 work -hier EX -attr @cell(#000000) RTL_MUX -attr @name src2_raw0_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=2'b01 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pinBusAttr S @name S[1:0] -pg 1 -lvl 1 -x 7341 -y 738
load inst EX|src2_raw_i RTL_MUX41 work -hier EX -attr @cell(#000000) RTL_MUX -attr @name src2_raw_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=2'b10 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pinBusAttr S @name S[1:0] -pg 1 -lvl 2 -x 7661 -y 728
load inst EX|zero_out_reg RTL_REG_SYNC__BREG_1 work -hier EX -attr @cell(#000000) RTL_REG_SYNC -attr @name zero_out_reg -pg 1 -lvl 5 -x 8491 -y 1048
load inst EX|alu_result_out_reg[7:0] RTL_REG_SYNC__BREG_1 work[7:0]swws -hier EX -attr @cell(#000000) RTL_REG_SYNC -attr @name alu_result_out_reg[7:0] -pg 1 -lvl 5 -x 8491 -y 428
load inst EX|src2_raw_out_reg[7:0] RTL_REG_SYNC__BREG_1 work[7:0]swws -hier EX -attr @cell(#000000) RTL_REG_SYNC -attr @name src2_raw_out_reg[7:0] -pg 1 -lvl 5 -x 8491 -y 1168
load inst EX|rd_out_reg[4:0] RTL_REG_SYNC__BREG_1 work[4:0]swws -hier EX -attr @cell(#000000) RTL_REG_SYNC -attr @name rd_out_reg[4:0] -pg 1 -lvl 5 -x 8491 -y 1298
load inst EX|pc_out_reg[7:0] RTL_REG_SYNC__BREG_1 work[7:0]swws -hier EX -attr @cell(#000000) RTL_REG_SYNC -attr @name pc_out_reg[7:0] -pg 1 -lvl 5 -x 8491 -y 918
load inst MEM|DM data_memory work:data_memory:NOFILE -hier MEM -autohide -attr @cell(#000000) data_memory -attr @name DM -pinBusAttr addr @name addr[7:0] -pinBusAttr read_data @name read_data[7:0] -pinBusAttr write_data @name write_data[7:0] -pg 1 -lvl 1 -x 590 -y 498
load inst MEM|mem_to_reg_out_reg RTL_REG_SYNC__BREG_1 work -hier MEM -attr @cell(#000000) RTL_REG_SYNC -attr @name mem_to_reg_out_reg -pg 1 -lvl 2 -x 910 -y 438
load inst MEM|pc_src_i RTL_AND work -hier MEM -attr @cell(#000000) RTL_AND -attr @name pc_src_i -pg 1 -lvl 2 -x 910 -y 928
load inst MEM|reg_write_out_reg RTL_REG_SYNC__BREG_1 work -hier MEM -attr @cell(#000000) RTL_REG_SYNC -attr @name reg_write_out_reg -pg 1 -lvl 2 -x 910 -y 708
load inst MEM|read_data_out_reg[7:0] RTL_REG_SYNC__BREG_1 work[7:0]swws -hier MEM -attr @cell(#000000) RTL_REG_SYNC -attr @name read_data_out_reg[7:0] -pg 1 -lvl 2 -x 910 -y 578
load inst MEM|rd_out_reg[4:0] RTL_REG_SYNC__BREG_1 work[4:0]swws -hier MEM -attr @cell(#000000) RTL_REG_SYNC -attr @name rd_out_reg[4:0] -pg 1 -lvl 2 -x 910 -y 828
load inst MEM|alu_result_out_reg[7:0] RTL_REG_SYNC__BREG_1 work[7:0]swws -hier MEM -attr @cell(#000000) RTL_REG_SYNC -attr @name alu_result_out_reg[7:0] -pg 1 -lvl 2 -x 910 -y 308
load inst WB|write_data_i RTL_MUX work -hier WB -attr @cell(#000000) RTL_MUX -attr @name write_data_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pg 1 -lvl 1 -x 1750 -y 726
load inst FWD_UNIT|fwd_a1_i RTL_AND work -hier FWD_UNIT -attr @cell(#000000) RTL_AND -attr @name fwd_a1_i -pg 1 -lvl 5 -x 6161 -y 538
load inst FWD_UNIT|fwd_a2_i RTL_AND work -hier FWD_UNIT -attr @cell(#000000) RTL_AND -attr @name fwd_a2_i -pg 1 -lvl 4 -x 5841 -y 606
load inst FWD_UNIT|fwd_a2_i__0 RTL_INV work -hier FWD_UNIT -attr @cell(#000000) RTL_INV -attr @name fwd_a2_i__0 -pg 1 -lvl 4 -x 5841 -y 536
load inst FWD_UNIT|fwd_a3_i RTL_AND work -hier FWD_UNIT -attr @cell(#000000) RTL_AND -attr @name fwd_a3_i -pg 1 -lvl 3 -x 5641 -y 486
load inst FWD_UNIT|fwd_a3_i__0 RTL_AND work -hier FWD_UNIT -attr @cell(#000000) RTL_AND -attr @name fwd_a3_i__0 -pg 1 -lvl 3 -x 5641 -y 406
load inst FWD_UNIT|fwd_a3_i__1 RTL_EQ1 work -hier FWD_UNIT -attr @cell(#000000) RTL_EQ -attr @name fwd_a3_i__1 -pinBusAttr I0 @name I0[4:0] -pinBusAttr I1 @name I1[4:0] -pg 1 -lvl 3 -x 5641 -y 616
load inst FWD_UNIT|fwd_a4_i RTL_AND work -hier FWD_UNIT -attr @cell(#000000) RTL_AND -attr @name fwd_a4_i -pg 1 -lvl 2 -x 5381 -y 676
load inst FWD_UNIT|fwd_a4_i__0 RTL_EQ1 work -hier FWD_UNIT -attr @cell(#000000) RTL_EQ -attr @name fwd_a4_i__0 -pinBusAttr I0 @name I0[4:0] -pinBusAttr I1 @name I1[4:0] -pg 1 -lvl 2 -x 5381 -y 446
load inst FWD_UNIT|fwd_a4_i__1 RTL_NEQ work -hier FWD_UNIT -attr @cell(#000000) RTL_NEQ -attr @name fwd_a4_i__1 -pinBusAttr I0 @name I0[4:0] -pinBusAttr I1 @name I1[4:0] -pg 1 -lvl 2 -x 5381 -y 536
load inst FWD_UNIT|fwd_a5_i RTL_NEQ work -hier FWD_UNIT -attr @cell(#000000) RTL_NEQ -attr @name fwd_a5_i -pinBusAttr I0 @name I0[4:0] -pinBusAttr I1 @name I1[4:0] -pg 1 -lvl 1 -x 5101 -y 536
load inst FWD_UNIT|fwd_a_i RTL_MUX45 work -hier FWD_UNIT -attr @cell(#000000) RTL_MUX -attr @name fwd_a_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I0 @attr V=B\"10\",\ S=1'b1 -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[1:0] -pg 1 -lvl 5 -x 6161 -y 408
load inst FWD_UNIT|fwd_a_i__0 RTL_MUX45 work -hier FWD_UNIT -attr @cell(#000000) RTL_MUX -attr @name fwd_a_i__0 -pinBusAttr I0 @name I0[1:0] -pinBusAttr I0 @attr V=B\"01\",\ S=1'b1 -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[1:0] -pg 1 -lvl 6 -x 6471 -y 478
load inst FWD_UNIT|fwd_b1_i RTL_AND work -hier FWD_UNIT -attr @cell(#000000) RTL_AND -attr @name fwd_b1_i -pg 1 -lvl 5 -x 6161 -y 778
load inst FWD_UNIT|fwd_b2_i RTL_AND work -hier FWD_UNIT -attr @cell(#000000) RTL_AND -attr @name fwd_b2_i -pg 1 -lvl 4 -x 5841 -y 676
load inst FWD_UNIT|fwd_b2_i__0 RTL_INV work -hier FWD_UNIT -attr @cell(#000000) RTL_INV -attr @name fwd_b2_i__0 -pg 1 -lvl 4 -x 5841 -y 786
load inst FWD_UNIT|fwd_b3_i RTL_AND work -hier FWD_UNIT -attr @cell(#000000) RTL_AND -attr @name fwd_b3_i -pg 1 -lvl 3 -x 5641 -y 786
load inst FWD_UNIT|fwd_b3_i__0 RTL_EQ1 work -hier FWD_UNIT -attr @cell(#000000) RTL_EQ -attr @name fwd_b3_i__0 -pinBusAttr I0 @name I0[4:0] -pinBusAttr I1 @name I1[4:0] -pg 1 -lvl 3 -x 5641 -y 706
load inst FWD_UNIT|fwd_b4_i RTL_EQ1 work -hier FWD_UNIT -attr @cell(#000000) RTL_EQ -attr @name fwd_b4_i -pinBusAttr I0 @name I0[4:0] -pinBusAttr I1 @name I1[4:0] -pg 1 -lvl 2 -x 5381 -y 776
load inst FWD_UNIT|fwd_b_i RTL_MUX45 work -hier FWD_UNIT -attr @cell(#000000) RTL_MUX -attr @name fwd_b_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I0 @attr V=B\"10\",\ S=1'b1 -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[1:0] -pg 1 -lvl 5 -x 6161 -y 648
load inst FWD_UNIT|fwd_b_i__0 RTL_MUX45 work -hier FWD_UNIT -attr @cell(#000000) RTL_MUX -attr @name fwd_b_i__0 -pinBusAttr I0 @name I0[1:0] -pinBusAttr I0 @attr V=B\"01\",\ S=1'b1 -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[1:0] -pg 1 -lvl 6 -x 6471 -y 646
load inst ID|AC alu_control work:alu_control:NOFILE -hier ID -autohide -attr @cell(#000000) alu_control -attr @name AC -pinBusAttr alu_ctrl @name alu_ctrl[3:0] -pinBusAttr alu_op @name alu_op[1:0] -pinBusAttr func3 @name func3[2:0] -pinBusAttr func7 @name func7[6:0] -pg 1 -lvl 2 -x 3750 -y 718
load inst ID|CU control_unit work:control_unit:NOFILE -hier ID -autohide -attr @cell(#000000) control_unit -attr @name CU -pinBusAttr alu_op @name alu_op[1:0] -pinBusAttr opcode @name opcode[6:0] -pg 1 -lvl 1 -x 3410 -y 778
load inst ID|IG imm_gen work:imm_gen:NOFILE -hier ID -autohide -attr @cell(#000000) imm_gen -attr @name IG -pinBusAttr imm_out @name imm_out[7:0] -pinBusAttr instruction @name instruction[31:0] -pg 1 -lvl 2 -x 3750 -y 978
load inst ID|RF register_file work:register_file:NOFILE -hier ID -autohide -attr @cell(#000000) register_file -attr @name RF -pinBusAttr read_data1 @name read_data1[7:0] -pinBusAttr read_data2 @name read_data2[7:0] -pinBusAttr rs1 @name rs1[4:0] -pinBusAttr rs2 @name rs2[4:0] -pinBusAttr write_addr @name write_addr[4:0] -pinBusAttr write_data @name write_data[7:0] -pg 1 -lvl 2 -x 3750 -y 1448
load inst ID|alu_src_out_reg RTL_REG_SYNC__BREG_1 work -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name alu_src_out_reg -pg 1 -lvl 3 -x 4090 -y 498
load inst ID|branch_out_reg RTL_REG_SYNC__BREG_1 work -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name branch_out_reg -pg 1 -lvl 3 -x 4090 -y 618
load inst ID|mem_read_out_reg RTL_REG_SYNC__BREG_1 work -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name mem_read_out_reg -pg 1 -lvl 3 -x 4090 -y 738
load inst ID|mem_to_reg_out_reg RTL_REG_SYNC__BREG_1 work -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name mem_to_reg_out_reg -pg 1 -lvl 3 -x 4090 -y 858
load inst ID|mem_write_out_reg RTL_REG_SYNC__BREG_1 work -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name mem_write_out_reg -pg 1 -lvl 3 -x 4090 -y 1108
load inst ID|pc_out_reg RTL_REG_SYNC__BREG_1 work -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name pc_out_reg -pg 1 -lvl 3 -x 4090 -y 1228
load inst ID|reg_write_out_reg RTL_REG_SYNC__BREG_1 work -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name reg_write_out_reg -pg 1 -lvl 3 -x 4090 -y 1348
load inst ID|rs2_out_reg[4:0] RTL_REG_SYNC__BREG_1 work[4:0]swws -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name rs2_out_reg[4:0] -pg 1 -lvl 3 -x 4090 -y 1988
load inst ID|rs1_out_reg[4:0] RTL_REG_SYNC__BREG_1 work[4:0]swws -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name rs1_out_reg[4:0] -pg 1 -lvl 3 -x 4090 -y 1858
load inst ID|read_data2_out_reg[7:0] RTL_REG_SYNC__BREG_1 work[7:0]swws -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name read_data2_out_reg[7:0] -pg 1 -lvl 3 -x 4090 -y 1598
load inst ID|read_data1_out_reg[7:0] RTL_REG_SYNC__BREG_1 work[7:0]swws -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name read_data1_out_reg[7:0] -pg 1 -lvl 3 -x 4090 -y 1468
load inst ID|rd_out_reg[4:0] RTL_REG_SYNC__BREG_1 work[4:0]swws -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name rd_out_reg[4:0] -pg 1 -lvl 3 -x 4090 -y 1728
load inst ID|imm_out_reg[7:0] RTL_REG_SYNC__BREG_1 work[7:0]swws -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name imm_out_reg[7:0] -pg 1 -lvl 3 -x 4090 -y 978
load inst ID|alu_ctrl_out_reg[3:0] RTL_REG_SYNC__BREG_1 work[3:0]swws -hier ID -attr @cell(#000000) RTL_REG_SYNC -attr @name alu_ctrl_out_reg[3:0] -pg 1 -lvl 3 -x 4090 -y 368
load inst IF|inst_mm instruction_memory work:instruction_memory:NOFILE -hier IF -autohide -attr @cell(#000000) instruction_memory -attr @name inst_mm -pinBusAttr addr @name addr[7:0] -pinBusAttr instruction @name instruction[31:0] -pg 1 -lvl 4 -x 2400 -y 368
load inst IF|pc program_counter work:program_counter:NOFILE -hier IF -autohide -attr @cell(#000000) program_counter -attr @name pc -pinBusAttr pc_in @name pc_in[7:0] -pinBusAttr pc_out @name pc_out[7:0] -pg 1 -lvl 3 -x 2160 -y 388
load inst IF|pc_in_i RTL_MUX work -hier IF -attr @cell(#000000) RTL_MUX -attr @name pc_in_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pg 1 -lvl 2 -x 1950 -y 418
load inst IF|pc_next_i RTL_ADD work -hier IF -attr @cell(#000000) RTL_ADD -attr @name pc_next_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr O @name O[7:0] -pg 1 -lvl 1 -x 1700 -y 408
load inst IF|pc_out_reg[7:0] RTL_REG_SYNC__BREG_1 work[7:0]swws -hier IF -attr @cell(#000000) RTL_REG_SYNC -attr @name pc_out_reg[7:0] -pg 1 -lvl 5 -x 2660 -y 498
load inst IF|instruction_out_reg[31:0] RTL_REG_SYNC__BREG_1 work[31:0]swws -hier IF -attr @cell(#000000) RTL_REG_SYNC -attr @name instruction_out_reg[31:0] -pg 1 -lvl 5 -x 2660 -y 368
load net <const0> -ground -pin EX pc_in[7] -pin EX pc_in[6] -pin EX pc_in[5] -pin EX pc_in[4] -pin EX pc_in[3] -pin EX pc_in[2] -pin EX pc_in[1]
load net clk -pin EX clk -pin ID clk -pin IF clk -pin MEM clk -port clk
netloc clk 1 0 5 40 210 1450 250 3160 250 4560J 270 6770
load net ex_alu_result[0] -attr @rip alu_result_out[0] -pin EX alu_result_out[0] -pin EX ex_mem_result[0] -pin MEM alu_result_in[0]
load net ex_alu_result[1] -attr @rip alu_result_out[1] -pin EX alu_result_out[1] -pin EX ex_mem_result[1] -pin MEM alu_result_in[1]
load net ex_alu_result[2] -attr @rip alu_result_out[2] -pin EX alu_result_out[2] -pin EX ex_mem_result[2] -pin MEM alu_result_in[2]
load net ex_alu_result[3] -attr @rip alu_result_out[3] -pin EX alu_result_out[3] -pin EX ex_mem_result[3] -pin MEM alu_result_in[3]
load net ex_alu_result[4] -attr @rip alu_result_out[4] -pin EX alu_result_out[4] -pin EX ex_mem_result[4] -pin MEM alu_result_in[4]
load net ex_alu_result[5] -attr @rip alu_result_out[5] -pin EX alu_result_out[5] -pin EX ex_mem_result[5] -pin MEM alu_result_in[5]
load net ex_alu_result[6] -attr @rip alu_result_out[6] -pin EX alu_result_out[6] -pin EX ex_mem_result[6] -pin MEM alu_result_in[6]
load net ex_alu_result[7] -attr @rip alu_result_out[7] -pin EX alu_result_out[7] -pin EX ex_mem_result[7] -pin MEM alu_result_in[7]
load net ex_branch -pin EX branch_out -pin MEM branch_in
netloc ex_branch 1 0 6 60 10 NJ 10 NJ 10 NJ 10 NJ 10 8920
load net ex_mem_read -pin EX mem_read_out -pin MEM mem_read_in
netloc ex_mem_read 1 0 6 80 30 NJ 30 NJ 30 NJ 30 NJ 30 8960
load net ex_mem_to_reg -pin EX mem_to_reg_out -pin MEM mem_to_reg_in
netloc ex_mem_to_reg 1 0 6 100 50 NJ 50 NJ 50 NJ 50 NJ 50 9000
load net ex_mem_write -pin EX mem_write_out -pin MEM mem_write_in
netloc ex_mem_write 1 0 6 120 70 NJ 70 NJ 70 NJ 70 NJ 70 9040
load net ex_pc_branch[0] -attr @rip pc_out[0] -pin EX pc_out[0] -pin MEM pc_branch_in[0]
load net ex_pc_branch[1] -attr @rip pc_out[1] -pin EX pc_out[1] -pin MEM pc_branch_in[1]
load net ex_pc_branch[2] -attr @rip pc_out[2] -pin EX pc_out[2] -pin MEM pc_branch_in[2]
load net ex_pc_branch[3] -attr @rip pc_out[3] -pin EX pc_out[3] -pin MEM pc_branch_in[3]
load net ex_pc_branch[4] -attr @rip pc_out[4] -pin EX pc_out[4] -pin MEM pc_branch_in[4]
load net ex_pc_branch[5] -attr @rip pc_out[5] -pin EX pc_out[5] -pin MEM pc_branch_in[5]
load net ex_pc_branch[6] -attr @rip pc_out[6] -pin EX pc_out[6] -pin MEM pc_branch_in[6]
load net ex_pc_branch[7] -attr @rip pc_out[7] -pin EX pc_out[7] -pin MEM pc_branch_in[7]
load net ex_rd[0] -attr @rip rd_out[0] -pin EX rd_out[0] -pin FWD_UNIT rd_mem[0] -pin MEM rd_in[0]
load net ex_rd[1] -attr @rip rd_out[1] -pin EX rd_out[1] -pin FWD_UNIT rd_mem[1] -pin MEM rd_in[1]
load net ex_rd[2] -attr @rip rd_out[2] -pin EX rd_out[2] -pin FWD_UNIT rd_mem[2] -pin MEM rd_in[2]
load net ex_rd[3] -attr @rip rd_out[3] -pin EX rd_out[3] -pin FWD_UNIT rd_mem[3] -pin MEM rd_in[3]
load net ex_rd[4] -attr @rip rd_out[4] -pin EX rd_out[4] -pin FWD_UNIT rd_mem[4] -pin MEM rd_in[4]
load net ex_reg_write -pin EX reg_write_out -pin FWD_UNIT reg_write_mem -pin MEM reg_write_in
netloc ex_reg_write 1 0 6 240 190 NJ 190 NJ 190 4741 190 NJ 190 8940
load net ex_src2_raw[0] -attr @rip src2_raw_out[0] -pin EX src2_raw_out[0] -pin MEM write_data_in[0]
load net ex_src2_raw[1] -attr @rip src2_raw_out[1] -pin EX src2_raw_out[1] -pin MEM write_data_in[1]
load net ex_src2_raw[2] -attr @rip src2_raw_out[2] -pin EX src2_raw_out[2] -pin MEM write_data_in[2]
load net ex_src2_raw[3] -attr @rip src2_raw_out[3] -pin EX src2_raw_out[3] -pin MEM write_data_in[3]
load net ex_src2_raw[4] -attr @rip src2_raw_out[4] -pin EX src2_raw_out[4] -pin MEM write_data_in[4]
load net ex_src2_raw[5] -attr @rip src2_raw_out[5] -pin EX src2_raw_out[5] -pin MEM write_data_in[5]
load net ex_src2_raw[6] -attr @rip src2_raw_out[6] -pin EX src2_raw_out[6] -pin MEM write_data_in[6]
load net ex_src2_raw[7] -attr @rip src2_raw_out[7] -pin EX src2_raw_out[7] -pin MEM write_data_in[7]
load net ex_zero -pin EX zero_out -pin MEM zero_in
netloc ex_zero 1 0 6 220 170 NJ 170 NJ 170 4861J 150 NJ 150 9020
load net fwd_a[0] -attr @rip fwd_a[0] -pin EX fwd_a[0] -pin FWD_UNIT fwd_a[0]
load net fwd_a[1] -attr @rip fwd_a[1] -pin EX fwd_a[1] -pin FWD_UNIT fwd_a[1]
load net fwd_b[0] -attr @rip fwd_b[0] -pin EX fwd_b[0] -pin FWD_UNIT fwd_b[0]
load net fwd_b[1] -attr @rip fwd_b[1] -pin EX fwd_b[1] -pin FWD_UNIT fwd_b[1]
load net id_alu_ctrl[0] -attr @rip alu_ctrl_out[0] -pin EX alu_ctrl[0] -pin ID alu_ctrl_out[0]
load net id_alu_ctrl[1] -attr @rip alu_ctrl_out[1] -pin EX alu_ctrl[1] -pin ID alu_ctrl_out[1]
load net id_alu_ctrl[2] -attr @rip alu_ctrl_out[2] -pin EX alu_ctrl[2] -pin ID alu_ctrl_out[2]
load net id_alu_ctrl[3] -attr @rip alu_ctrl_out[3] -pin EX alu_ctrl[3] -pin ID alu_ctrl_out[3]
load net id_alu_src -pin EX alu_src -pin ID alu_src_out
netloc id_alu_src 1 3 2 4520J 230 7031
load net id_branch -pin EX branch_in -pin ID branch_out
netloc id_branch 1 3 2 4500J 210 6690
load net id_imm[0] -attr @rip imm_out[0] -pin EX imm[0] -pin ID imm_out[0]
load net id_imm[1] -attr @rip imm_out[1] -pin EX imm[1] -pin ID imm_out[1]
load net id_imm[2] -attr @rip imm_out[2] -pin EX imm[2] -pin ID imm_out[2]
load net id_imm[3] -attr @rip imm_out[3] -pin EX imm[3] -pin ID imm_out[3]
load net id_imm[4] -attr @rip imm_out[4] -pin EX imm[4] -pin ID imm_out[4]
load net id_imm[5] -attr @rip imm_out[5] -pin EX imm[5] -pin ID imm_out[5]
load net id_imm[6] -attr @rip imm_out[6] -pin EX imm[6] -pin ID imm_out[6]
load net id_imm[7] -attr @rip imm_out[7] -pin EX imm[7] -pin ID imm_out[7]
load net id_mem_read -pin EX mem_read_in -pin ID mem_read_out
netloc id_mem_read 1 3 2 4620J 310 6710
load net id_mem_to_reg -pin EX mem_to_reg_in -pin ID mem_to_reg_out
netloc id_mem_to_reg 1 3 2 NJ 858 6730
load net id_mem_write -pin EX mem_write_in -pin ID mem_write_out
netloc id_mem_write 1 3 2 4500J 878 6750
load net id_pc[0] -attr @rip 0 -pin EX pc_in[0] -pin ID pc_out
netloc id_pc[0] 1 3 2 4560J 898 6770
load net id_rd[0] -attr @rip rd_out[0] -pin EX rd_in[0] -pin ID rd_out[0]
load net id_rd[1] -attr @rip rd_out[1] -pin EX rd_in[1] -pin ID rd_out[1]
load net id_rd[2] -attr @rip rd_out[2] -pin EX rd_in[2] -pin ID rd_out[2]
load net id_rd[3] -attr @rip rd_out[3] -pin EX rd_in[3] -pin ID rd_out[3]
load net id_rd[4] -attr @rip rd_out[4] -pin EX rd_in[4] -pin ID rd_out[4]
load net id_rdata1[0] -attr @rip read_data1_out[0] -pin EX op1[0] -pin ID read_data1_out[0]
load net id_rdata1[1] -attr @rip read_data1_out[1] -pin EX op1[1] -pin ID read_data1_out[1]
load net id_rdata1[2] -attr @rip read_data1_out[2] -pin EX op1[2] -pin ID read_data1_out[2]
load net id_rdata1[3] -attr @rip read_data1_out[3] -pin EX op1[3] -pin ID read_data1_out[3]
load net id_rdata1[4] -attr @rip read_data1_out[4] -pin EX op1[4] -pin ID read_data1_out[4]
load net id_rdata1[5] -attr @rip read_data1_out[5] -pin EX op1[5] -pin ID read_data1_out[5]
load net id_rdata1[6] -attr @rip read_data1_out[6] -pin EX op1[6] -pin ID read_data1_out[6]
load net id_rdata1[7] -attr @rip read_data1_out[7] -pin EX op1[7] -pin ID read_data1_out[7]
load net id_rdata2[0] -attr @rip read_data2_out[0] -pin EX op2[0] -pin ID read_data2_out[0]
load net id_rdata2[1] -attr @rip read_data2_out[1] -pin EX op2[1] -pin ID read_data2_out[1]
load net id_rdata2[2] -attr @rip read_data2_out[2] -pin EX op2[2] -pin ID read_data2_out[2]
load net id_rdata2[3] -attr @rip read_data2_out[3] -pin EX op2[3] -pin ID read_data2_out[3]
load net id_rdata2[4] -attr @rip read_data2_out[4] -pin EX op2[4] -pin ID read_data2_out[4]
load net id_rdata2[5] -attr @rip read_data2_out[5] -pin EX op2[5] -pin ID read_data2_out[5]
load net id_rdata2[6] -attr @rip read_data2_out[6] -pin EX op2[6] -pin ID read_data2_out[6]
load net id_rdata2[7] -attr @rip read_data2_out[7] -pin EX op2[7] -pin ID read_data2_out[7]
load net id_reg_write -pin EX reg_write_in -pin ID reg_write_out
netloc id_reg_write 1 3 2 4760J 978 6710
load net id_rs1[0] -attr @rip rs1_out[0] -pin FWD_UNIT rs1_ex[0] -pin ID rs1_out[0]
load net id_rs1[1] -attr @rip rs1_out[1] -pin FWD_UNIT rs1_ex[1] -pin ID rs1_out[1]
load net id_rs1[2] -attr @rip rs1_out[2] -pin FWD_UNIT rs1_ex[2] -pin ID rs1_out[2]
load net id_rs1[3] -attr @rip rs1_out[3] -pin FWD_UNIT rs1_ex[3] -pin ID rs1_out[3]
load net id_rs1[4] -attr @rip rs1_out[4] -pin FWD_UNIT rs1_ex[4] -pin ID rs1_out[4]
load net id_rs2[0] -attr @rip rs2_out[0] -pin FWD_UNIT rs2_ex[0] -pin ID rs2_out[0]
load net id_rs2[1] -attr @rip rs2_out[1] -pin FWD_UNIT rs2_ex[1] -pin ID rs2_out[1]
load net id_rs2[2] -attr @rip rs2_out[2] -pin FWD_UNIT rs2_ex[2] -pin ID rs2_out[2]
load net id_rs2[3] -attr @rip rs2_out[3] -pin FWD_UNIT rs2_ex[3] -pin ID rs2_out[3]
load net id_rs2[4] -attr @rip rs2_out[4] -pin FWD_UNIT rs2_ex[4] -pin ID rs2_out[4]
load net if_instruction[0] -attr @rip instruction_out[0] -pin ID instruction[0] -pin IF instruction_out[0]
load net if_instruction[10] -attr @rip instruction_out[10] -pin ID instruction[10] -pin IF instruction_out[10]
load net if_instruction[11] -attr @rip instruction_out[11] -pin ID instruction[11] -pin IF instruction_out[11]
load net if_instruction[12] -attr @rip instruction_out[12] -pin ID instruction[12] -pin IF instruction_out[12]
load net if_instruction[13] -attr @rip instruction_out[13] -pin ID instruction[13] -pin IF instruction_out[13]
load net if_instruction[14] -attr @rip instruction_out[14] -pin ID instruction[14] -pin IF instruction_out[14]
load net if_instruction[15] -attr @rip instruction_out[15] -pin ID instruction[15] -pin IF instruction_out[15]
load net if_instruction[16] -attr @rip instruction_out[16] -pin ID instruction[16] -pin IF instruction_out[16]
load net if_instruction[17] -attr @rip instruction_out[17] -pin ID instruction[17] -pin IF instruction_out[17]
load net if_instruction[18] -attr @rip instruction_out[18] -pin ID instruction[18] -pin IF instruction_out[18]
load net if_instruction[19] -attr @rip instruction_out[19] -pin ID instruction[19] -pin IF instruction_out[19]
load net if_instruction[1] -attr @rip instruction_out[1] -pin ID instruction[1] -pin IF instruction_out[1]
load net if_instruction[20] -attr @rip instruction_out[20] -pin ID instruction[20] -pin IF instruction_out[20]
load net if_instruction[21] -attr @rip instruction_out[21] -pin ID instruction[21] -pin IF instruction_out[21]
load net if_instruction[22] -attr @rip instruction_out[22] -pin ID instruction[22] -pin IF instruction_out[22]
load net if_instruction[23] -attr @rip instruction_out[23] -pin ID instruction[23] -pin IF instruction_out[23]
load net if_instruction[24] -attr @rip instruction_out[24] -pin ID instruction[24] -pin IF instruction_out[24]
load net if_instruction[25] -attr @rip instruction_out[25] -pin ID instruction[25] -pin IF instruction_out[25]
load net if_instruction[26] -attr @rip instruction_out[26] -pin ID instruction[26] -pin IF instruction_out[26]
load net if_instruction[27] -attr @rip instruction_out[27] -pin ID instruction[27] -pin IF instruction_out[27]
load net if_instruction[28] -attr @rip instruction_out[28] -pin ID instruction[28] -pin IF instruction_out[28]
load net if_instruction[29] -attr @rip instruction_out[29] -pin ID instruction[29] -pin IF instruction_out[29]
load net if_instruction[2] -attr @rip instruction_out[2] -pin ID instruction[2] -pin IF instruction_out[2]
load net if_instruction[30] -attr @rip instruction_out[30] -pin ID instruction[30] -pin IF instruction_out[30]
load net if_instruction[31] -attr @rip instruction_out[31] -pin ID instruction[31] -pin IF instruction_out[31]
load net if_instruction[3] -attr @rip instruction_out[3] -pin ID instruction[3] -pin IF instruction_out[3]
load net if_instruction[4] -attr @rip instruction_out[4] -pin ID instruction[4] -pin IF instruction_out[4]
load net if_instruction[5] -attr @rip instruction_out[5] -pin ID instruction[5] -pin IF instruction_out[5]
load net if_instruction[6] -attr @rip instruction_out[6] -pin ID instruction[6] -pin IF instruction_out[6]
load net if_instruction[7] -attr @rip instruction_out[7] -pin ID instruction[7] -pin IF instruction_out[7]
load net if_instruction[8] -attr @rip instruction_out[8] -pin ID instruction[8] -pin IF instruction_out[8]
load net if_instruction[9] -attr @rip instruction_out[9] -pin ID instruction[9] -pin IF instruction_out[9]
load net if_pc[0] -attr @rip pc_out[0] -pin ID pc_in[0] -pin IF pc_out[0]
load net if_pc[1] -attr @rip pc_out[1] -pin ID pc_in[1] -pin IF pc_out[1]
load net if_pc[2] -attr @rip pc_out[2] -pin ID pc_in[2] -pin IF pc_out[2]
load net if_pc[3] -attr @rip pc_out[3] -pin ID pc_in[3] -pin IF pc_out[3]
load net if_pc[4] -attr @rip pc_out[4] -pin ID pc_in[4] -pin IF pc_out[4]
load net if_pc[5] -attr @rip pc_out[5] -pin ID pc_in[5] -pin IF pc_out[5]
load net if_pc[6] -attr @rip pc_out[6] -pin ID pc_in[6] -pin IF pc_out[6]
load net if_pc[7] -attr @rip pc_out[7] -pin ID pc_in[7] -pin IF pc_out[7]
load net mem_alu_result[0] -attr @rip alu_result_out[0] -pin MEM alu_result_out[0] -pin WB alu_result[0]
load net mem_alu_result[1] -attr @rip alu_result_out[1] -pin MEM alu_result_out[1] -pin WB alu_result[1]
load net mem_alu_result[2] -attr @rip alu_result_out[2] -pin MEM alu_result_out[2] -pin WB alu_result[2]
load net mem_alu_result[3] -attr @rip alu_result_out[3] -pin MEM alu_result_out[3] -pin WB alu_result[3]
load net mem_alu_result[4] -attr @rip alu_result_out[4] -pin MEM alu_result_out[4] -pin WB alu_result[4]
load net mem_alu_result[5] -attr @rip alu_result_out[5] -pin MEM alu_result_out[5] -pin WB alu_result[5]
load net mem_alu_result[6] -attr @rip alu_result_out[6] -pin MEM alu_result_out[6] -pin WB alu_result[6]
load net mem_alu_result[7] -attr @rip alu_result_out[7] -pin MEM alu_result_out[7] -pin WB alu_result[7]
load net mem_mem_to_reg -pin MEM mem_to_reg_out -pin WB mem_to_reg
netloc mem_mem_to_reg 1 1 1 1370 438n
load net mem_rd[0] -attr @rip rd_out[0] -pin FWD_UNIT rd_wb[0] -pin ID rd_wb[0] -pin MEM rd_out[0]
load net mem_rd[1] -attr @rip rd_out[1] -pin FWD_UNIT rd_wb[1] -pin ID rd_wb[1] -pin MEM rd_out[1]
load net mem_rd[2] -attr @rip rd_out[2] -pin FWD_UNIT rd_wb[2] -pin ID rd_wb[2] -pin MEM rd_out[2]
load net mem_rd[3] -attr @rip rd_out[3] -pin FWD_UNIT rd_wb[3] -pin ID rd_wb[3] -pin MEM rd_out[3]
load net mem_rd[4] -attr @rip rd_out[4] -pin FWD_UNIT rd_wb[4] -pin ID rd_wb[4] -pin MEM rd_out[4]
load net mem_read_data[0] -attr @rip read_data_out[0] -pin MEM read_data_out[0] -pin WB read_data[0]
load net mem_read_data[1] -attr @rip read_data_out[1] -pin MEM read_data_out[1] -pin WB read_data[1]
load net mem_read_data[2] -attr @rip read_data_out[2] -pin MEM read_data_out[2] -pin WB read_data[2]
load net mem_read_data[3] -attr @rip read_data_out[3] -pin MEM read_data_out[3] -pin WB read_data[3]
load net mem_read_data[4] -attr @rip read_data_out[4] -pin MEM read_data_out[4] -pin WB read_data[4]
load net mem_read_data[5] -attr @rip read_data_out[5] -pin MEM read_data_out[5] -pin WB read_data[5]
load net mem_read_data[6] -attr @rip read_data_out[6] -pin MEM read_data_out[6] -pin WB read_data[6]
load net mem_read_data[7] -attr @rip read_data_out[7] -pin MEM read_data_out[7] -pin WB read_data[7]
load net mem_reg_write -pin FWD_UNIT reg_write_wb -pin ID reg_write_wb -pin MEM reg_write_out
netloc mem_reg_write 1 1 3 1470 618 3080 2088 4680J
load net pc_branch[0] -attr @rip pc_branch_out[0] -pin IF pc_jump[0] -pin MEM pc_branch_out[0]
load net pc_branch[1] -attr @rip pc_branch_out[1] -pin IF pc_jump[1] -pin MEM pc_branch_out[1]
load net pc_branch[2] -attr @rip pc_branch_out[2] -pin IF pc_jump[2] -pin MEM pc_branch_out[2]
load net pc_branch[3] -attr @rip pc_branch_out[3] -pin IF pc_jump[3] -pin MEM pc_branch_out[3]
load net pc_branch[4] -attr @rip pc_branch_out[4] -pin IF pc_jump[4] -pin MEM pc_branch_out[4]
load net pc_branch[5] -attr @rip pc_branch_out[5] -pin IF pc_jump[5] -pin MEM pc_branch_out[5]
load net pc_branch[6] -attr @rip pc_branch_out[6] -pin IF pc_jump[6] -pin MEM pc_branch_out[6]
load net pc_branch[7] -attr @rip pc_branch_out[7] -pin IF pc_jump[7] -pin MEM pc_branch_out[7]
load net pc_src -pin IF pc_src -pin MEM pc_src
netloc pc_src 1 1 1 1350 478n
load net reset -pin EX reset -pin ID reset -pin IF reset -pin MEM reset -port reset
netloc reset 1 0 5 20 998 1450 638 3060 2108 4780J 998 6690J
load net wb_write_data[0] -attr @rip write_data[0] -pin EX mem_wb_result[0] -pin ID write_data[0] -pin WB write_data[0]
load net wb_write_data[1] -attr @rip write_data[1] -pin EX mem_wb_result[1] -pin ID write_data[1] -pin WB write_data[1]
load net wb_write_data[2] -attr @rip write_data[2] -pin EX mem_wb_result[2] -pin ID write_data[2] -pin WB write_data[2]
load net wb_write_data[3] -attr @rip write_data[3] -pin EX mem_wb_result[3] -pin ID write_data[3] -pin WB write_data[3]
load net wb_write_data[4] -attr @rip write_data[4] -pin EX mem_wb_result[4] -pin ID write_data[4] -pin WB write_data[4]
load net wb_write_data[5] -attr @rip write_data[5] -pin EX mem_wb_result[5] -pin ID write_data[5] -pin WB write_data[5]
load net wb_write_data[6] -attr @rip write_data[6] -pin EX mem_wb_result[6] -pin ID write_data[6] -pin WB write_data[6]
load net wb_write_data[7] -attr @rip write_data[7] -pin EX mem_wb_result[7] -pin ID write_data[7] -pin WB write_data[7]
load net EX|alu_ctrl[0] -attr @rip(#000000) alu_ctrl[0] -attr @name alu_ctrl[0] -hierPin EX alu_ctrl[0] -pin EX|ALU alu_ctrl[0]
load net EX|alu_ctrl[1] -attr @rip(#000000) alu_ctrl[1] -attr @name alu_ctrl[1] -hierPin EX alu_ctrl[1] -pin EX|ALU alu_ctrl[1]
load net EX|alu_ctrl[2] -attr @rip(#000000) alu_ctrl[2] -attr @name alu_ctrl[2] -hierPin EX alu_ctrl[2] -pin EX|ALU alu_ctrl[2]
load net EX|alu_ctrl[3] -attr @rip(#000000) alu_ctrl[3] -attr @name alu_ctrl[3] -hierPin EX alu_ctrl[3] -pin EX|ALU alu_ctrl[3]
load net EX|alu_result[0] -attr @rip(#000000) result[0] -attr @name alu_result[0] -pin EX|ALU result[0] -pin EX|alu_result_out_reg[7:0] D[0]
load net EX|alu_result[1] -attr @rip(#000000) result[1] -attr @name alu_result[1] -pin EX|ALU result[1] -pin EX|alu_result_out_reg[7:0] D[1]
load net EX|alu_result[2] -attr @rip(#000000) result[2] -attr @name alu_result[2] -pin EX|ALU result[2] -pin EX|alu_result_out_reg[7:0] D[2]
load net EX|alu_result[3] -attr @rip(#000000) result[3] -attr @name alu_result[3] -pin EX|ALU result[3] -pin EX|alu_result_out_reg[7:0] D[3]
load net EX|alu_result[4] -attr @rip(#000000) result[4] -attr @name alu_result[4] -pin EX|ALU result[4] -pin EX|alu_result_out_reg[7:0] D[4]
load net EX|alu_result[5] -attr @rip(#000000) result[5] -attr @name alu_result[5] -pin EX|ALU result[5] -pin EX|alu_result_out_reg[7:0] D[5]
load net EX|alu_result[6] -attr @rip(#000000) result[6] -attr @name alu_result[6] -pin EX|ALU result[6] -pin EX|alu_result_out_reg[7:0] D[6]
load net EX|alu_result[7] -attr @rip(#000000) result[7] -attr @name alu_result[7] -pin EX|ALU result[7] -pin EX|alu_result_out_reg[7:0] D[7]
load net EX|alu_result_out[0] -attr @rip(#000000) 0 -attr @name alu_result_out[0] -hierPin EX alu_result_out[0] -pin EX|alu_result_out_reg[7:0] Q[0]
load net EX|alu_result_out[1] -attr @rip(#000000) 1 -attr @name alu_result_out[1] -hierPin EX alu_result_out[1] -pin EX|alu_result_out_reg[7:0] Q[1]
load net EX|alu_result_out[2] -attr @rip(#000000) 2 -attr @name alu_result_out[2] -hierPin EX alu_result_out[2] -pin EX|alu_result_out_reg[7:0] Q[2]
load net EX|alu_result_out[3] -attr @rip(#000000) 3 -attr @name alu_result_out[3] -hierPin EX alu_result_out[3] -pin EX|alu_result_out_reg[7:0] Q[3]
load net EX|alu_result_out[4] -attr @rip(#000000) 4 -attr @name alu_result_out[4] -hierPin EX alu_result_out[4] -pin EX|alu_result_out_reg[7:0] Q[4]
load net EX|alu_result_out[5] -attr @rip(#000000) 5 -attr @name alu_result_out[5] -hierPin EX alu_result_out[5] -pin EX|alu_result_out_reg[7:0] Q[5]
load net EX|alu_result_out[6] -attr @rip(#000000) 6 -attr @name alu_result_out[6] -hierPin EX alu_result_out[6] -pin EX|alu_result_out_reg[7:0] Q[6]
load net EX|alu_result_out[7] -attr @rip(#000000) 7 -attr @name alu_result_out[7] -hierPin EX alu_result_out[7] -pin EX|alu_result_out_reg[7:0] Q[7]
load net EX|alu_src -attr @name alu_src -hierPin EX alu_src -pin EX|src2_i S
netloc EX|alu_src 1 0 3 7221 638 NJ 638 7801J
load net EX|branch_in -attr @name branch_in -hierPin EX branch_in -pin EX|branch_out_reg D
netloc EX|branch_in 1 0 5 7201J 338 NJ 338 NJ 338 NJ 338 8351J
load net EX|branch_out -attr @name branch_out -hierPin EX branch_out -pin EX|branch_out_reg Q
netloc EX|branch_out 1 5 1 N 308
load net EX|clk -attr @name clk -hierPin EX clk -pin EX|alu_result_out_reg[7:0] C -pin EX|branch_out_reg C -pin EX|mem_read_out_reg C -pin EX|mem_to_reg_out_reg C -pin EX|mem_write_out_reg C -pin EX|pc_out_reg[7:0] C -pin EX|rd_out_reg[4:0] C -pin EX|reg_write_out_reg C -pin EX|src2_raw_out_reg[7:0] C -pin EX|zero_out_reg C
netloc EX|clk 1 0 5 NJ 518 NJ 518 NJ 518 NJ 518 8431
load net EX|ex_mem_result[0] -attr @rip(#000000) ex_mem_result[0] -attr @name ex_mem_result[0] -hierPin EX ex_mem_result[0] -pin EX|src1_i I0[0] -pin EX|src2_raw_i I0[0]
load net EX|ex_mem_result[1] -attr @rip(#000000) ex_mem_result[1] -attr @name ex_mem_result[1] -hierPin EX ex_mem_result[1] -pin EX|src1_i I0[1] -pin EX|src2_raw_i I0[1]
load net EX|ex_mem_result[2] -attr @rip(#000000) ex_mem_result[2] -attr @name ex_mem_result[2] -hierPin EX ex_mem_result[2] -pin EX|src1_i I0[2] -pin EX|src2_raw_i I0[2]
load net EX|ex_mem_result[3] -attr @rip(#000000) ex_mem_result[3] -attr @name ex_mem_result[3] -hierPin EX ex_mem_result[3] -pin EX|src1_i I0[3] -pin EX|src2_raw_i I0[3]
load net EX|ex_mem_result[4] -attr @rip(#000000) ex_mem_result[4] -attr @name ex_mem_result[4] -hierPin EX ex_mem_result[4] -pin EX|src1_i I0[4] -pin EX|src2_raw_i I0[4]
load net EX|ex_mem_result[5] -attr @rip(#000000) ex_mem_result[5] -attr @name ex_mem_result[5] -hierPin EX ex_mem_result[5] -pin EX|src1_i I0[5] -pin EX|src2_raw_i I0[5]
load net EX|ex_mem_result[6] -attr @rip(#000000) ex_mem_result[6] -attr @name ex_mem_result[6] -hierPin EX ex_mem_result[6] -pin EX|src1_i I0[6] -pin EX|src2_raw_i I0[6]
load net EX|ex_mem_result[7] -attr @rip(#000000) ex_mem_result[7] -attr @name ex_mem_result[7] -hierPin EX ex_mem_result[7] -pin EX|src1_i I0[7] -pin EX|src2_raw_i I0[7]
load net EX|fwd_a[0] -attr @rip(#000000) fwd_a[0] -attr @name fwd_a[0] -hierPin EX fwd_a[0] -pin EX|src10_i S[0] -pin EX|src1_i S[0]
load net EX|fwd_a[1] -attr @rip(#000000) fwd_a[1] -attr @name fwd_a[1] -hierPin EX fwd_a[1] -pin EX|src10_i S[1] -pin EX|src1_i S[1]
load net EX|fwd_b[0] -attr @rip(#000000) fwd_b[0] -attr @name fwd_b[0] -hierPin EX fwd_b[0] -pin EX|src2_raw0_i S[0] -pin EX|src2_raw_i S[0]
load net EX|fwd_b[1] -attr @rip(#000000) fwd_b[1] -attr @name fwd_b[1] -hierPin EX fwd_b[1] -pin EX|src2_raw0_i S[1] -pin EX|src2_raw_i S[1]
load net EX|imm[0] -attr @rip(#000000) imm[0] -attr @name imm[0] -hierPin EX imm[0] -pin EX|pc_branch_i I1[0] -pin EX|src2_i I0[0]
load net EX|imm[1] -attr @rip(#000000) imm[1] -attr @name imm[1] -hierPin EX imm[1] -pin EX|pc_branch_i I1[1] -pin EX|src2_i I0[1]
load net EX|imm[2] -attr @rip(#000000) imm[2] -attr @name imm[2] -hierPin EX imm[2] -pin EX|pc_branch_i I1[2] -pin EX|src2_i I0[2]
load net EX|imm[3] -attr @rip(#000000) imm[3] -attr @name imm[3] -hierPin EX imm[3] -pin EX|pc_branch_i I1[3] -pin EX|src2_i I0[3]
load net EX|imm[4] -attr @rip(#000000) imm[4] -attr @name imm[4] -hierPin EX imm[4] -pin EX|pc_branch_i I1[4] -pin EX|src2_i I0[4]
load net EX|imm[5] -attr @rip(#000000) imm[5] -attr @name imm[5] -hierPin EX imm[5] -pin EX|pc_branch_i I1[5] -pin EX|src2_i I0[5]
load net EX|imm[6] -attr @rip(#000000) imm[6] -attr @name imm[6] -hierPin EX imm[6] -pin EX|pc_branch_i I1[6] -pin EX|src2_i I0[6]
load net EX|imm[7] -attr @rip(#000000) imm[7] -attr @name imm[7] -hierPin EX imm[7] -pin EX|pc_branch_i I1[7] -pin EX|src2_i I0[7]
load net EX|mem_read_in -attr @name mem_read_in -hierPin EX mem_read_in -pin EX|mem_read_out_reg D
netloc EX|mem_read_in 1 0 5 NJ 618 NJ 618 7781J 538 NJ 538 8391J
load net EX|mem_read_out -attr @name mem_read_out -hierPin EX mem_read_out -pin EX|mem_read_out_reg Q
netloc EX|mem_read_out 1 5 1 N 558
load net EX|mem_to_reg_in -attr @name mem_to_reg_in -hierPin EX mem_to_reg_in -pin EX|mem_to_reg_out_reg D
netloc EX|mem_to_reg_in 1 0 5 NJ 658 NJ 658 7781J 698 NJ 698 8391J
load net EX|mem_to_reg_out -attr @name mem_to_reg_out -hierPin EX mem_to_reg_out -pin EX|mem_to_reg_out_reg Q
netloc EX|mem_to_reg_out 1 5 1 N 678
load net EX|mem_wb_result[0] -attr @rip(#000000) mem_wb_result[0] -attr @name mem_wb_result[0] -hierPin EX mem_wb_result[0] -pin EX|src10_i I0[0] -pin EX|src2_raw0_i I0[0]
load net EX|mem_wb_result[1] -attr @rip(#000000) mem_wb_result[1] -attr @name mem_wb_result[1] -hierPin EX mem_wb_result[1] -pin EX|src10_i I0[1] -pin EX|src2_raw0_i I0[1]
load net EX|mem_wb_result[2] -attr @rip(#000000) mem_wb_result[2] -attr @name mem_wb_result[2] -hierPin EX mem_wb_result[2] -pin EX|src10_i I0[2] -pin EX|src2_raw0_i I0[2]
load net EX|mem_wb_result[3] -attr @rip(#000000) mem_wb_result[3] -attr @name mem_wb_result[3] -hierPin EX mem_wb_result[3] -pin EX|src10_i I0[3] -pin EX|src2_raw0_i I0[3]
load net EX|mem_wb_result[4] -attr @rip(#000000) mem_wb_result[4] -attr @name mem_wb_result[4] -hierPin EX mem_wb_result[4] -pin EX|src10_i I0[4] -pin EX|src2_raw0_i I0[4]
load net EX|mem_wb_result[5] -attr @rip(#000000) mem_wb_result[5] -attr @name mem_wb_result[5] -hierPin EX mem_wb_result[5] -pin EX|src10_i I0[5] -pin EX|src2_raw0_i I0[5]
load net EX|mem_wb_result[6] -attr @rip(#000000) mem_wb_result[6] -attr @name mem_wb_result[6] -hierPin EX mem_wb_result[6] -pin EX|src10_i I0[6] -pin EX|src2_raw0_i I0[6]
load net EX|mem_wb_result[7] -attr @rip(#000000) mem_wb_result[7] -attr @name mem_wb_result[7] -hierPin EX mem_wb_result[7] -pin EX|src10_i I0[7] -pin EX|src2_raw0_i I0[7]
load net EX|mem_write_in -attr @name mem_write_in -hierPin EX mem_write_in -pin EX|mem_write_out_reg D
netloc EX|mem_write_in 1 0 5 NJ 818 NJ 818 NJ 818 NJ 818 8451J
load net EX|mem_write_out -attr @name mem_write_out -hierPin EX mem_write_out -pin EX|mem_write_out_reg Q
netloc EX|mem_write_out 1 5 1 N 798
load net EX|op1[0] -attr @rip(#000000) op1[0] -attr @name op1[0] -hierPin EX op1[0] -pin EX|src10_i I1[0]
load net EX|op1[1] -attr @rip(#000000) op1[1] -attr @name op1[1] -hierPin EX op1[1] -pin EX|src10_i I1[1]
load net EX|op1[2] -attr @rip(#000000) op1[2] -attr @name op1[2] -hierPin EX op1[2] -pin EX|src10_i I1[2]
load net EX|op1[3] -attr @rip(#000000) op1[3] -attr @name op1[3] -hierPin EX op1[3] -pin EX|src10_i I1[3]
load net EX|op1[4] -attr @rip(#000000) op1[4] -attr @name op1[4] -hierPin EX op1[4] -pin EX|src10_i I1[4]
load net EX|op1[5] -attr @rip(#000000) op1[5] -attr @name op1[5] -hierPin EX op1[5] -pin EX|src10_i I1[5]
load net EX|op1[6] -attr @rip(#000000) op1[6] -attr @name op1[6] -hierPin EX op1[6] -pin EX|src10_i I1[6]
load net EX|op1[7] -attr @rip(#000000) op1[7] -attr @name op1[7] -hierPin EX op1[7] -pin EX|src10_i I1[7]
load net EX|op2[0] -attr @rip(#000000) op2[0] -attr @name op2[0] -hierPin EX op2[0] -pin EX|src2_raw0_i I1[0]
load net EX|op2[1] -attr @rip(#000000) op2[1] -attr @name op2[1] -hierPin EX op2[1] -pin EX|src2_raw0_i I1[1]
load net EX|op2[2] -attr @rip(#000000) op2[2] -attr @name op2[2] -hierPin EX op2[2] -pin EX|src2_raw0_i I1[2]
load net EX|op2[3] -attr @rip(#000000) op2[3] -attr @name op2[3] -hierPin EX op2[3] -pin EX|src2_raw0_i I1[3]
load net EX|op2[4] -attr @rip(#000000) op2[4] -attr @name op2[4] -hierPin EX op2[4] -pin EX|src2_raw0_i I1[4]
load net EX|op2[5] -attr @rip(#000000) op2[5] -attr @name op2[5] -hierPin EX op2[5] -pin EX|src2_raw0_i I1[5]
load net EX|op2[6] -attr @rip(#000000) op2[6] -attr @name op2[6] -hierPin EX op2[6] -pin EX|src2_raw0_i I1[6]
load net EX|op2[7] -attr @rip(#000000) op2[7] -attr @name op2[7] -hierPin EX op2[7] -pin EX|src2_raw0_i I1[7]
load net EX|pc_branch[0] -attr @rip(#000000) O[0] -attr @name pc_branch[0] -pin EX|pc_branch_i O[0] -pin EX|pc_out_reg[7:0] D[0]
load net EX|pc_branch[1] -attr @rip(#000000) O[1] -attr @name pc_branch[1] -pin EX|pc_branch_i O[1] -pin EX|pc_out_reg[7:0] D[1]
load net EX|pc_branch[2] -attr @rip(#000000) O[2] -attr @name pc_branch[2] -pin EX|pc_branch_i O[2] -pin EX|pc_out_reg[7:0] D[2]
load net EX|pc_branch[3] -attr @rip(#000000) O[3] -attr @name pc_branch[3] -pin EX|pc_branch_i O[3] -pin EX|pc_out_reg[7:0] D[3]
load net EX|pc_branch[4] -attr @rip(#000000) O[4] -attr @name pc_branch[4] -pin EX|pc_branch_i O[4] -pin EX|pc_out_reg[7:0] D[4]
load net EX|pc_branch[5] -attr @rip(#000000) O[5] -attr @name pc_branch[5] -pin EX|pc_branch_i O[5] -pin EX|pc_out_reg[7:0] D[5]
load net EX|pc_branch[6] -attr @rip(#000000) O[6] -attr @name pc_branch[6] -pin EX|pc_branch_i O[6] -pin EX|pc_out_reg[7:0] D[6]
load net EX|pc_branch[7] -attr @rip(#000000) O[7] -attr @name pc_branch[7] -pin EX|pc_branch_i O[7] -pin EX|pc_out_reg[7:0] D[7]
load net EX|pc_in[0] -attr @rip(#000000) pc_in[0] -attr @name pc_in[0] -hierPin EX pc_in[0] -pin EX|pc_branch_i I0[0]
load net EX|pc_in[1] -attr @rip(#000000) pc_in[1] -attr @name pc_in[1] -hierPin EX pc_in[1] -pin EX|pc_branch_i I0[1]
load net EX|pc_in[2] -attr @rip(#000000) pc_in[2] -attr @name pc_in[2] -hierPin EX pc_in[2] -pin EX|pc_branch_i I0[2]
load net EX|pc_in[3] -attr @rip(#000000) pc_in[3] -attr @name pc_in[3] -hierPin EX pc_in[3] -pin EX|pc_branch_i I0[3]
load net EX|pc_in[4] -attr @rip(#000000) pc_in[4] -attr @name pc_in[4] -hierPin EX pc_in[4] -pin EX|pc_branch_i I0[4]
load net EX|pc_in[5] -attr @rip(#000000) pc_in[5] -attr @name pc_in[5] -hierPin EX pc_in[5] -pin EX|pc_branch_i I0[5]
load net EX|pc_in[6] -attr @rip(#000000) pc_in[6] -attr @name pc_in[6] -hierPin EX pc_in[6] -pin EX|pc_branch_i I0[6]
load net EX|pc_in[7] -attr @rip(#000000) pc_in[7] -attr @name pc_in[7] -hierPin EX pc_in[7] -pin EX|pc_branch_i I0[7]
load net EX|pc_out[0] -attr @rip(#000000) 0 -attr @name pc_out[0] -hierPin EX pc_out[0] -pin EX|pc_out_reg[7:0] Q[0]
load net EX|pc_out[1] -attr @rip(#000000) 1 -attr @name pc_out[1] -hierPin EX pc_out[1] -pin EX|pc_out_reg[7:0] Q[1]
load net EX|pc_out[2] -attr @rip(#000000) 2 -attr @name pc_out[2] -hierPin EX pc_out[2] -pin EX|pc_out_reg[7:0] Q[2]
load net EX|pc_out[3] -attr @rip(#000000) 3 -attr @name pc_out[3] -hierPin EX pc_out[3] -pin EX|pc_out_reg[7:0] Q[3]
load net EX|pc_out[4] -attr @rip(#000000) 4 -attr @name pc_out[4] -hierPin EX pc_out[4] -pin EX|pc_out_reg[7:0] Q[4]
load net EX|pc_out[5] -attr @rip(#000000) 5 -attr @name pc_out[5] -hierPin EX pc_out[5] -pin EX|pc_out_reg[7:0] Q[5]
load net EX|pc_out[6] -attr @rip(#000000) 6 -attr @name pc_out[6] -hierPin EX pc_out[6] -pin EX|pc_out_reg[7:0] Q[6]
load net EX|pc_out[7] -attr @rip(#000000) 7 -attr @name pc_out[7] -hierPin EX pc_out[7] -pin EX|pc_out_reg[7:0] Q[7]
load net EX|rd_in[0] -attr @rip(#000000) rd_in[0] -attr @name rd_in[0] -hierPin EX rd_in[0] -pin EX|rd_out_reg[4:0] D[0]
load net EX|rd_in[1] -attr @rip(#000000) rd_in[1] -attr @name rd_in[1] -hierPin EX rd_in[1] -pin EX|rd_out_reg[4:0] D[1]
load net EX|rd_in[2] -attr @rip(#000000) rd_in[2] -attr @name rd_in[2] -hierPin EX rd_in[2] -pin EX|rd_out_reg[4:0] D[2]
load net EX|rd_in[3] -attr @rip(#000000) rd_in[3] -attr @name rd_in[3] -hierPin EX rd_in[3] -pin EX|rd_out_reg[4:0] D[3]
load net EX|rd_in[4] -attr @rip(#000000) rd_in[4] -attr @name rd_in[4] -hierPin EX rd_in[4] -pin EX|rd_out_reg[4:0] D[4]
load net EX|rd_out[0] -attr @rip(#000000) 0 -attr @name rd_out[0] -hierPin EX rd_out[0] -pin EX|rd_out_reg[4:0] Q[0]
load net EX|rd_out[1] -attr @rip(#000000) 1 -attr @name rd_out[1] -hierPin EX rd_out[1] -pin EX|rd_out_reg[4:0] Q[1]
load net EX|rd_out[2] -attr @rip(#000000) 2 -attr @name rd_out[2] -hierPin EX rd_out[2] -pin EX|rd_out_reg[4:0] Q[2]
load net EX|rd_out[3] -attr @rip(#000000) 3 -attr @name rd_out[3] -hierPin EX rd_out[3] -pin EX|rd_out_reg[4:0] Q[3]
load net EX|rd_out[4] -attr @rip(#000000) 4 -attr @name rd_out[4] -hierPin EX rd_out[4] -pin EX|rd_out_reg[4:0] Q[4]
load net EX|reg_write_in -attr @name reg_write_in -hierPin EX reg_write_in -pin EX|reg_write_out_reg D
netloc EX|reg_write_in 1 0 5 NJ 1438 NJ 1438 NJ 1438 NJ 1438 N
load net EX|reg_write_out -attr @name reg_write_out -hierPin EX reg_write_out -pin EX|reg_write_out_reg Q
netloc EX|reg_write_out 1 5 1 8741 1148n
load net EX|reset -attr @name reset -hierPin EX reset -pin EX|alu_result_out_reg[7:0] RST -pin EX|branch_out_reg RST -pin EX|mem_read_out_reg RST -pin EX|mem_to_reg_out_reg RST -pin EX|mem_write_out_reg RST -pin EX|pc_out_reg[7:0] RST -pin EX|rd_out_reg[4:0] RST -pin EX|reg_write_out_reg RST -pin EX|src2_raw_out_reg[7:0] RST -pin EX|zero_out_reg RST
netloc EX|reset 1 0 5 NJ 1458 NJ 1458 NJ 1458 NJ 1458 8371
load net EX|src10_i_n_0 -attr @rip(#000000) O[7] -attr @name src10_i_n_0 -pin EX|src10_i O[7] -pin EX|src1_i I1[7]
load net EX|src10_i_n_1 -attr @rip(#000000) O[6] -attr @name src10_i_n_1 -pin EX|src10_i O[6] -pin EX|src1_i I1[6]
load net EX|src10_i_n_2 -attr @rip(#000000) O[5] -attr @name src10_i_n_2 -pin EX|src10_i O[5] -pin EX|src1_i I1[5]
load net EX|src10_i_n_3 -attr @rip(#000000) O[4] -attr @name src10_i_n_3 -pin EX|src10_i O[4] -pin EX|src1_i I1[4]
load net EX|src10_i_n_4 -attr @rip(#000000) O[3] -attr @name src10_i_n_4 -pin EX|src10_i O[3] -pin EX|src1_i I1[3]
load net EX|src10_i_n_5 -attr @rip(#000000) O[2] -attr @name src10_i_n_5 -pin EX|src10_i O[2] -pin EX|src1_i I1[2]
load net EX|src10_i_n_6 -attr @rip(#000000) O[1] -attr @name src10_i_n_6 -pin EX|src10_i O[1] -pin EX|src1_i I1[1]
load net EX|src10_i_n_7 -attr @rip(#000000) O[0] -attr @name src10_i_n_7 -pin EX|src10_i O[0] -pin EX|src1_i I1[0]
load net EX|src1[0] -attr @rip(#000000) O[0] -attr @name src1[0] -pin EX|ALU a[0] -pin EX|src1_i O[0]
load net EX|src1[1] -attr @rip(#000000) O[1] -attr @name src1[1] -pin EX|ALU a[1] -pin EX|src1_i O[1]
load net EX|src1[2] -attr @rip(#000000) O[2] -attr @name src1[2] -pin EX|ALU a[2] -pin EX|src1_i O[2]
load net EX|src1[3] -attr @rip(#000000) O[3] -attr @name src1[3] -pin EX|ALU a[3] -pin EX|src1_i O[3]
load net EX|src1[4] -attr @rip(#000000) O[4] -attr @name src1[4] -pin EX|ALU a[4] -pin EX|src1_i O[4]
load net EX|src1[5] -attr @rip(#000000) O[5] -attr @name src1[5] -pin EX|ALU a[5] -pin EX|src1_i O[5]
load net EX|src1[6] -attr @rip(#000000) O[6] -attr @name src1[6] -pin EX|ALU a[6] -pin EX|src1_i O[6]
load net EX|src1[7] -attr @rip(#000000) O[7] -attr @name src1[7] -pin EX|ALU a[7] -pin EX|src1_i O[7]
load net EX|src2[0] -attr @rip(#000000) O[0] -attr @name src2[0] -pin EX|ALU b[0] -pin EX|src2_i O[0]
load net EX|src2[1] -attr @rip(#000000) O[1] -attr @name src2[1] -pin EX|ALU b[1] -pin EX|src2_i O[1]
load net EX|src2[2] -attr @rip(#000000) O[2] -attr @name src2[2] -pin EX|ALU b[2] -pin EX|src2_i O[2]
load net EX|src2[3] -attr @rip(#000000) O[3] -attr @name src2[3] -pin EX|ALU b[3] -pin EX|src2_i O[3]
load net EX|src2[4] -attr @rip(#000000) O[4] -attr @name src2[4] -pin EX|ALU b[4] -pin EX|src2_i O[4]
load net EX|src2[5] -attr @rip(#000000) O[5] -attr @name src2[5] -pin EX|ALU b[5] -pin EX|src2_i O[5]
load net EX|src2[6] -attr @rip(#000000) O[6] -attr @name src2[6] -pin EX|ALU b[6] -pin EX|src2_i O[6]
load net EX|src2[7] -attr @rip(#000000) O[7] -attr @name src2[7] -pin EX|ALU b[7] -pin EX|src2_i O[7]
load net EX|src2_raw0_i_n_0 -attr @rip(#000000) O[7] -attr @name src2_raw0_i_n_0 -pin EX|src2_raw0_i O[7] -pin EX|src2_raw_i I1[7]
load net EX|src2_raw0_i_n_1 -attr @rip(#000000) O[6] -attr @name src2_raw0_i_n_1 -pin EX|src2_raw0_i O[6] -pin EX|src2_raw_i I1[6]
load net EX|src2_raw0_i_n_2 -attr @rip(#000000) O[5] -attr @name src2_raw0_i_n_2 -pin EX|src2_raw0_i O[5] -pin EX|src2_raw_i I1[5]
load net EX|src2_raw0_i_n_3 -attr @rip(#000000) O[4] -attr @name src2_raw0_i_n_3 -pin EX|src2_raw0_i O[4] -pin EX|src2_raw_i I1[4]
load net EX|src2_raw0_i_n_4 -attr @rip(#000000) O[3] -attr @name src2_raw0_i_n_4 -pin EX|src2_raw0_i O[3] -pin EX|src2_raw_i I1[3]
load net EX|src2_raw0_i_n_5 -attr @rip(#000000) O[2] -attr @name src2_raw0_i_n_5 -pin EX|src2_raw0_i O[2] -pin EX|src2_raw_i I1[2]
load net EX|src2_raw0_i_n_6 -attr @rip(#000000) O[1] -attr @name src2_raw0_i_n_6 -pin EX|src2_raw0_i O[1] -pin EX|src2_raw_i I1[1]
load net EX|src2_raw0_i_n_7 -attr @rip(#000000) O[0] -attr @name src2_raw0_i_n_7 -pin EX|src2_raw0_i O[0] -pin EX|src2_raw_i I1[0]
load net EX|src2_raw[0] -attr @rip(#000000) O[0] -attr @name src2_raw[0] -pin EX|src2_i I1[0] -pin EX|src2_raw_i O[0] -pin EX|src2_raw_out_reg[7:0] D[0]
load net EX|src2_raw[1] -attr @rip(#000000) O[1] -attr @name src2_raw[1] -pin EX|src2_i I1[1] -pin EX|src2_raw_i O[1] -pin EX|src2_raw_out_reg[7:0] D[1]
load net EX|src2_raw[2] -attr @rip(#000000) O[2] -attr @name src2_raw[2] -pin EX|src2_i I1[2] -pin EX|src2_raw_i O[2] -pin EX|src2_raw_out_reg[7:0] D[2]
load net EX|src2_raw[3] -attr @rip(#000000) O[3] -attr @name src2_raw[3] -pin EX|src2_i I1[3] -pin EX|src2_raw_i O[3] -pin EX|src2_raw_out_reg[7:0] D[3]
load net EX|src2_raw[4] -attr @rip(#000000) O[4] -attr @name src2_raw[4] -pin EX|src2_i I1[4] -pin EX|src2_raw_i O[4] -pin EX|src2_raw_out_reg[7:0] D[4]
load net EX|src2_raw[5] -attr @rip(#000000) O[5] -attr @name src2_raw[5] -pin EX|src2_i I1[5] -pin EX|src2_raw_i O[5] -pin EX|src2_raw_out_reg[7:0] D[5]
load net EX|src2_raw[6] -attr @rip(#000000) O[6] -attr @name src2_raw[6] -pin EX|src2_i I1[6] -pin EX|src2_raw_i O[6] -pin EX|src2_raw_out_reg[7:0] D[6]
load net EX|src2_raw[7] -attr @rip(#000000) O[7] -attr @name src2_raw[7] -pin EX|src2_i I1[7] -pin EX|src2_raw_i O[7] -pin EX|src2_raw_out_reg[7:0] D[7]
load net EX|src2_raw_out[0] -attr @rip(#000000) 0 -attr @name src2_raw_out[0] -hierPin EX src2_raw_out[0] -pin EX|src2_raw_out_reg[7:0] Q[0]
load net EX|src2_raw_out[1] -attr @rip(#000000) 1 -attr @name src2_raw_out[1] -hierPin EX src2_raw_out[1] -pin EX|src2_raw_out_reg[7:0] Q[1]
load net EX|src2_raw_out[2] -attr @rip(#000000) 2 -attr @name src2_raw_out[2] -hierPin EX src2_raw_out[2] -pin EX|src2_raw_out_reg[7:0] Q[2]
load net EX|src2_raw_out[3] -attr @rip(#000000) 3 -attr @name src2_raw_out[3] -hierPin EX src2_raw_out[3] -pin EX|src2_raw_out_reg[7:0] Q[3]
load net EX|src2_raw_out[4] -attr @rip(#000000) 4 -attr @name src2_raw_out[4] -hierPin EX src2_raw_out[4] -pin EX|src2_raw_out_reg[7:0] Q[4]
load net EX|src2_raw_out[5] -attr @rip(#000000) 5 -attr @name src2_raw_out[5] -hierPin EX src2_raw_out[5] -pin EX|src2_raw_out_reg[7:0] Q[5]
load net EX|src2_raw_out[6] -attr @rip(#000000) 6 -attr @name src2_raw_out[6] -hierPin EX src2_raw_out[6] -pin EX|src2_raw_out_reg[7:0] Q[6]
load net EX|src2_raw_out[7] -attr @rip(#000000) 7 -attr @name src2_raw_out[7] -hierPin EX src2_raw_out[7] -pin EX|src2_raw_out_reg[7:0] Q[7]
load net EX|zero -attr @name zero -pin EX|ALU zero -pin EX|zero_out_reg D
netloc EX|zero 1 4 1 8411 458n
load net EX|zero_out -attr @name zero_out -hierPin EX zero_out -pin EX|zero_out_reg Q
netloc EX|zero_out 1 5 1 8701 1048n
load net MEM|alu_result_in[0] -attr @rip(#000000) alu_result_in[0] -attr @name alu_result_in[0] -hierPin MEM alu_result_in[0] -pin MEM|DM addr[0] -pin MEM|alu_result_out_reg[7:0] D[0]
load net MEM|alu_result_in[1] -attr @rip(#000000) alu_result_in[1] -attr @name alu_result_in[1] -hierPin MEM alu_result_in[1] -pin MEM|DM addr[1] -pin MEM|alu_result_out_reg[7:0] D[1]
load net MEM|alu_result_in[2] -attr @rip(#000000) alu_result_in[2] -attr @name alu_result_in[2] -hierPin MEM alu_result_in[2] -pin MEM|DM addr[2] -pin MEM|alu_result_out_reg[7:0] D[2]
load net MEM|alu_result_in[3] -attr @rip(#000000) alu_result_in[3] -attr @name alu_result_in[3] -hierPin MEM alu_result_in[3] -pin MEM|DM addr[3] -pin MEM|alu_result_out_reg[7:0] D[3]
load net MEM|alu_result_in[4] -attr @rip(#000000) alu_result_in[4] -attr @name alu_result_in[4] -hierPin MEM alu_result_in[4] -pin MEM|DM addr[4] -pin MEM|alu_result_out_reg[7:0] D[4]
load net MEM|alu_result_in[5] -attr @rip(#000000) alu_result_in[5] -attr @name alu_result_in[5] -hierPin MEM alu_result_in[5] -pin MEM|DM addr[5] -pin MEM|alu_result_out_reg[7:0] D[5]
load net MEM|alu_result_in[6] -attr @rip(#000000) alu_result_in[6] -attr @name alu_result_in[6] -hierPin MEM alu_result_in[6] -pin MEM|DM addr[6] -pin MEM|alu_result_out_reg[7:0] D[6]
load net MEM|alu_result_in[7] -attr @rip(#000000) alu_result_in[7] -attr @name alu_result_in[7] -hierPin MEM alu_result_in[7] -pin MEM|DM addr[7] -pin MEM|alu_result_out_reg[7:0] D[7]
load net MEM|alu_result_out[0] -attr @rip(#000000) 0 -attr @name alu_result_out[0] -hierPin MEM alu_result_out[0] -pin MEM|alu_result_out_reg[7:0] Q[0]
load net MEM|alu_result_out[1] -attr @rip(#000000) 1 -attr @name alu_result_out[1] -hierPin MEM alu_result_out[1] -pin MEM|alu_result_out_reg[7:0] Q[1]
load net MEM|alu_result_out[2] -attr @rip(#000000) 2 -attr @name alu_result_out[2] -hierPin MEM alu_result_out[2] -pin MEM|alu_result_out_reg[7:0] Q[2]
load net MEM|alu_result_out[3] -attr @rip(#000000) 3 -attr @name alu_result_out[3] -hierPin MEM alu_result_out[3] -pin MEM|alu_result_out_reg[7:0] Q[3]
load net MEM|alu_result_out[4] -attr @rip(#000000) 4 -attr @name alu_result_out[4] -hierPin MEM alu_result_out[4] -pin MEM|alu_result_out_reg[7:0] Q[4]
load net MEM|alu_result_out[5] -attr @rip(#000000) 5 -attr @name alu_result_out[5] -hierPin MEM alu_result_out[5] -pin MEM|alu_result_out_reg[7:0] Q[5]
load net MEM|alu_result_out[6] -attr @rip(#000000) 6 -attr @name alu_result_out[6] -hierPin MEM alu_result_out[6] -pin MEM|alu_result_out_reg[7:0] Q[6]
load net MEM|alu_result_out[7] -attr @rip(#000000) 7 -attr @name alu_result_out[7] -hierPin MEM alu_result_out[7] -pin MEM|alu_result_out_reg[7:0] Q[7]
load net MEM|branch_in -attr @name branch_in -hierPin MEM branch_in -pin MEM|pc_src_i I0
netloc MEM|branch_in 1 0 2 440J 628 780
load net MEM|clk -attr @name clk -hierPin MEM clk -pin MEM|DM clk -pin MEM|alu_result_out_reg[7:0] C -pin MEM|mem_to_reg_out_reg C -pin MEM|rd_out_reg[4:0] C -pin MEM|read_data_out_reg[7:0] C -pin MEM|reg_write_out_reg C
netloc MEM|clk 1 0 2 460 428 860
load net MEM|mem_read_in -attr @name mem_read_in -hierPin MEM mem_read_in -pin MEM|DM read
netloc MEM|mem_read_in 1 0 1 420 528n
load net MEM|mem_to_reg_in -attr @name mem_to_reg_in -hierPin MEM mem_to_reg_in -pin MEM|mem_to_reg_out_reg D
netloc MEM|mem_to_reg_in 1 0 2 400J 448 N
load net MEM|mem_to_reg_out -attr @name mem_to_reg_out -hierPin MEM mem_to_reg_out -pin MEM|mem_to_reg_out_reg Q
netloc MEM|mem_to_reg_out 1 2 1 N 438
load net MEM|mem_write_in -attr @name mem_write_in -hierPin MEM mem_write_in -pin MEM|DM write
netloc MEM|mem_write_in 1 0 1 N 568
load net MEM|pc_branch_in[0] -attr @rip(#000000) pc_branch_in[0] -attr @name pc_branch_in[0] -hierPin MEM pc_branch_in[0] -hierPin MEM pc_branch_out[0]
load net MEM|pc_branch_in[1] -attr @rip(#000000) pc_branch_in[1] -attr @name pc_branch_in[1] -hierPin MEM pc_branch_in[1] -hierPin MEM pc_branch_out[1]
load net MEM|pc_branch_in[2] -attr @rip(#000000) pc_branch_in[2] -attr @name pc_branch_in[2] -hierPin MEM pc_branch_in[2] -hierPin MEM pc_branch_out[2]
load net MEM|pc_branch_in[3] -attr @rip(#000000) pc_branch_in[3] -attr @name pc_branch_in[3] -hierPin MEM pc_branch_in[3] -hierPin MEM pc_branch_out[3]
load net MEM|pc_branch_in[4] -attr @rip(#000000) pc_branch_in[4] -attr @name pc_branch_in[4] -hierPin MEM pc_branch_in[4] -hierPin MEM pc_branch_out[4]
load net MEM|pc_branch_in[5] -attr @rip(#000000) pc_branch_in[5] -attr @name pc_branch_in[5] -hierPin MEM pc_branch_in[5] -hierPin MEM pc_branch_out[5]
load net MEM|pc_branch_in[6] -attr @rip(#000000) pc_branch_in[6] -attr @name pc_branch_in[6] -hierPin MEM pc_branch_in[6] -hierPin MEM pc_branch_out[6]
load net MEM|pc_branch_in[7] -attr @rip(#000000) pc_branch_in[7] -attr @name pc_branch_in[7] -hierPin MEM pc_branch_in[7] -hierPin MEM pc_branch_out[7]
load net MEM|pc_src -attr @name pc_src -hierPin MEM pc_src -pin MEM|pc_src_i O
netloc MEM|pc_src 1 2 1 1140 648n
load net MEM|rd_in[0] -attr @rip(#000000) rd_in[0] -attr @name rd_in[0] -hierPin MEM rd_in[0] -pin MEM|rd_out_reg[4:0] D[0]
load net MEM|rd_in[1] -attr @rip(#000000) rd_in[1] -attr @name rd_in[1] -hierPin MEM rd_in[1] -pin MEM|rd_out_reg[4:0] D[1]
load net MEM|rd_in[2] -attr @rip(#000000) rd_in[2] -attr @name rd_in[2] -hierPin MEM rd_in[2] -pin MEM|rd_out_reg[4:0] D[2]
load net MEM|rd_in[3] -attr @rip(#000000) rd_in[3] -attr @name rd_in[3] -hierPin MEM rd_in[3] -pin MEM|rd_out_reg[4:0] D[3]
load net MEM|rd_in[4] -attr @rip(#000000) rd_in[4] -attr @name rd_in[4] -hierPin MEM rd_in[4] -pin MEM|rd_out_reg[4:0] D[4]
load net MEM|rd_out[0] -attr @rip(#000000) 0 -attr @name rd_out[0] -hierPin MEM rd_out[0] -pin MEM|rd_out_reg[4:0] Q[0]
load net MEM|rd_out[1] -attr @rip(#000000) 1 -attr @name rd_out[1] -hierPin MEM rd_out[1] -pin MEM|rd_out_reg[4:0] Q[1]
load net MEM|rd_out[2] -attr @rip(#000000) 2 -attr @name rd_out[2] -hierPin MEM rd_out[2] -pin MEM|rd_out_reg[4:0] Q[2]
load net MEM|rd_out[3] -attr @rip(#000000) 3 -attr @name rd_out[3] -hierPin MEM rd_out[3] -pin MEM|rd_out_reg[4:0] Q[3]
load net MEM|rd_out[4] -attr @rip(#000000) 4 -attr @name rd_out[4] -hierPin MEM rd_out[4] -pin MEM|rd_out_reg[4:0] Q[4]
load net MEM|read_data[0] -attr @rip(#000000) read_data[0] -attr @name read_data[0] -pin MEM|DM read_data[0] -pin MEM|read_data_out_reg[7:0] D[0]
load net MEM|read_data[1] -attr @rip(#000000) read_data[1] -attr @name read_data[1] -pin MEM|DM read_data[1] -pin MEM|read_data_out_reg[7:0] D[1]
load net MEM|read_data[2] -attr @rip(#000000) read_data[2] -attr @name read_data[2] -pin MEM|DM read_data[2] -pin MEM|read_data_out_reg[7:0] D[2]
load net MEM|read_data[3] -attr @rip(#000000) read_data[3] -attr @name read_data[3] -pin MEM|DM read_data[3] -pin MEM|read_data_out_reg[7:0] D[3]
load net MEM|read_data[4] -attr @rip(#000000) read_data[4] -attr @name read_data[4] -pin MEM|DM read_data[4] -pin MEM|read_data_out_reg[7:0] D[4]
load net MEM|read_data[5] -attr @rip(#000000) read_data[5] -attr @name read_data[5] -pin MEM|DM read_data[5] -pin MEM|read_data_out_reg[7:0] D[5]
load net MEM|read_data[6] -attr @rip(#000000) read_data[6] -attr @name read_data[6] -pin MEM|DM read_data[6] -pin MEM|read_data_out_reg[7:0] D[6]
load net MEM|read_data[7] -attr @rip(#000000) read_data[7] -attr @name read_data[7] -pin MEM|DM read_data[7] -pin MEM|read_data_out_reg[7:0] D[7]
load net MEM|read_data_out[0] -attr @rip(#000000) 0 -attr @name read_data_out[0] -hierPin MEM read_data_out[0] -pin MEM|read_data_out_reg[7:0] Q[0]
load net MEM|read_data_out[1] -attr @rip(#000000) 1 -attr @name read_data_out[1] -hierPin MEM read_data_out[1] -pin MEM|read_data_out_reg[7:0] Q[1]
load net MEM|read_data_out[2] -attr @rip(#000000) 2 -attr @name read_data_out[2] -hierPin MEM read_data_out[2] -pin MEM|read_data_out_reg[7:0] Q[2]
load net MEM|read_data_out[3] -attr @rip(#000000) 3 -attr @name read_data_out[3] -hierPin MEM read_data_out[3] -pin MEM|read_data_out_reg[7:0] Q[3]
load net MEM|read_data_out[4] -attr @rip(#000000) 4 -attr @name read_data_out[4] -hierPin MEM read_data_out[4] -pin MEM|read_data_out_reg[7:0] Q[4]
load net MEM|read_data_out[5] -attr @rip(#000000) 5 -attr @name read_data_out[5] -hierPin MEM read_data_out[5] -pin MEM|read_data_out_reg[7:0] Q[5]
load net MEM|read_data_out[6] -attr @rip(#000000) 6 -attr @name read_data_out[6] -hierPin MEM read_data_out[6] -pin MEM|read_data_out_reg[7:0] Q[6]
load net MEM|read_data_out[7] -attr @rip(#000000) 7 -attr @name read_data_out[7] -hierPin MEM read_data_out[7] -pin MEM|read_data_out_reg[7:0] Q[7]
load net MEM|reg_write_in -attr @name reg_write_in -hierPin MEM reg_write_in -pin MEM|reg_write_out_reg D
netloc MEM|reg_write_in 1 0 2 NJ 718 NJ
load net MEM|reg_write_out -attr @name reg_write_out -hierPin MEM reg_write_out -pin MEM|reg_write_out_reg Q
netloc MEM|reg_write_out 1 2 1 N 708
load net MEM|reset -attr @name reset -hierPin MEM reset -pin MEM|alu_result_out_reg[7:0] RST -pin MEM|mem_to_reg_out_reg RST -pin MEM|rd_out_reg[4:0] RST -pin MEM|read_data_out_reg[7:0] RST -pin MEM|reg_write_out_reg RST
netloc MEM|reset 1 0 2 NJ 738 840
load net MEM|write_data_in[0] -attr @rip(#000000) write_data_in[0] -attr @name write_data_in[0] -hierPin MEM write_data_in[0] -pin MEM|DM write_data[0]
load net MEM|write_data_in[1] -attr @rip(#000000) write_data_in[1] -attr @name write_data_in[1] -hierPin MEM write_data_in[1] -pin MEM|DM write_data[1]
load net MEM|write_data_in[2] -attr @rip(#000000) write_data_in[2] -attr @name write_data_in[2] -hierPin MEM write_data_in[2] -pin MEM|DM write_data[2]
load net MEM|write_data_in[3] -attr @rip(#000000) write_data_in[3] -attr @name write_data_in[3] -hierPin MEM write_data_in[3] -pin MEM|DM write_data[3]
load net MEM|write_data_in[4] -attr @rip(#000000) write_data_in[4] -attr @name write_data_in[4] -hierPin MEM write_data_in[4] -pin MEM|DM write_data[4]
load net MEM|write_data_in[5] -attr @rip(#000000) write_data_in[5] -attr @name write_data_in[5] -hierPin MEM write_data_in[5] -pin MEM|DM write_data[5]
load net MEM|write_data_in[6] -attr @rip(#000000) write_data_in[6] -attr @name write_data_in[6] -hierPin MEM write_data_in[6] -pin MEM|DM write_data[6]
load net MEM|write_data_in[7] -attr @rip(#000000) write_data_in[7] -attr @name write_data_in[7] -hierPin MEM write_data_in[7] -pin MEM|DM write_data[7]
load net MEM|zero_in -attr @name zero_in -hierPin MEM zero_in -pin MEM|pc_src_i I1
netloc MEM|zero_in 1 0 2 NJ 938 NJ
load net WB|alu_result[0] -attr @rip alu_result[0] -attr @name alu_result[0] -hierPin WB alu_result[0] -pin WB|write_data_i I1[0]
load net WB|alu_result[1] -attr @rip alu_result[1] -attr @name alu_result[1] -hierPin WB alu_result[1] -pin WB|write_data_i I1[1]
load net WB|alu_result[2] -attr @rip alu_result[2] -attr @name alu_result[2] -hierPin WB alu_result[2] -pin WB|write_data_i I1[2]
load net WB|alu_result[3] -attr @rip alu_result[3] -attr @name alu_result[3] -hierPin WB alu_result[3] -pin WB|write_data_i I1[3]
load net WB|alu_result[4] -attr @rip alu_result[4] -attr @name alu_result[4] -hierPin WB alu_result[4] -pin WB|write_data_i I1[4]
load net WB|alu_result[5] -attr @rip alu_result[5] -attr @name alu_result[5] -hierPin WB alu_result[5] -pin WB|write_data_i I1[5]
load net WB|alu_result[6] -attr @rip alu_result[6] -attr @name alu_result[6] -hierPin WB alu_result[6] -pin WB|write_data_i I1[6]
load net WB|alu_result[7] -attr @rip alu_result[7] -attr @name alu_result[7] -hierPin WB alu_result[7] -pin WB|write_data_i I1[7]
load net WB|mem_to_reg -attr @name mem_to_reg -hierPin WB mem_to_reg -pin WB|write_data_i S
netloc WB|mem_to_reg 1 0 1 1630 756n
load net WB|read_data[0] -attr @rip read_data[0] -attr @name read_data[0] -hierPin WB read_data[0] -pin WB|write_data_i I0[0]
load net WB|read_data[1] -attr @rip read_data[1] -attr @name read_data[1] -hierPin WB read_data[1] -pin WB|write_data_i I0[1]
load net WB|read_data[2] -attr @rip read_data[2] -attr @name read_data[2] -hierPin WB read_data[2] -pin WB|write_data_i I0[2]
load net WB|read_data[3] -attr @rip read_data[3] -attr @name read_data[3] -hierPin WB read_data[3] -pin WB|write_data_i I0[3]
load net WB|read_data[4] -attr @rip read_data[4] -attr @name read_data[4] -hierPin WB read_data[4] -pin WB|write_data_i I0[4]
load net WB|read_data[5] -attr @rip read_data[5] -attr @name read_data[5] -hierPin WB read_data[5] -pin WB|write_data_i I0[5]
load net WB|read_data[6] -attr @rip read_data[6] -attr @name read_data[6] -hierPin WB read_data[6] -pin WB|write_data_i I0[6]
load net WB|read_data[7] -attr @rip read_data[7] -attr @name read_data[7] -hierPin WB read_data[7] -pin WB|write_data_i I0[7]
load net WB|write_data[0] -attr @rip O[0] -attr @name write_data[0] -hierPin WB write_data[0] -pin WB|write_data_i O[0]
load net WB|write_data[1] -attr @rip O[1] -attr @name write_data[1] -hierPin WB write_data[1] -pin WB|write_data_i O[1]
load net WB|write_data[2] -attr @rip O[2] -attr @name write_data[2] -hierPin WB write_data[2] -pin WB|write_data_i O[2]
load net WB|write_data[3] -attr @rip O[3] -attr @name write_data[3] -hierPin WB write_data[3] -pin WB|write_data_i O[3]
load net WB|write_data[4] -attr @rip O[4] -attr @name write_data[4] -hierPin WB write_data[4] -pin WB|write_data_i O[4]
load net WB|write_data[5] -attr @rip O[5] -attr @name write_data[5] -hierPin WB write_data[5] -pin WB|write_data_i O[5]
load net WB|write_data[6] -attr @rip O[6] -attr @name write_data[6] -hierPin WB write_data[6] -pin WB|write_data_i O[6]
load net WB|write_data[7] -attr @rip O[7] -attr @name write_data[7] -hierPin WB write_data[7] -pin WB|write_data_i O[7]
load net FWD_UNIT|<const0> -ground -attr @name <const0> -pin FWD_UNIT|fwd_a4_i__1 I1[4] -pin FWD_UNIT|fwd_a4_i__1 I1[3] -pin FWD_UNIT|fwd_a4_i__1 I1[2] -pin FWD_UNIT|fwd_a4_i__1 I1[1] -pin FWD_UNIT|fwd_a4_i__1 I1[0] -pin FWD_UNIT|fwd_a5_i I1[4] -pin FWD_UNIT|fwd_a5_i I1[3] -pin FWD_UNIT|fwd_a5_i I1[2] -pin FWD_UNIT|fwd_a5_i I1[1] -pin FWD_UNIT|fwd_a5_i I1[0] -pin FWD_UNIT|fwd_a_i I0[0] -pin FWD_UNIT|fwd_a_i I1[1] -pin FWD_UNIT|fwd_a_i I1[0] -pin FWD_UNIT|fwd_a_i__0 I0[1] -pin FWD_UNIT|fwd_b_i I0[0] -pin FWD_UNIT|fwd_b_i I1[1] -pin FWD_UNIT|fwd_b_i I1[0] -pin FWD_UNIT|fwd_b_i__0 I0[1]
load net FWD_UNIT|<const1> -power -attr @name <const1> -pin FWD_UNIT|fwd_a_i I0[1] -pin FWD_UNIT|fwd_a_i__0 I0[0] -pin FWD_UNIT|fwd_b_i I0[1] -pin FWD_UNIT|fwd_b_i__0 I0[0]
load net FWD_UNIT|fwd_a1 -attr @name fwd_a1 -pin FWD_UNIT|fwd_a1_i O -pin FWD_UNIT|fwd_a_i__0 S
netloc FWD_UNIT|fwd_a1 1 5 1 N 538
load net FWD_UNIT|fwd_a2 -attr @name fwd_a2 -pin FWD_UNIT|fwd_a1_i I0 -pin FWD_UNIT|fwd_a2_i O
netloc FWD_UNIT|fwd_a2 1 4 1 5991 528n
load net FWD_UNIT|fwd_a2_i__0_n_0 -attr @name fwd_a2_i__0_n_0 -pin FWD_UNIT|fwd_a1_i I1 -pin FWD_UNIT|fwd_a2_i__0 O
netloc FWD_UNIT|fwd_a2_i__0_n_0 1 4 1 5971J 536n
load net FWD_UNIT|fwd_a3 -attr @name fwd_a3 -pin FWD_UNIT|fwd_a2_i I0 -pin FWD_UNIT|fwd_a3_i__0 O -pin FWD_UNIT|fwd_b2_i I0
netloc FWD_UNIT|fwd_a3 1 3 1 5771 406n
load net FWD_UNIT|fwd_a3_i__1_n_0 -attr @name fwd_a3_i__1_n_0 -pin FWD_UNIT|fwd_a2_i I1 -pin FWD_UNIT|fwd_a3_i__1 O
netloc FWD_UNIT|fwd_a3_i__1_n_0 1 3 1 N 616
load net FWD_UNIT|fwd_a3_i_n_0 -attr @name fwd_a3_i_n_0 -pin FWD_UNIT|fwd_a2_i__0 I0 -pin FWD_UNIT|fwd_a3_i O -pin FWD_UNIT|fwd_a_i S
netloc FWD_UNIT|fwd_a3_i_n_0 1 3 2 5791 486 5991J
load net FWD_UNIT|fwd_a4 -attr @name fwd_a4 -pin FWD_UNIT|fwd_a3_i__0 I1 -pin FWD_UNIT|fwd_a4_i__1 O
netloc FWD_UNIT|fwd_a4 1 2 1 5511 416n
load net FWD_UNIT|fwd_a4_i__0_n_0 -attr @name fwd_a4_i__0_n_0 -pin FWD_UNIT|fwd_a3_i I1 -pin FWD_UNIT|fwd_a4_i__0 O
netloc FWD_UNIT|fwd_a4_i__0_n_0 1 2 1 5531 446n
load net FWD_UNIT|fwd_a5 -attr @name fwd_a5 -pin FWD_UNIT|fwd_a4_i I1 -pin FWD_UNIT|fwd_a5_i O
netloc FWD_UNIT|fwd_a5 1 1 1 5251 536n
load net FWD_UNIT|fwd_a[0] -attr @rip O[0] -attr @name fwd_a[0] -hierPin FWD_UNIT fwd_a[0] -pin FWD_UNIT|fwd_a_i__0 O[0]
load net FWD_UNIT|fwd_a[1] -attr @rip O[1] -attr @name fwd_a[1] -hierPin FWD_UNIT fwd_a[1] -pin FWD_UNIT|fwd_a_i__0 O[1]
load net FWD_UNIT|fwd_a_i_n_0 -attr @rip O[1] -attr @name fwd_a_i_n_0 -pin FWD_UNIT|fwd_a_i O[1] -pin FWD_UNIT|fwd_a_i__0 I1[1]
load net FWD_UNIT|fwd_a_i_n_1 -attr @rip O[0] -attr @name fwd_a_i_n_1 -pin FWD_UNIT|fwd_a_i O[0] -pin FWD_UNIT|fwd_a_i__0 I1[0]
load net FWD_UNIT|fwd_b1 -attr @name fwd_b1 -pin FWD_UNIT|fwd_b1_i O -pin FWD_UNIT|fwd_b_i__0 S
netloc FWD_UNIT|fwd_b1 1 5 1 6281 706n
load net FWD_UNIT|fwd_b2 -attr @name fwd_b2 -pin FWD_UNIT|fwd_b1_i I0 -pin FWD_UNIT|fwd_b2_i O
netloc FWD_UNIT|fwd_b2 1 4 1 5971 676n
load net FWD_UNIT|fwd_b2_i__0_n_0 -attr @name fwd_b2_i__0_n_0 -pin FWD_UNIT|fwd_b1_i I1 -pin FWD_UNIT|fwd_b2_i__0 O
netloc FWD_UNIT|fwd_b2_i__0_n_0 1 4 1 5951J 786n
load net FWD_UNIT|fwd_b3 -attr @name fwd_b3 -pin FWD_UNIT|fwd_b2_i__0 I0 -pin FWD_UNIT|fwd_b3_i O -pin FWD_UNIT|fwd_b_i S
netloc FWD_UNIT|fwd_b3 1 3 2 5771 726 5991J
load net FWD_UNIT|fwd_b3_i__0_n_0 -attr @name fwd_b3_i__0_n_0 -pin FWD_UNIT|fwd_b2_i I1 -pin FWD_UNIT|fwd_b3_i__0 O
netloc FWD_UNIT|fwd_b3_i__0_n_0 1 3 1 5791 686n
load net FWD_UNIT|fwd_b4 -attr @name fwd_b4 -pin FWD_UNIT|fwd_b3_i I1 -pin FWD_UNIT|fwd_b4_i O
netloc FWD_UNIT|fwd_b4 1 2 1 5511 776n
load net FWD_UNIT|fwd_b[0] -attr @rip O[0] -attr @name fwd_b[0] -hierPin FWD_UNIT fwd_b[0] -pin FWD_UNIT|fwd_b_i__0 O[0]
load net FWD_UNIT|fwd_b[1] -attr @rip O[1] -attr @name fwd_b[1] -hierPin FWD_UNIT fwd_b[1] -pin FWD_UNIT|fwd_b_i__0 O[1]
load net FWD_UNIT|fwd_b_i_n_0 -attr @rip O[1] -attr @name fwd_b_i_n_0 -pin FWD_UNIT|fwd_b_i O[1] -pin FWD_UNIT|fwd_b_i__0 I1[1]
load net FWD_UNIT|fwd_b_i_n_1 -attr @rip O[0] -attr @name fwd_b_i_n_1 -pin FWD_UNIT|fwd_b_i O[0] -pin FWD_UNIT|fwd_b_i__0 I1[0]
load net FWD_UNIT|p_0_in -attr @name p_0_in -pin FWD_UNIT|fwd_a3_i I0 -pin FWD_UNIT|fwd_a4_i O -pin FWD_UNIT|fwd_b3_i I0
netloc FWD_UNIT|p_0_in 1 2 1 5551 476n
load net FWD_UNIT|rd_mem[0] -attr @rip rd_mem[0] -attr @name rd_mem[0] -hierPin FWD_UNIT rd_mem[0] -pin FWD_UNIT|fwd_a4_i__0 I0[0] -pin FWD_UNIT|fwd_a5_i I0[0] -pin FWD_UNIT|fwd_b4_i I0[0]
load net FWD_UNIT|rd_mem[1] -attr @rip rd_mem[1] -attr @name rd_mem[1] -hierPin FWD_UNIT rd_mem[1] -pin FWD_UNIT|fwd_a4_i__0 I0[1] -pin FWD_UNIT|fwd_a5_i I0[1] -pin FWD_UNIT|fwd_b4_i I0[1]
load net FWD_UNIT|rd_mem[2] -attr @rip rd_mem[2] -attr @name rd_mem[2] -hierPin FWD_UNIT rd_mem[2] -pin FWD_UNIT|fwd_a4_i__0 I0[2] -pin FWD_UNIT|fwd_a5_i I0[2] -pin FWD_UNIT|fwd_b4_i I0[2]
load net FWD_UNIT|rd_mem[3] -attr @rip rd_mem[3] -attr @name rd_mem[3] -hierPin FWD_UNIT rd_mem[3] -pin FWD_UNIT|fwd_a4_i__0 I0[3] -pin FWD_UNIT|fwd_a5_i I0[3] -pin FWD_UNIT|fwd_b4_i I0[3]
load net FWD_UNIT|rd_mem[4] -attr @rip rd_mem[4] -attr @name rd_mem[4] -hierPin FWD_UNIT rd_mem[4] -pin FWD_UNIT|fwd_a4_i__0 I0[4] -pin FWD_UNIT|fwd_a5_i I0[4] -pin FWD_UNIT|fwd_b4_i I0[4]
load net FWD_UNIT|rd_wb[0] -attr @rip rd_wb[0] -attr @name rd_wb[0] -hierPin FWD_UNIT rd_wb[0] -pin FWD_UNIT|fwd_a3_i__1 I0[0] -pin FWD_UNIT|fwd_a4_i__1 I0[0] -pin FWD_UNIT|fwd_b3_i__0 I0[0]
load net FWD_UNIT|rd_wb[1] -attr @rip rd_wb[1] -attr @name rd_wb[1] -hierPin FWD_UNIT rd_wb[1] -pin FWD_UNIT|fwd_a3_i__1 I0[1] -pin FWD_UNIT|fwd_a4_i__1 I0[1] -pin FWD_UNIT|fwd_b3_i__0 I0[1]
load net FWD_UNIT|rd_wb[2] -attr @rip rd_wb[2] -attr @name rd_wb[2] -hierPin FWD_UNIT rd_wb[2] -pin FWD_UNIT|fwd_a3_i__1 I0[2] -pin FWD_UNIT|fwd_a4_i__1 I0[2] -pin FWD_UNIT|fwd_b3_i__0 I0[2]
load net FWD_UNIT|rd_wb[3] -attr @rip rd_wb[3] -attr @name rd_wb[3] -hierPin FWD_UNIT rd_wb[3] -pin FWD_UNIT|fwd_a3_i__1 I0[3] -pin FWD_UNIT|fwd_a4_i__1 I0[3] -pin FWD_UNIT|fwd_b3_i__0 I0[3]
load net FWD_UNIT|rd_wb[4] -attr @rip rd_wb[4] -attr @name rd_wb[4] -hierPin FWD_UNIT rd_wb[4] -pin FWD_UNIT|fwd_a3_i__1 I0[4] -pin FWD_UNIT|fwd_a4_i__1 I0[4] -pin FWD_UNIT|fwd_b3_i__0 I0[4]
load net FWD_UNIT|reg_write_mem -attr @name reg_write_mem -hierPin FWD_UNIT reg_write_mem -pin FWD_UNIT|fwd_a4_i I0
netloc FWD_UNIT|reg_write_mem 1 0 2 NJ 628 5211
load net FWD_UNIT|reg_write_wb -attr @name reg_write_wb -hierPin FWD_UNIT reg_write_wb -pin FWD_UNIT|fwd_a3_i__0 I0
netloc FWD_UNIT|reg_write_wb 1 0 3 5011 396 NJ 396 NJ
load net FWD_UNIT|rs1_ex[0] -attr @rip rs1_ex[0] -attr @name rs1_ex[0] -hierPin FWD_UNIT rs1_ex[0] -pin FWD_UNIT|fwd_a3_i__1 I1[0] -pin FWD_UNIT|fwd_a4_i__0 I1[0]
load net FWD_UNIT|rs1_ex[1] -attr @rip rs1_ex[1] -attr @name rs1_ex[1] -hierPin FWD_UNIT rs1_ex[1] -pin FWD_UNIT|fwd_a3_i__1 I1[1] -pin FWD_UNIT|fwd_a4_i__0 I1[1]
load net FWD_UNIT|rs1_ex[2] -attr @rip rs1_ex[2] -attr @name rs1_ex[2] -hierPin FWD_UNIT rs1_ex[2] -pin FWD_UNIT|fwd_a3_i__1 I1[2] -pin FWD_UNIT|fwd_a4_i__0 I1[2]
load net FWD_UNIT|rs1_ex[3] -attr @rip rs1_ex[3] -attr @name rs1_ex[3] -hierPin FWD_UNIT rs1_ex[3] -pin FWD_UNIT|fwd_a3_i__1 I1[3] -pin FWD_UNIT|fwd_a4_i__0 I1[3]
load net FWD_UNIT|rs1_ex[4] -attr @rip rs1_ex[4] -attr @name rs1_ex[4] -hierPin FWD_UNIT rs1_ex[4] -pin FWD_UNIT|fwd_a3_i__1 I1[4] -pin FWD_UNIT|fwd_a4_i__0 I1[4]
load net FWD_UNIT|rs2_ex[0] -attr @rip rs2_ex[0] -attr @name rs2_ex[0] -hierPin FWD_UNIT rs2_ex[0] -pin FWD_UNIT|fwd_b3_i__0 I1[0] -pin FWD_UNIT|fwd_b4_i I1[0]
load net FWD_UNIT|rs2_ex[1] -attr @rip rs2_ex[1] -attr @name rs2_ex[1] -hierPin FWD_UNIT rs2_ex[1] -pin FWD_UNIT|fwd_b3_i__0 I1[1] -pin FWD_UNIT|fwd_b4_i I1[1]
load net FWD_UNIT|rs2_ex[2] -attr @rip rs2_ex[2] -attr @name rs2_ex[2] -hierPin FWD_UNIT rs2_ex[2] -pin FWD_UNIT|fwd_b3_i__0 I1[2] -pin FWD_UNIT|fwd_b4_i I1[2]
load net FWD_UNIT|rs2_ex[3] -attr @rip rs2_ex[3] -attr @name rs2_ex[3] -hierPin FWD_UNIT rs2_ex[3] -pin FWD_UNIT|fwd_b3_i__0 I1[3] -pin FWD_UNIT|fwd_b4_i I1[3]
load net FWD_UNIT|rs2_ex[4] -attr @rip rs2_ex[4] -attr @name rs2_ex[4] -hierPin FWD_UNIT rs2_ex[4] -pin FWD_UNIT|fwd_b3_i__0 I1[4] -pin FWD_UNIT|fwd_b4_i I1[4]
load net ID|alu_ctrl[0] -attr @rip(#000000) alu_ctrl[0] -attr @name alu_ctrl[0] -pin ID|AC alu_ctrl[0] -pin ID|alu_ctrl_out_reg[3:0] D[0]
load net ID|alu_ctrl[1] -attr @rip(#000000) alu_ctrl[1] -attr @name alu_ctrl[1] -pin ID|AC alu_ctrl[1] -pin ID|alu_ctrl_out_reg[3:0] D[1]
load net ID|alu_ctrl[2] -attr @rip(#000000) alu_ctrl[2] -attr @name alu_ctrl[2] -pin ID|AC alu_ctrl[2] -pin ID|alu_ctrl_out_reg[3:0] D[2]
load net ID|alu_ctrl[3] -attr @rip(#000000) alu_ctrl[3] -attr @name alu_ctrl[3] -pin ID|AC alu_ctrl[3] -pin ID|alu_ctrl_out_reg[3:0] D[3]
load net ID|alu_ctrl_out[0] -attr @rip(#000000) 0 -attr @name alu_ctrl_out[0] -hierPin ID alu_ctrl_out[0] -pin ID|alu_ctrl_out_reg[3:0] Q[0]
load net ID|alu_ctrl_out[1] -attr @rip(#000000) 1 -attr @name alu_ctrl_out[1] -hierPin ID alu_ctrl_out[1] -pin ID|alu_ctrl_out_reg[3:0] Q[1]
load net ID|alu_ctrl_out[2] -attr @rip(#000000) 2 -attr @name alu_ctrl_out[2] -hierPin ID alu_ctrl_out[2] -pin ID|alu_ctrl_out_reg[3:0] Q[2]
load net ID|alu_ctrl_out[3] -attr @rip(#000000) 3 -attr @name alu_ctrl_out[3] -hierPin ID alu_ctrl_out[3] -pin ID|alu_ctrl_out_reg[3:0] Q[3]
load net ID|alu_op[0] -attr @rip(#000000) alu_op[0] -attr @name alu_op[0] -pin ID|AC alu_op[0] -pin ID|CU alu_op[0]
load net ID|alu_op[1] -attr @rip(#000000) alu_op[1] -attr @name alu_op[1] -pin ID|AC alu_op[1] -pin ID|CU alu_op[1]
load net ID|alu_src -attr @name alu_src -pin ID|CU alu_src -pin ID|alu_src_out_reg D
netloc ID|alu_src 1 1 2 NJ 808 3950
load net ID|alu_src_out -attr @name alu_src_out -hierPin ID alu_src_out -pin ID|alu_src_out_reg Q
netloc ID|alu_src_out 1 3 1 N 498
load net ID|branch -attr @name branch -pin ID|CU branch -pin ID|branch_out_reg D
netloc ID|branch 1 1 2 NJ 828 3990
load net ID|branch_out -attr @name branch_out -hierPin ID branch_out -pin ID|branch_out_reg Q
netloc ID|branch_out 1 3 1 N 618
load net ID|clk -attr @name clk -hierPin ID clk -pin ID|RF clk -pin ID|alu_ctrl_out_reg[3:0] C -pin ID|alu_src_out_reg C -pin ID|branch_out_reg C -pin ID|imm_out_reg[7:0] C -pin ID|mem_read_out_reg C -pin ID|mem_to_reg_out_reg C -pin ID|mem_write_out_reg C -pin ID|pc_out_reg C -pin ID|rd_out_reg[4:0] C -pin ID|read_data1_out_reg[7:0] C -pin ID|read_data2_out_reg[7:0] C -pin ID|reg_write_out_reg C -pin ID|rs1_out_reg[4:0] C -pin ID|rs2_out_reg[4:0] C
netloc ID|clk 1 0 3 NJ 1068 3590 1378 4030
load net ID|imm[0] -attr @rip(#000000) imm_out[0] -attr @name imm[0] -pin ID|IG imm_out[0] -pin ID|imm_out_reg[7:0] D[0]
load net ID|imm[1] -attr @rip(#000000) imm_out[1] -attr @name imm[1] -pin ID|IG imm_out[1] -pin ID|imm_out_reg[7:0] D[1]
load net ID|imm[2] -attr @rip(#000000) imm_out[2] -attr @name imm[2] -pin ID|IG imm_out[2] -pin ID|imm_out_reg[7:0] D[2]
load net ID|imm[3] -attr @rip(#000000) imm_out[3] -attr @name imm[3] -pin ID|IG imm_out[3] -pin ID|imm_out_reg[7:0] D[3]
load net ID|imm[4] -attr @rip(#000000) imm_out[4] -attr @name imm[4] -pin ID|IG imm_out[4] -pin ID|imm_out_reg[7:0] D[4]
load net ID|imm[5] -attr @rip(#000000) imm_out[5] -attr @name imm[5] -pin ID|IG imm_out[5] -pin ID|imm_out_reg[7:0] D[5]
load net ID|imm[6] -attr @rip(#000000) imm_out[6] -attr @name imm[6] -pin ID|IG imm_out[6] -pin ID|imm_out_reg[7:0] D[6]
load net ID|imm[7] -attr @rip(#000000) imm_out[7] -attr @name imm[7] -pin ID|IG imm_out[7] -pin ID|imm_out_reg[7:0] D[7]
load net ID|imm_out[0] -attr @rip(#000000) 0 -attr @name imm_out[0] -hierPin ID imm_out[0] -pin ID|imm_out_reg[7:0] Q[0]
load net ID|imm_out[1] -attr @rip(#000000) 1 -attr @name imm_out[1] -hierPin ID imm_out[1] -pin ID|imm_out_reg[7:0] Q[1]
load net ID|imm_out[2] -attr @rip(#000000) 2 -attr @name imm_out[2] -hierPin ID imm_out[2] -pin ID|imm_out_reg[7:0] Q[2]
load net ID|imm_out[3] -attr @rip(#000000) 3 -attr @name imm_out[3] -hierPin ID imm_out[3] -pin ID|imm_out_reg[7:0] Q[3]
load net ID|imm_out[4] -attr @rip(#000000) 4 -attr @name imm_out[4] -hierPin ID imm_out[4] -pin ID|imm_out_reg[7:0] Q[4]
load net ID|imm_out[5] -attr @rip(#000000) 5 -attr @name imm_out[5] -hierPin ID imm_out[5] -pin ID|imm_out_reg[7:0] Q[5]
load net ID|imm_out[6] -attr @rip(#000000) 6 -attr @name imm_out[6] -hierPin ID imm_out[6] -pin ID|imm_out_reg[7:0] Q[6]
load net ID|imm_out[7] -attr @rip(#000000) 7 -attr @name imm_out[7] -hierPin ID imm_out[7] -pin ID|imm_out_reg[7:0] Q[7]
load net ID|instruction[0] -attr @rip(#000000) instruction[0] -attr @name instruction[0] -hierPin ID instruction[0] -pin ID|CU opcode[0] -pin ID|IG instruction[0]
load net ID|instruction[10] -attr @rip(#000000) instruction[10] -attr @name instruction[10] -hierPin ID instruction[10] -pin ID|IG instruction[10] -pin ID|rd_out_reg[4:0] D[3]
load net ID|instruction[11] -attr @rip(#000000) instruction[11] -attr @name instruction[11] -hierPin ID instruction[11] -pin ID|IG instruction[11] -pin ID|rd_out_reg[4:0] D[4]
load net ID|instruction[12] -attr @rip(#000000) instruction[12] -attr @name instruction[12] -hierPin ID instruction[12] -pin ID|AC func3[0] -pin ID|IG instruction[12]
load net ID|instruction[13] -attr @rip(#000000) instruction[13] -attr @name instruction[13] -hierPin ID instruction[13] -pin ID|AC func3[1] -pin ID|IG instruction[13]
load net ID|instruction[14] -attr @rip(#000000) instruction[14] -attr @name instruction[14] -hierPin ID instruction[14] -pin ID|AC func3[2] -pin ID|IG instruction[14]
load net ID|instruction[15] -attr @rip(#000000) instruction[15] -attr @name instruction[15] -hierPin ID instruction[15] -pin ID|IG instruction[15] -pin ID|RF rs1[0] -pin ID|rs1_out_reg[4:0] D[0]
load net ID|instruction[16] -attr @rip(#000000) instruction[16] -attr @name instruction[16] -hierPin ID instruction[16] -pin ID|IG instruction[16] -pin ID|RF rs1[1] -pin ID|rs1_out_reg[4:0] D[1]
load net ID|instruction[17] -attr @rip(#000000) instruction[17] -attr @name instruction[17] -hierPin ID instruction[17] -pin ID|IG instruction[17] -pin ID|RF rs1[2] -pin ID|rs1_out_reg[4:0] D[2]
load net ID|instruction[18] -attr @rip(#000000) instruction[18] -attr @name instruction[18] -hierPin ID instruction[18] -pin ID|IG instruction[18] -pin ID|RF rs1[3] -pin ID|rs1_out_reg[4:0] D[3]
load net ID|instruction[19] -attr @rip(#000000) instruction[19] -attr @name instruction[19] -hierPin ID instruction[19] -pin ID|IG instruction[19] -pin ID|RF rs1[4] -pin ID|rs1_out_reg[4:0] D[4]
load net ID|instruction[1] -attr @rip(#000000) instruction[1] -attr @name instruction[1] -hierPin ID instruction[1] -pin ID|CU opcode[1] -pin ID|IG instruction[1]
load net ID|instruction[20] -attr @rip(#000000) instruction[20] -attr @name instruction[20] -hierPin ID instruction[20] -pin ID|IG instruction[20] -pin ID|RF rs2[0] -pin ID|rs2_out_reg[4:0] D[0]
load net ID|instruction[21] -attr @rip(#000000) instruction[21] -attr @name instruction[21] -hierPin ID instruction[21] -pin ID|IG instruction[21] -pin ID|RF rs2[1] -pin ID|rs2_out_reg[4:0] D[1]
load net ID|instruction[22] -attr @rip(#000000) instruction[22] -attr @name instruction[22] -hierPin ID instruction[22] -pin ID|IG instruction[22] -pin ID|RF rs2[2] -pin ID|rs2_out_reg[4:0] D[2]
load net ID|instruction[23] -attr @rip(#000000) instruction[23] -attr @name instruction[23] -hierPin ID instruction[23] -pin ID|IG instruction[23] -pin ID|RF rs2[3] -pin ID|rs2_out_reg[4:0] D[3]
load net ID|instruction[24] -attr @rip(#000000) instruction[24] -attr @name instruction[24] -hierPin ID instruction[24] -pin ID|IG instruction[24] -pin ID|RF rs2[4] -pin ID|rs2_out_reg[4:0] D[4]
load net ID|instruction[25] -attr @rip(#000000) instruction[25] -attr @name instruction[25] -hierPin ID instruction[25] -pin ID|AC func7[0] -pin ID|IG instruction[25]
load net ID|instruction[26] -attr @rip(#000000) instruction[26] -attr @name instruction[26] -hierPin ID instruction[26] -pin ID|AC func7[1] -pin ID|IG instruction[26]
load net ID|instruction[27] -attr @rip(#000000) instruction[27] -attr @name instruction[27] -hierPin ID instruction[27] -pin ID|AC func7[2] -pin ID|IG instruction[27]
load net ID|instruction[28] -attr @rip(#000000) instruction[28] -attr @name instruction[28] -hierPin ID instruction[28] -pin ID|AC func7[3] -pin ID|IG instruction[28]
load net ID|instruction[29] -attr @rip(#000000) instruction[29] -attr @name instruction[29] -hierPin ID instruction[29] -pin ID|AC func7[4] -pin ID|IG instruction[29]
load net ID|instruction[2] -attr @rip(#000000) instruction[2] -attr @name instruction[2] -hierPin ID instruction[2] -pin ID|CU opcode[2] -pin ID|IG instruction[2]
load net ID|instruction[30] -attr @rip(#000000) instruction[30] -attr @name instruction[30] -hierPin ID instruction[30] -pin ID|AC func7[5] -pin ID|IG instruction[30]
load net ID|instruction[31] -attr @rip(#000000) instruction[31] -attr @name instruction[31] -hierPin ID instruction[31] -pin ID|AC func7[6] -pin ID|IG instruction[31]
load net ID|instruction[3] -attr @rip(#000000) instruction[3] -attr @name instruction[3] -hierPin ID instruction[3] -pin ID|CU opcode[3] -pin ID|IG instruction[3]
load net ID|instruction[4] -attr @rip(#000000) instruction[4] -attr @name instruction[4] -hierPin ID instruction[4] -pin ID|CU opcode[4] -pin ID|IG instruction[4]
load net ID|instruction[5] -attr @rip(#000000) instruction[5] -attr @name instruction[5] -hierPin ID instruction[5] -pin ID|CU opcode[5] -pin ID|IG instruction[5]
load net ID|instruction[6] -attr @rip(#000000) instruction[6] -attr @name instruction[6] -hierPin ID instruction[6] -pin ID|CU opcode[6] -pin ID|IG instruction[6]
load net ID|instruction[7] -attr @rip(#000000) instruction[7] -attr @name instruction[7] -hierPin ID instruction[7] -pin ID|IG instruction[7] -pin ID|rd_out_reg[4:0] D[0]
load net ID|instruction[8] -attr @rip(#000000) instruction[8] -attr @name instruction[8] -hierPin ID instruction[8] -pin ID|IG instruction[8] -pin ID|rd_out_reg[4:0] D[1]
load net ID|instruction[9] -attr @rip(#000000) instruction[9] -attr @name instruction[9] -hierPin ID instruction[9] -pin ID|IG instruction[9] -pin ID|rd_out_reg[4:0] D[2]
load net ID|mem_read -attr @name mem_read -pin ID|CU mem_read -pin ID|mem_read_out_reg D
netloc ID|mem_read 1 1 2 NJ 848 3970
load net ID|mem_read_out -attr @name mem_read_out -hierPin ID mem_read_out -pin ID|mem_read_out_reg Q
netloc ID|mem_read_out 1 3 1 N 738
load net ID|mem_to_reg -attr @name mem_to_reg -pin ID|CU mem_to_reg -pin ID|mem_to_reg_out_reg D
netloc ID|mem_to_reg 1 1 2 NJ 868 N
load net ID|mem_to_reg_out -attr @name mem_to_reg_out -hierPin ID mem_to_reg_out -pin ID|mem_to_reg_out_reg Q
netloc ID|mem_to_reg_out 1 3 1 N 858
load net ID|mem_write -attr @name mem_write -pin ID|CU mem_write -pin ID|mem_write_out_reg D
netloc ID|mem_write 1 1 2 NJ 888 3930
load net ID|mem_write_out -attr @name mem_write_out -hierPin ID mem_write_out -pin ID|mem_write_out_reg Q
netloc ID|mem_write_out 1 3 1 N 1108
load net ID|pc_in[0] -attr @rip(#000000) pc_in[0] -attr @name pc_in[0] -hierPin ID pc_in[0] -pin ID|pc_out_reg D
netloc ID|pc_in[0] 1 0 3 NJ 1238 NJ 1238 N
load net ID|pc_out -attr @name pc_out -hierPin ID pc_out -pin ID|pc_out_reg Q
netloc ID|pc_out 1 3 1 N 1228
load net ID|rd_out[0] -attr @rip(#000000) 0 -attr @name rd_out[0] -hierPin ID rd_out[0] -pin ID|rd_out_reg[4:0] Q[0]
load net ID|rd_out[1] -attr @rip(#000000) 1 -attr @name rd_out[1] -hierPin ID rd_out[1] -pin ID|rd_out_reg[4:0] Q[1]
load net ID|rd_out[2] -attr @rip(#000000) 2 -attr @name rd_out[2] -hierPin ID rd_out[2] -pin ID|rd_out_reg[4:0] Q[2]
load net ID|rd_out[3] -attr @rip(#000000) 3 -attr @name rd_out[3] -hierPin ID rd_out[3] -pin ID|rd_out_reg[4:0] Q[3]
load net ID|rd_out[4] -attr @rip(#000000) 4 -attr @name rd_out[4] -hierPin ID rd_out[4] -pin ID|rd_out_reg[4:0] Q[4]
load net ID|rd_wb[0] -attr @rip(#000000) rd_wb[0] -attr @name rd_wb[0] -hierPin ID rd_wb[0] -pin ID|RF write_addr[0]
load net ID|rd_wb[1] -attr @rip(#000000) rd_wb[1] -attr @name rd_wb[1] -hierPin ID rd_wb[1] -pin ID|RF write_addr[1]
load net ID|rd_wb[2] -attr @rip(#000000) rd_wb[2] -attr @name rd_wb[2] -hierPin ID rd_wb[2] -pin ID|RF write_addr[2]
load net ID|rd_wb[3] -attr @rip(#000000) rd_wb[3] -attr @name rd_wb[3] -hierPin ID rd_wb[3] -pin ID|RF write_addr[3]
load net ID|rd_wb[4] -attr @rip(#000000) rd_wb[4] -attr @name rd_wb[4] -hierPin ID rd_wb[4] -pin ID|RF write_addr[4]
load net ID|read_data1[0] -attr @rip(#000000) read_data1[0] -attr @name read_data1[0] -pin ID|RF read_data1[0] -pin ID|read_data1_out_reg[7:0] D[0]
load net ID|read_data1[1] -attr @rip(#000000) read_data1[1] -attr @name read_data1[1] -pin ID|RF read_data1[1] -pin ID|read_data1_out_reg[7:0] D[1]
load net ID|read_data1[2] -attr @rip(#000000) read_data1[2] -attr @name read_data1[2] -pin ID|RF read_data1[2] -pin ID|read_data1_out_reg[7:0] D[2]
load net ID|read_data1[3] -attr @rip(#000000) read_data1[3] -attr @name read_data1[3] -pin ID|RF read_data1[3] -pin ID|read_data1_out_reg[7:0] D[3]
load net ID|read_data1[4] -attr @rip(#000000) read_data1[4] -attr @name read_data1[4] -pin ID|RF read_data1[4] -pin ID|read_data1_out_reg[7:0] D[4]
load net ID|read_data1[5] -attr @rip(#000000) read_data1[5] -attr @name read_data1[5] -pin ID|RF read_data1[5] -pin ID|read_data1_out_reg[7:0] D[5]
load net ID|read_data1[6] -attr @rip(#000000) read_data1[6] -attr @name read_data1[6] -pin ID|RF read_data1[6] -pin ID|read_data1_out_reg[7:0] D[6]
load net ID|read_data1[7] -attr @rip(#000000) read_data1[7] -attr @name read_data1[7] -pin ID|RF read_data1[7] -pin ID|read_data1_out_reg[7:0] D[7]
load net ID|read_data1_out[0] -attr @rip(#000000) 0 -attr @name read_data1_out[0] -hierPin ID read_data1_out[0] -pin ID|read_data1_out_reg[7:0] Q[0]
load net ID|read_data1_out[1] -attr @rip(#000000) 1 -attr @name read_data1_out[1] -hierPin ID read_data1_out[1] -pin ID|read_data1_out_reg[7:0] Q[1]
load net ID|read_data1_out[2] -attr @rip(#000000) 2 -attr @name read_data1_out[2] -hierPin ID read_data1_out[2] -pin ID|read_data1_out_reg[7:0] Q[2]
load net ID|read_data1_out[3] -attr @rip(#000000) 3 -attr @name read_data1_out[3] -hierPin ID read_data1_out[3] -pin ID|read_data1_out_reg[7:0] Q[3]
load net ID|read_data1_out[4] -attr @rip(#000000) 4 -attr @name read_data1_out[4] -hierPin ID read_data1_out[4] -pin ID|read_data1_out_reg[7:0] Q[4]
load net ID|read_data1_out[5] -attr @rip(#000000) 5 -attr @name read_data1_out[5] -hierPin ID read_data1_out[5] -pin ID|read_data1_out_reg[7:0] Q[5]
load net ID|read_data1_out[6] -attr @rip(#000000) 6 -attr @name read_data1_out[6] -hierPin ID read_data1_out[6] -pin ID|read_data1_out_reg[7:0] Q[6]
load net ID|read_data1_out[7] -attr @rip(#000000) 7 -attr @name read_data1_out[7] -hierPin ID read_data1_out[7] -pin ID|read_data1_out_reg[7:0] Q[7]
load net ID|read_data2[0] -attr @rip(#000000) read_data2[0] -attr @name read_data2[0] -pin ID|RF read_data2[0] -pin ID|read_data2_out_reg[7:0] D[0]
load net ID|read_data2[1] -attr @rip(#000000) read_data2[1] -attr @name read_data2[1] -pin ID|RF read_data2[1] -pin ID|read_data2_out_reg[7:0] D[1]
load net ID|read_data2[2] -attr @rip(#000000) read_data2[2] -attr @name read_data2[2] -pin ID|RF read_data2[2] -pin ID|read_data2_out_reg[7:0] D[2]
load net ID|read_data2[3] -attr @rip(#000000) read_data2[3] -attr @name read_data2[3] -pin ID|RF read_data2[3] -pin ID|read_data2_out_reg[7:0] D[3]
load net ID|read_data2[4] -attr @rip(#000000) read_data2[4] -attr @name read_data2[4] -pin ID|RF read_data2[4] -pin ID|read_data2_out_reg[7:0] D[4]
load net ID|read_data2[5] -attr @rip(#000000) read_data2[5] -attr @name read_data2[5] -pin ID|RF read_data2[5] -pin ID|read_data2_out_reg[7:0] D[5]
load net ID|read_data2[6] -attr @rip(#000000) read_data2[6] -attr @name read_data2[6] -pin ID|RF read_data2[6] -pin ID|read_data2_out_reg[7:0] D[6]
load net ID|read_data2[7] -attr @rip(#000000) read_data2[7] -attr @name read_data2[7] -pin ID|RF read_data2[7] -pin ID|read_data2_out_reg[7:0] D[7]
load net ID|read_data2_out[0] -attr @rip(#000000) 0 -attr @name read_data2_out[0] -hierPin ID read_data2_out[0] -pin ID|read_data2_out_reg[7:0] Q[0]
load net ID|read_data2_out[1] -attr @rip(#000000) 1 -attr @name read_data2_out[1] -hierPin ID read_data2_out[1] -pin ID|read_data2_out_reg[7:0] Q[1]
load net ID|read_data2_out[2] -attr @rip(#000000) 2 -attr @name read_data2_out[2] -hierPin ID read_data2_out[2] -pin ID|read_data2_out_reg[7:0] Q[2]
load net ID|read_data2_out[3] -attr @rip(#000000) 3 -attr @name read_data2_out[3] -hierPin ID read_data2_out[3] -pin ID|read_data2_out_reg[7:0] Q[3]
load net ID|read_data2_out[4] -attr @rip(#000000) 4 -attr @name read_data2_out[4] -hierPin ID read_data2_out[4] -pin ID|read_data2_out_reg[7:0] Q[4]
load net ID|read_data2_out[5] -attr @rip(#000000) 5 -attr @name read_data2_out[5] -hierPin ID read_data2_out[5] -pin ID|read_data2_out_reg[7:0] Q[5]
load net ID|read_data2_out[6] -attr @rip(#000000) 6 -attr @name read_data2_out[6] -hierPin ID read_data2_out[6] -pin ID|read_data2_out_reg[7:0] Q[6]
load net ID|read_data2_out[7] -attr @rip(#000000) 7 -attr @name read_data2_out[7] -hierPin ID read_data2_out[7] -pin ID|read_data2_out_reg[7:0] Q[7]
load net ID|reg_write -attr @name reg_write -pin ID|CU reg_write -pin ID|reg_write_out_reg D
netloc ID|reg_write 1 1 2 3630 1358 NJ
load net ID|reg_write_out -attr @name reg_write_out -hierPin ID reg_write_out -pin ID|reg_write_out_reg Q
netloc ID|reg_write_out 1 3 1 4310 1348n
load net ID|reg_write_wb -attr @name reg_write_wb -hierPin ID reg_write_wb -pin ID|RF reg_write
netloc ID|reg_write_wb 1 0 2 NJ 1478 N
load net ID|reset -attr @name reset -hierPin ID reset -pin ID|RF reset -pin ID|alu_ctrl_out_reg[3:0] RST -pin ID|alu_src_out_reg RST -pin ID|branch_out_reg RST -pin ID|imm_out_reg[7:0] RST -pin ID|mem_read_out_reg RST -pin ID|mem_to_reg_out_reg RST -pin ID|mem_write_out_reg RST -pin ID|pc_out_reg RST -pin ID|rd_out_reg[4:0] RST -pin ID|read_data1_out_reg[7:0] RST -pin ID|read_data2_out_reg[7:0] RST -pin ID|reg_write_out_reg RST -pin ID|rs1_out_reg[4:0] RST -pin ID|rs2_out_reg[4:0] RST
netloc ID|reset 1 0 3 NJ 1498 3630 1398 4010
load net ID|rs1_out[0] -attr @rip(#000000) 0 -attr @name rs1_out[0] -hierPin ID rs1_out[0] -pin ID|rs1_out_reg[4:0] Q[0]
load net ID|rs1_out[1] -attr @rip(#000000) 1 -attr @name rs1_out[1] -hierPin ID rs1_out[1] -pin ID|rs1_out_reg[4:0] Q[1]
load net ID|rs1_out[2] -attr @rip(#000000) 2 -attr @name rs1_out[2] -hierPin ID rs1_out[2] -pin ID|rs1_out_reg[4:0] Q[2]
load net ID|rs1_out[3] -attr @rip(#000000) 3 -attr @name rs1_out[3] -hierPin ID rs1_out[3] -pin ID|rs1_out_reg[4:0] Q[3]
load net ID|rs1_out[4] -attr @rip(#000000) 4 -attr @name rs1_out[4] -hierPin ID rs1_out[4] -pin ID|rs1_out_reg[4:0] Q[4]
load net ID|rs2_out[0] -attr @rip(#000000) 0 -attr @name rs2_out[0] -hierPin ID rs2_out[0] -pin ID|rs2_out_reg[4:0] Q[0]
load net ID|rs2_out[1] -attr @rip(#000000) 1 -attr @name rs2_out[1] -hierPin ID rs2_out[1] -pin ID|rs2_out_reg[4:0] Q[1]
load net ID|rs2_out[2] -attr @rip(#000000) 2 -attr @name rs2_out[2] -hierPin ID rs2_out[2] -pin ID|rs2_out_reg[4:0] Q[2]
load net ID|rs2_out[3] -attr @rip(#000000) 3 -attr @name rs2_out[3] -hierPin ID rs2_out[3] -pin ID|rs2_out_reg[4:0] Q[3]
load net ID|rs2_out[4] -attr @rip(#000000) 4 -attr @name rs2_out[4] -hierPin ID rs2_out[4] -pin ID|rs2_out_reg[4:0] Q[4]
load net ID|write_data[0] -attr @rip(#000000) write_data[0] -attr @name write_data[0] -hierPin ID write_data[0] -pin ID|RF write_data[0]
load net ID|write_data[1] -attr @rip(#000000) write_data[1] -attr @name write_data[1] -hierPin ID write_data[1] -pin ID|RF write_data[1]
load net ID|write_data[2] -attr @rip(#000000) write_data[2] -attr @name write_data[2] -hierPin ID write_data[2] -pin ID|RF write_data[2]
load net ID|write_data[3] -attr @rip(#000000) write_data[3] -attr @name write_data[3] -hierPin ID write_data[3] -pin ID|RF write_data[3]
load net ID|write_data[4] -attr @rip(#000000) write_data[4] -attr @name write_data[4] -hierPin ID write_data[4] -pin ID|RF write_data[4]
load net ID|write_data[5] -attr @rip(#000000) write_data[5] -attr @name write_data[5] -hierPin ID write_data[5] -pin ID|RF write_data[5]
load net ID|write_data[6] -attr @rip(#000000) write_data[6] -attr @name write_data[6] -hierPin ID write_data[6] -pin ID|RF write_data[6]
load net ID|write_data[7] -attr @rip(#000000) write_data[7] -attr @name write_data[7] -hierPin ID write_data[7] -pin ID|RF write_data[7]
load net IF|<const1> -power -attr @name <const1> -pin IF|pc_next_i I1
load net IF|clk -attr @name clk -hierPin IF clk -pin IF|instruction_out_reg[31:0] C -pin IF|pc clk -pin IF|pc_out_reg[7:0] C
netloc IF|clk 1 0 5 NJ 318 NJ 318 2070 318 NJ 318 2600
load net IF|instruction[0] -attr @rip(#000000) instruction[0] -attr @name instruction[0] -pin IF|inst_mm instruction[0] -pin IF|instruction_out_reg[31:0] D[0]
load net IF|instruction[10] -attr @rip(#000000) instruction[10] -attr @name instruction[10] -pin IF|inst_mm instruction[10] -pin IF|instruction_out_reg[31:0] D[10]
load net IF|instruction[11] -attr @rip(#000000) instruction[11] -attr @name instruction[11] -pin IF|inst_mm instruction[11] -pin IF|instruction_out_reg[31:0] D[11]
load net IF|instruction[12] -attr @rip(#000000) instruction[12] -attr @name instruction[12] -pin IF|inst_mm instruction[12] -pin IF|instruction_out_reg[31:0] D[12]
load net IF|instruction[13] -attr @rip(#000000) instruction[13] -attr @name instruction[13] -pin IF|inst_mm instruction[13] -pin IF|instruction_out_reg[31:0] D[13]
load net IF|instruction[14] -attr @rip(#000000) instruction[14] -attr @name instruction[14] -pin IF|inst_mm instruction[14] -pin IF|instruction_out_reg[31:0] D[14]
load net IF|instruction[15] -attr @rip(#000000) instruction[15] -attr @name instruction[15] -pin IF|inst_mm instruction[15] -pin IF|instruction_out_reg[31:0] D[15]
load net IF|instruction[16] -attr @rip(#000000) instruction[16] -attr @name instruction[16] -pin IF|inst_mm instruction[16] -pin IF|instruction_out_reg[31:0] D[16]
load net IF|instruction[17] -attr @rip(#000000) instruction[17] -attr @name instruction[17] -pin IF|inst_mm instruction[17] -pin IF|instruction_out_reg[31:0] D[17]
load net IF|instruction[18] -attr @rip(#000000) instruction[18] -attr @name instruction[18] -pin IF|inst_mm instruction[18] -pin IF|instruction_out_reg[31:0] D[18]
load net IF|instruction[19] -attr @rip(#000000) instruction[19] -attr @name instruction[19] -pin IF|inst_mm instruction[19] -pin IF|instruction_out_reg[31:0] D[19]
load net IF|instruction[1] -attr @rip(#000000) instruction[1] -attr @name instruction[1] -pin IF|inst_mm instruction[1] -pin IF|instruction_out_reg[31:0] D[1]
load net IF|instruction[20] -attr @rip(#000000) instruction[20] -attr @name instruction[20] -pin IF|inst_mm instruction[20] -pin IF|instruction_out_reg[31:0] D[20]
load net IF|instruction[21] -attr @rip(#000000) instruction[21] -attr @name instruction[21] -pin IF|inst_mm instruction[21] -pin IF|instruction_out_reg[31:0] D[21]
load net IF|instruction[22] -attr @rip(#000000) instruction[22] -attr @name instruction[22] -pin IF|inst_mm instruction[22] -pin IF|instruction_out_reg[31:0] D[22]
load net IF|instruction[23] -attr @rip(#000000) instruction[23] -attr @name instruction[23] -pin IF|inst_mm instruction[23] -pin IF|instruction_out_reg[31:0] D[23]
load net IF|instruction[24] -attr @rip(#000000) instruction[24] -attr @name instruction[24] -pin IF|inst_mm instruction[24] -pin IF|instruction_out_reg[31:0] D[24]
load net IF|instruction[25] -attr @rip(#000000) instruction[25] -attr @name instruction[25] -pin IF|inst_mm instruction[25] -pin IF|instruction_out_reg[31:0] D[25]
load net IF|instruction[26] -attr @rip(#000000) instruction[26] -attr @name instruction[26] -pin IF|inst_mm instruction[26] -pin IF|instruction_out_reg[31:0] D[26]
load net IF|instruction[27] -attr @rip(#000000) instruction[27] -attr @name instruction[27] -pin IF|inst_mm instruction[27] -pin IF|instruction_out_reg[31:0] D[27]
load net IF|instruction[28] -attr @rip(#000000) instruction[28] -attr @name instruction[28] -pin IF|inst_mm instruction[28] -pin IF|instruction_out_reg[31:0] D[28]
load net IF|instruction[29] -attr @rip(#000000) instruction[29] -attr @name instruction[29] -pin IF|inst_mm instruction[29] -pin IF|instruction_out_reg[31:0] D[29]
load net IF|instruction[2] -attr @rip(#000000) instruction[2] -attr @name instruction[2] -pin IF|inst_mm instruction[2] -pin IF|instruction_out_reg[31:0] D[2]
load net IF|instruction[30] -attr @rip(#000000) instruction[30] -attr @name instruction[30] -pin IF|inst_mm instruction[30] -pin IF|instruction_out_reg[31:0] D[30]
load net IF|instruction[31] -attr @rip(#000000) instruction[31] -attr @name instruction[31] -pin IF|inst_mm instruction[31] -pin IF|instruction_out_reg[31:0] D[31]
load net IF|instruction[3] -attr @rip(#000000) instruction[3] -attr @name instruction[3] -pin IF|inst_mm instruction[3] -pin IF|instruction_out_reg[31:0] D[3]
load net IF|instruction[4] -attr @rip(#000000) instruction[4] -attr @name instruction[4] -pin IF|inst_mm instruction[4] -pin IF|instruction_out_reg[31:0] D[4]
load net IF|instruction[5] -attr @rip(#000000) instruction[5] -attr @name instruction[5] -pin IF|inst_mm instruction[5] -pin IF|instruction_out_reg[31:0] D[5]
load net IF|instruction[6] -attr @rip(#000000) instruction[6] -attr @name instruction[6] -pin IF|inst_mm instruction[6] -pin IF|instruction_out_reg[31:0] D[6]
load net IF|instruction[7] -attr @rip(#000000) instruction[7] -attr @name instruction[7] -pin IF|inst_mm instruction[7] -pin IF|instruction_out_reg[31:0] D[7]
load net IF|instruction[8] -attr @rip(#000000) instruction[8] -attr @name instruction[8] -pin IF|inst_mm instruction[8] -pin IF|instruction_out_reg[31:0] D[8]
load net IF|instruction[9] -attr @rip(#000000) instruction[9] -attr @name instruction[9] -pin IF|inst_mm instruction[9] -pin IF|instruction_out_reg[31:0] D[9]
load net IF|instruction_out[0] -attr @rip(#000000) 0 -attr @name instruction_out[0] -hierPin IF instruction_out[0] -pin IF|instruction_out_reg[31:0] Q[0]
load net IF|instruction_out[10] -attr @rip(#000000) 10 -attr @name instruction_out[10] -hierPin IF instruction_out[10] -pin IF|instruction_out_reg[31:0] Q[10]
load net IF|instruction_out[11] -attr @rip(#000000) 11 -attr @name instruction_out[11] -hierPin IF instruction_out[11] -pin IF|instruction_out_reg[31:0] Q[11]
load net IF|instruction_out[12] -attr @rip(#000000) 12 -attr @name instruction_out[12] -hierPin IF instruction_out[12] -pin IF|instruction_out_reg[31:0] Q[12]
load net IF|instruction_out[13] -attr @rip(#000000) 13 -attr @name instruction_out[13] -hierPin IF instruction_out[13] -pin IF|instruction_out_reg[31:0] Q[13]
load net IF|instruction_out[14] -attr @rip(#000000) 14 -attr @name instruction_out[14] -hierPin IF instruction_out[14] -pin IF|instruction_out_reg[31:0] Q[14]
load net IF|instruction_out[15] -attr @rip(#000000) 15 -attr @name instruction_out[15] -hierPin IF instruction_out[15] -pin IF|instruction_out_reg[31:0] Q[15]
load net IF|instruction_out[16] -attr @rip(#000000) 16 -attr @name instruction_out[16] -hierPin IF instruction_out[16] -pin IF|instruction_out_reg[31:0] Q[16]
load net IF|instruction_out[17] -attr @rip(#000000) 17 -attr @name instruction_out[17] -hierPin IF instruction_out[17] -pin IF|instruction_out_reg[31:0] Q[17]
load net IF|instruction_out[18] -attr @rip(#000000) 18 -attr @name instruction_out[18] -hierPin IF instruction_out[18] -pin IF|instruction_out_reg[31:0] Q[18]
load net IF|instruction_out[19] -attr @rip(#000000) 19 -attr @name instruction_out[19] -hierPin IF instruction_out[19] -pin IF|instruction_out_reg[31:0] Q[19]
load net IF|instruction_out[1] -attr @rip(#000000) 1 -attr @name instruction_out[1] -hierPin IF instruction_out[1] -pin IF|instruction_out_reg[31:0] Q[1]
load net IF|instruction_out[20] -attr @rip(#000000) 20 -attr @name instruction_out[20] -hierPin IF instruction_out[20] -pin IF|instruction_out_reg[31:0] Q[20]
load net IF|instruction_out[21] -attr @rip(#000000) 21 -attr @name instruction_out[21] -hierPin IF instruction_out[21] -pin IF|instruction_out_reg[31:0] Q[21]
load net IF|instruction_out[22] -attr @rip(#000000) 22 -attr @name instruction_out[22] -hierPin IF instruction_out[22] -pin IF|instruction_out_reg[31:0] Q[22]
load net IF|instruction_out[23] -attr @rip(#000000) 23 -attr @name instruction_out[23] -hierPin IF instruction_out[23] -pin IF|instruction_out_reg[31:0] Q[23]
load net IF|instruction_out[24] -attr @rip(#000000) 24 -attr @name instruction_out[24] -hierPin IF instruction_out[24] -pin IF|instruction_out_reg[31:0] Q[24]
load net IF|instruction_out[25] -attr @rip(#000000) 25 -attr @name instruction_out[25] -hierPin IF instruction_out[25] -pin IF|instruction_out_reg[31:0] Q[25]
load net IF|instruction_out[26] -attr @rip(#000000) 26 -attr @name instruction_out[26] -hierPin IF instruction_out[26] -pin IF|instruction_out_reg[31:0] Q[26]
load net IF|instruction_out[27] -attr @rip(#000000) 27 -attr @name instruction_out[27] -hierPin IF instruction_out[27] -pin IF|instruction_out_reg[31:0] Q[27]
load net IF|instruction_out[28] -attr @rip(#000000) 28 -attr @name instruction_out[28] -hierPin IF instruction_out[28] -pin IF|instruction_out_reg[31:0] Q[28]
load net IF|instruction_out[29] -attr @rip(#000000) 29 -attr @name instruction_out[29] -hierPin IF instruction_out[29] -pin IF|instruction_out_reg[31:0] Q[29]
load net IF|instruction_out[2] -attr @rip(#000000) 2 -attr @name instruction_out[2] -hierPin IF instruction_out[2] -pin IF|instruction_out_reg[31:0] Q[2]
load net IF|instruction_out[30] -attr @rip(#000000) 30 -attr @name instruction_out[30] -hierPin IF instruction_out[30] -pin IF|instruction_out_reg[31:0] Q[30]
load net IF|instruction_out[31] -attr @rip(#000000) 31 -attr @name instruction_out[31] -hierPin IF instruction_out[31] -pin IF|instruction_out_reg[31:0] Q[31]
load net IF|instruction_out[3] -attr @rip(#000000) 3 -attr @name instruction_out[3] -hierPin IF instruction_out[3] -pin IF|instruction_out_reg[31:0] Q[3]
load net IF|instruction_out[4] -attr @rip(#000000) 4 -attr @name instruction_out[4] -hierPin IF instruction_out[4] -pin IF|instruction_out_reg[31:0] Q[4]
load net IF|instruction_out[5] -attr @rip(#000000) 5 -attr @name instruction_out[5] -hierPin IF instruction_out[5] -pin IF|instruction_out_reg[31:0] Q[5]
load net IF|instruction_out[6] -attr @rip(#000000) 6 -attr @name instruction_out[6] -hierPin IF instruction_out[6] -pin IF|instruction_out_reg[31:0] Q[6]
load net IF|instruction_out[7] -attr @rip(#000000) 7 -attr @name instruction_out[7] -hierPin IF instruction_out[7] -pin IF|instruction_out_reg[31:0] Q[7]
load net IF|instruction_out[8] -attr @rip(#000000) 8 -attr @name instruction_out[8] -hierPin IF instruction_out[8] -pin IF|instruction_out_reg[31:0] Q[8]
load net IF|instruction_out[9] -attr @rip(#000000) 9 -attr @name instruction_out[9] -hierPin IF instruction_out[9] -pin IF|instruction_out_reg[31:0] Q[9]
load net IF|pc_current[0] -attr @rip(#000000) pc_out[0] -attr @name pc_current[0] -pin IF|inst_mm addr[0] -pin IF|pc pc_out[0] -pin IF|pc_next_i I0[0] -pin IF|pc_out_reg[7:0] D[0]
load net IF|pc_current[1] -attr @rip(#000000) pc_out[1] -attr @name pc_current[1] -pin IF|inst_mm addr[1] -pin IF|pc pc_out[1] -pin IF|pc_next_i I0[1] -pin IF|pc_out_reg[7:0] D[1]
load net IF|pc_current[2] -attr @rip(#000000) pc_out[2] -attr @name pc_current[2] -pin IF|inst_mm addr[2] -pin IF|pc pc_out[2] -pin IF|pc_next_i I0[2] -pin IF|pc_out_reg[7:0] D[2]
load net IF|pc_current[3] -attr @rip(#000000) pc_out[3] -attr @name pc_current[3] -pin IF|inst_mm addr[3] -pin IF|pc pc_out[3] -pin IF|pc_next_i I0[3] -pin IF|pc_out_reg[7:0] D[3]
load net IF|pc_current[4] -attr @rip(#000000) pc_out[4] -attr @name pc_current[4] -pin IF|inst_mm addr[4] -pin IF|pc pc_out[4] -pin IF|pc_next_i I0[4] -pin IF|pc_out_reg[7:0] D[4]
load net IF|pc_current[5] -attr @rip(#000000) pc_out[5] -attr @name pc_current[5] -pin IF|inst_mm addr[5] -pin IF|pc pc_out[5] -pin IF|pc_next_i I0[5] -pin IF|pc_out_reg[7:0] D[5]
load net IF|pc_current[6] -attr @rip(#000000) pc_out[6] -attr @name pc_current[6] -pin IF|inst_mm addr[6] -pin IF|pc pc_out[6] -pin IF|pc_next_i I0[6] -pin IF|pc_out_reg[7:0] D[6]
load net IF|pc_current[7] -attr @rip(#000000) pc_out[7] -attr @name pc_current[7] -pin IF|inst_mm addr[7] -pin IF|pc pc_out[7] -pin IF|pc_next_i I0[7] -pin IF|pc_out_reg[7:0] D[7]
load net IF|pc_in[0] -attr @rip(#000000) O[0] -attr @name pc_in[0] -pin IF|pc pc_in[0] -pin IF|pc_in_i O[0]
load net IF|pc_in[1] -attr @rip(#000000) O[1] -attr @name pc_in[1] -pin IF|pc pc_in[1] -pin IF|pc_in_i O[1]
load net IF|pc_in[2] -attr @rip(#000000) O[2] -attr @name pc_in[2] -pin IF|pc pc_in[2] -pin IF|pc_in_i O[2]
load net IF|pc_in[3] -attr @rip(#000000) O[3] -attr @name pc_in[3] -pin IF|pc pc_in[3] -pin IF|pc_in_i O[3]
load net IF|pc_in[4] -attr @rip(#000000) O[4] -attr @name pc_in[4] -pin IF|pc pc_in[4] -pin IF|pc_in_i O[4]
load net IF|pc_in[5] -attr @rip(#000000) O[5] -attr @name pc_in[5] -pin IF|pc pc_in[5] -pin IF|pc_in_i O[5]
load net IF|pc_in[6] -attr @rip(#000000) O[6] -attr @name pc_in[6] -pin IF|pc pc_in[6] -pin IF|pc_in_i O[6]
load net IF|pc_in[7] -attr @rip(#000000) O[7] -attr @name pc_in[7] -pin IF|pc pc_in[7] -pin IF|pc_in_i O[7]
load net IF|pc_jump[0] -attr @rip(#000000) pc_jump[0] -attr @name pc_jump[0] -hierPin IF pc_jump[0] -pin IF|pc_in_i I0[0]
load net IF|pc_jump[1] -attr @rip(#000000) pc_jump[1] -attr @name pc_jump[1] -hierPin IF pc_jump[1] -pin IF|pc_in_i I0[1]
load net IF|pc_jump[2] -attr @rip(#000000) pc_jump[2] -attr @name pc_jump[2] -hierPin IF pc_jump[2] -pin IF|pc_in_i I0[2]
load net IF|pc_jump[3] -attr @rip(#000000) pc_jump[3] -attr @name pc_jump[3] -hierPin IF pc_jump[3] -pin IF|pc_in_i I0[3]
load net IF|pc_jump[4] -attr @rip(#000000) pc_jump[4] -attr @name pc_jump[4] -hierPin IF pc_jump[4] -pin IF|pc_in_i I0[4]
load net IF|pc_jump[5] -attr @rip(#000000) pc_jump[5] -attr @name pc_jump[5] -hierPin IF pc_jump[5] -pin IF|pc_in_i I0[5]
load net IF|pc_jump[6] -attr @rip(#000000) pc_jump[6] -attr @name pc_jump[6] -hierPin IF pc_jump[6] -pin IF|pc_in_i I0[6]
load net IF|pc_jump[7] -attr @rip(#000000) pc_jump[7] -attr @name pc_jump[7] -hierPin IF pc_jump[7] -pin IF|pc_in_i I0[7]
load net IF|pc_next[0] -attr @rip(#000000) O[0] -attr @name pc_next[0] -pin IF|pc_in_i I1[0] -pin IF|pc_next_i O[0]
load net IF|pc_next[1] -attr @rip(#000000) O[1] -attr @name pc_next[1] -pin IF|pc_in_i I1[1] -pin IF|pc_next_i O[1]
load net IF|pc_next[2] -attr @rip(#000000) O[2] -attr @name pc_next[2] -pin IF|pc_in_i I1[2] -pin IF|pc_next_i O[2]
load net IF|pc_next[3] -attr @rip(#000000) O[3] -attr @name pc_next[3] -pin IF|pc_in_i I1[3] -pin IF|pc_next_i O[3]
load net IF|pc_next[4] -attr @rip(#000000) O[4] -attr @name pc_next[4] -pin IF|pc_in_i I1[4] -pin IF|pc_next_i O[4]
load net IF|pc_next[5] -attr @rip(#000000) O[5] -attr @name pc_next[5] -pin IF|pc_in_i I1[5] -pin IF|pc_next_i O[5]
load net IF|pc_next[6] -attr @rip(#000000) O[6] -attr @name pc_next[6] -pin IF|pc_in_i I1[6] -pin IF|pc_next_i O[6]
load net IF|pc_next[7] -attr @rip(#000000) O[7] -attr @name pc_next[7] -pin IF|pc_in_i I1[7] -pin IF|pc_next_i O[7]
load net IF|pc_out[0] -attr @rip(#000000) 0 -attr @name pc_out[0] -hierPin IF pc_out[0] -pin IF|pc_out_reg[7:0] Q[0]
load net IF|pc_out[1] -attr @rip(#000000) 1 -attr @name pc_out[1] -hierPin IF pc_out[1] -pin IF|pc_out_reg[7:0] Q[1]
load net IF|pc_out[2] -attr @rip(#000000) 2 -attr @name pc_out[2] -hierPin IF pc_out[2] -pin IF|pc_out_reg[7:0] Q[2]
load net IF|pc_out[3] -attr @rip(#000000) 3 -attr @name pc_out[3] -hierPin IF pc_out[3] -pin IF|pc_out_reg[7:0] Q[3]
load net IF|pc_out[4] -attr @rip(#000000) 4 -attr @name pc_out[4] -hierPin IF pc_out[4] -pin IF|pc_out_reg[7:0] Q[4]
load net IF|pc_out[5] -attr @rip(#000000) 5 -attr @name pc_out[5] -hierPin IF pc_out[5] -pin IF|pc_out_reg[7:0] Q[5]
load net IF|pc_out[6] -attr @rip(#000000) 6 -attr @name pc_out[6] -hierPin IF pc_out[6] -pin IF|pc_out_reg[7:0] Q[6]
load net IF|pc_out[7] -attr @rip(#000000) 7 -attr @name pc_out[7] -hierPin IF pc_out[7] -pin IF|pc_out_reg[7:0] Q[7]
load net IF|pc_src -attr @name pc_src -hierPin IF pc_src -pin IF|pc_in_i S
netloc IF|pc_src 1 0 2 NJ 478 N
load net IF|reset -attr @name reset -hierPin IF reset -pin IF|instruction_out_reg[31:0] RST -pin IF|pc reset -pin IF|pc_out_reg[7:0] RST
netloc IF|reset 1 0 5 NJ 498 NJ 498 2070 478 NJ 478 2620
load netBundle @IF|pc_jump 8 IF|pc_jump[7] IF|pc_jump[6] IF|pc_jump[5] IF|pc_jump[4] IF|pc_jump[3] IF|pc_jump[2] IF|pc_jump[1] IF|pc_jump[0] -autobundled
netbloc @IF|pc_jump 1 0 2 NJ 458 1830
load netBundle @IF|instruction 32 IF|instruction[31] IF|instruction[30] IF|instruction[29] IF|instruction[28] IF|instruction[27] IF|instruction[26] IF|instruction[25] IF|instruction[24] IF|instruction[23] IF|instruction[22] IF|instruction[21] IF|instruction[20] IF|instruction[19] IF|instruction[18] IF|instruction[17] IF|instruction[16] IF|instruction[15] IF|instruction[14] IF|instruction[13] IF|instruction[12] IF|instruction[11] IF|instruction[10] IF|instruction[9] IF|instruction[8] IF|instruction[7] IF|instruction[6] IF|instruction[5] IF|instruction[4] IF|instruction[3] IF|instruction[2] IF|instruction[1] IF|instruction[0] -autobundled
netbloc @IF|instruction 1 4 1 NJ 378
load netBundle @IF|pc_current 8 IF|pc_current[7] IF|pc_current[6] IF|pc_current[5] IF|pc_current[4] IF|pc_current[3] IF|pc_current[2] IF|pc_current[1] IF|pc_current[0] -autobundled
netbloc @IF|pc_current 1 0 5 1610 338 NJ 338 NJ 338 2320 458 2580
load netBundle @IF|pc_in 8 IF|pc_in[7] IF|pc_in[6] IF|pc_in[5] IF|pc_in[4] IF|pc_in[3] IF|pc_in[2] IF|pc_in[1] IF|pc_in[0] -autobundled
netbloc @IF|pc_in 1 2 1 N 418
load netBundle @IF|pc_next 8 IF|pc_next[7] IF|pc_next[6] IF|pc_next[5] IF|pc_next[4] IF|pc_next[3] IF|pc_next[2] IF|pc_next[1] IF|pc_next[0] -autobundled
netbloc @IF|pc_next 1 1 1 1810J 408n
load netBundle @IF|pc_out 8 IF|pc_out[7] IF|pc_out[6] IF|pc_out[5] IF|pc_out[4] IF|pc_out[3] IF|pc_out[2] IF|pc_out[1] IF|pc_out[0] -autobundled
netbloc @IF|pc_out 1 5 1 N 498
load netBundle @IF|instruction_out 32 IF|instruction_out[31] IF|instruction_out[30] IF|instruction_out[29] IF|instruction_out[28] IF|instruction_out[27] IF|instruction_out[26] IF|instruction_out[25] IF|instruction_out[24] IF|instruction_out[23] IF|instruction_out[22] IF|instruction_out[21] IF|instruction_out[20] IF|instruction_out[19] IF|instruction_out[18] IF|instruction_out[17] IF|instruction_out[16] IF|instruction_out[15] IF|instruction_out[14] IF|instruction_out[13] IF|instruction_out[12] IF|instruction_out[11] IF|instruction_out[10] IF|instruction_out[9] IF|instruction_out[8] IF|instruction_out[7] IF|instruction_out[6] IF|instruction_out[5] IF|instruction_out[4] IF|instruction_out[3] IF|instruction_out[2] IF|instruction_out[1] IF|instruction_out[0] -autobundled
netbloc @IF|instruction_out 1 5 1 N 368
load netBundle @ID|instruction 32 ID|instruction[31] ID|instruction[30] ID|instruction[29] ID|instruction[28] ID|instruction[27] ID|instruction[26] ID|instruction[25] ID|instruction[24] ID|instruction[23] ID|instruction[22] ID|instruction[21] ID|instruction[20] ID|instruction[19] ID|instruction[18] ID|instruction[17] ID|instruction[16] ID|instruction[15] ID|instruction[14] ID|instruction[13] ID|instruction[12] ID|instruction[11] ID|instruction[10] ID|instruction[9] ID|instruction[8] ID|instruction[7] ID|instruction[6] ID|instruction[5] ID|instruction[4] ID|instruction[3] ID|instruction[2] ID|instruction[1] ID|instruction[0] -autobundled
netbloc @ID|instruction 1 0 3 3310 1088 3610 1738 3930
load netBundle @ID|rd_wb 5 ID|rd_wb[4] ID|rd_wb[3] ID|rd_wb[2] ID|rd_wb[1] ID|rd_wb[0] -autobundled
netbloc @ID|rd_wb 1 0 2 NJ 1458 3570
load netBundle @ID|write_data 8 ID|write_data[7] ID|write_data[6] ID|write_data[5] ID|write_data[4] ID|write_data[3] ID|write_data[2] ID|write_data[1] ID|write_data[0] -autobundled
netbloc @ID|write_data 1 0 2 NJ 1578 N
load netBundle @ID|alu_ctrl 4 ID|alu_ctrl[3] ID|alu_ctrl[2] ID|alu_ctrl[1] ID|alu_ctrl[0] -autobundled
netbloc @ID|alu_ctrl 1 2 1 3930 378n
load netBundle @ID|alu_op 2 ID|alu_op[1] ID|alu_op[0] -autobundled
netbloc @ID|alu_op 1 1 1 3590 728n
load netBundle @ID|imm 8 ID|imm[7] ID|imm[6] ID|imm[5] ID|imm[4] ID|imm[3] ID|imm[2] ID|imm[1] ID|imm[0] -autobundled
netbloc @ID|imm 1 2 1 NJ 988
load netBundle @ID|read_data1 8 ID|read_data1[7] ID|read_data1[6] ID|read_data1[5] ID|read_data1[4] ID|read_data1[3] ID|read_data1[2] ID|read_data1[1] ID|read_data1[0] -autobundled
netbloc @ID|read_data1 1 2 1 4050 1478n
load netBundle @ID|read_data2 8 ID|read_data2[7] ID|read_data2[6] ID|read_data2[5] ID|read_data2[4] ID|read_data2[3] ID|read_data2[2] ID|read_data2[1] ID|read_data2[0] -autobundled
netbloc @ID|read_data2 1 2 1 3930 1518n
load netBundle @ID|rs2_out 5 ID|rs2_out[4] ID|rs2_out[3] ID|rs2_out[2] ID|rs2_out[1] ID|rs2_out[0] -autobundled
netbloc @ID|rs2_out 1 3 1 N 1988
load netBundle @ID|rs1_out 5 ID|rs1_out[4] ID|rs1_out[3] ID|rs1_out[2] ID|rs1_out[1] ID|rs1_out[0] -autobundled
netbloc @ID|rs1_out 1 3 1 N 1858
load netBundle @ID|read_data2_out 8 ID|read_data2_out[7] ID|read_data2_out[6] ID|read_data2_out[5] ID|read_data2_out[4] ID|read_data2_out[3] ID|read_data2_out[2] ID|read_data2_out[1] ID|read_data2_out[0] -autobundled
netbloc @ID|read_data2_out 1 3 1 N 1598
load netBundle @ID|read_data1_out 8 ID|read_data1_out[7] ID|read_data1_out[6] ID|read_data1_out[5] ID|read_data1_out[4] ID|read_data1_out[3] ID|read_data1_out[2] ID|read_data1_out[1] ID|read_data1_out[0] -autobundled
netbloc @ID|read_data1_out 1 3 1 N 1468
load netBundle @ID|rd_out 5 ID|rd_out[4] ID|rd_out[3] ID|rd_out[2] ID|rd_out[1] ID|rd_out[0] -autobundled
netbloc @ID|rd_out 1 3 1 4330 1448n
load netBundle @ID|imm_out 8 ID|imm_out[7] ID|imm_out[6] ID|imm_out[5] ID|imm_out[4] ID|imm_out[3] ID|imm_out[2] ID|imm_out[1] ID|imm_out[0] -autobundled
netbloc @ID|imm_out 1 3 1 4310 718n
load netBundle @ID|alu_ctrl_out 4 ID|alu_ctrl_out[3] ID|alu_ctrl_out[2] ID|alu_ctrl_out[1] ID|alu_ctrl_out[0] -autobundled
netbloc @ID|alu_ctrl_out 1 3 1 N 368
load netBundle @FWD_UNIT|rd_mem 5 FWD_UNIT|rd_mem[4] FWD_UNIT|rd_mem[3] FWD_UNIT|rd_mem[2] FWD_UNIT|rd_mem[1] FWD_UNIT|rd_mem[0] -autobundled
netbloc @FWD_UNIT|rd_mem 1 0 2 5031 486 5271
load netBundle @FWD_UNIT|rd_wb 5 FWD_UNIT|rd_wb[4] FWD_UNIT|rd_wb[3] FWD_UNIT|rd_wb[2] FWD_UNIT|rd_wb[1] FWD_UNIT|rd_wb[0] -autobundled
netbloc @FWD_UNIT|rd_wb 1 0 3 NJ 608 5291 608 5511
load netBundle @FWD_UNIT|rs1_ex 5 FWD_UNIT|rs1_ex[4] FWD_UNIT|rs1_ex[3] FWD_UNIT|rs1_ex[2] FWD_UNIT|rs1_ex[1] FWD_UNIT|rs1_ex[0] -autobundled
netbloc @FWD_UNIT|rs1_ex 1 0 3 5031J 666 5231 628 5531J
load netBundle @FWD_UNIT|rs2_ex 5 FWD_UNIT|rs2_ex[4] FWD_UNIT|rs2_ex[3] FWD_UNIT|rs2_ex[2] FWD_UNIT|rs2_ex[1] FWD_UNIT|rs2_ex[0] -autobundled
netbloc @FWD_UNIT|rs2_ex 1 0 3 NJ 726 5211 726 5571
load netBundle @FWD_UNIT|fwd_a_i_n_ 2 FWD_UNIT|fwd_a_i_n_0 FWD_UNIT|fwd_a_i_n_1 -autobundled
netbloc @FWD_UNIT|fwd_a_i_n_ 1 5 1 6281 408n
load netBundle @FWD_UNIT|fwd_a 2 FWD_UNIT|fwd_a[1] FWD_UNIT|fwd_a[0] -autobundled
netbloc @FWD_UNIT|fwd_a 1 6 1 N 478
load netBundle @FWD_UNIT|fwd_b_i_n_ 2 FWD_UNIT|fwd_b_i_n_0 FWD_UNIT|fwd_b_i_n_1 -autobundled
netbloc @FWD_UNIT|fwd_b_i_n_ 1 5 1 6281 648n
load netBundle @FWD_UNIT|fwd_b 2 FWD_UNIT|fwd_b[1] FWD_UNIT|fwd_b[0] -autobundled
netbloc @FWD_UNIT|fwd_b 1 6 1 N 646
load netBundle @WB|alu_result 8 WB|alu_result[7] WB|alu_result[6] WB|alu_result[5] WB|alu_result[4] WB|alu_result[3] WB|alu_result[2] WB|alu_result[1] WB|alu_result[0] -autobundled
netbloc @WB|alu_result 1 0 1 N 736
load netBundle @WB|read_data 8 WB|read_data[7] WB|read_data[6] WB|read_data[5] WB|read_data[4] WB|read_data[3] WB|read_data[2] WB|read_data[1] WB|read_data[0] -autobundled
netbloc @WB|read_data 1 0 1 1610 716n
load netBundle @WB|write_data 8 WB|write_data[7] WB|write_data[6] WB|write_data[5] WB|write_data[4] WB|write_data[3] WB|write_data[2] WB|write_data[1] WB|write_data[0] -autobundled
netbloc @WB|write_data 1 1 1 N 726
load netBundle @MEM|alu_result_in 8 MEM|alu_result_in[7] MEM|alu_result_in[6] MEM|alu_result_in[5] MEM|alu_result_in[4] MEM|alu_result_in[3] MEM|alu_result_in[2] MEM|alu_result_in[1] MEM|alu_result_in[0] -autobundled
netbloc @MEM|alu_result_in 1 0 2 480 318 NJ
load netBundle @MEM|pc_branch_in 8 MEM|pc_branch_in[7] MEM|pc_branch_in[6] MEM|pc_branch_in[5] MEM|pc_branch_in[4] MEM|pc_branch_in[3] MEM|pc_branch_in[2] MEM|pc_branch_in[1] MEM|pc_branch_in[0] -autobundled
netbloc @MEM|pc_branch_in 1 0 3 N 648 800J 498 NJ
load netBundle @MEM|rd_in 5 MEM|rd_in[4] MEM|rd_in[3] MEM|rd_in[2] MEM|rd_in[1] MEM|rd_in[0] -autobundled
netbloc @MEM|rd_in 1 0 2 NJ 698 760
load netBundle @MEM|write_data_in 8 MEM|write_data_in[7] MEM|write_data_in[6] MEM|write_data_in[5] MEM|write_data_in[4] MEM|write_data_in[3] MEM|write_data_in[2] MEM|write_data_in[1] MEM|write_data_in[0] -autobundled
netbloc @MEM|write_data_in 1 0 1 480 588n
load netBundle @MEM|read_data 8 MEM|read_data[7] MEM|read_data[6] MEM|read_data[5] MEM|read_data[4] MEM|read_data[3] MEM|read_data[2] MEM|read_data[1] MEM|read_data[0] -autobundled
netbloc @MEM|read_data 1 1 1 820 548n
load netBundle @MEM|read_data_out 8 MEM|read_data_out[7] MEM|read_data_out[6] MEM|read_data_out[5] MEM|read_data_out[4] MEM|read_data_out[3] MEM|read_data_out[2] MEM|read_data_out[1] MEM|read_data_out[0] -autobundled
netbloc @MEM|read_data_out 1 2 1 1120 578n
load netBundle @MEM|rd_out 5 MEM|rd_out[4] MEM|rd_out[3] MEM|rd_out[2] MEM|rd_out[1] MEM|rd_out[0] -autobundled
netbloc @MEM|rd_out 1 2 1 1160 668n
load netBundle @MEM|alu_result_out 8 MEM|alu_result_out[7] MEM|alu_result_out[6] MEM|alu_result_out[5] MEM|alu_result_out[4] MEM|alu_result_out[3] MEM|alu_result_out[2] MEM|alu_result_out[1] MEM|alu_result_out[0] -autobundled
netbloc @MEM|alu_result_out 1 2 1 N 308
load netBundle @EX|alu_ctrl 4 EX|alu_ctrl[3] EX|alu_ctrl[2] EX|alu_ctrl[1] EX|alu_ctrl[0] -autobundled
netbloc @EX|alu_ctrl 1 0 4 NJ 458 7481J 498 NJ 498 8081
load netBundle @EX|ex_mem_result 8 EX|ex_mem_result[7] EX|ex_mem_result[6] EX|ex_mem_result[5] EX|ex_mem_result[4] EX|ex_mem_result[3] EX|ex_mem_result[2] EX|ex_mem_result[1] EX|ex_mem_result[0] -autobundled
netbloc @EX|ex_mem_result 1 0 3 NJ 538 7541 478 7821J
load netBundle @EX|fwd_a 2 EX|fwd_a[1] EX|fwd_a[0] -autobundled
netbloc @EX|fwd_a 1 0 3 NJ 558 7501 458N 7841
load netBundle @EX|fwd_b 2 EX|fwd_b[1] EX|fwd_b[0] -autobundled
netbloc @EX|fwd_b 1 0 2 7201 798N 7541
load netBundle @EX|imm 8 EX|imm[7] EX|imm[6] EX|imm[5] EX|imm[4] EX|imm[3] EX|imm[2] EX|imm[1] EX|imm[0] -autobundled
netbloc @EX|imm 1 0 4 NJ 598 NJ 598 7821 678 8081
load netBundle @EX|mem_wb_result 8 EX|mem_wb_result[7] EX|mem_wb_result[6] EX|mem_wb_result[5] EX|mem_wb_result[4] EX|mem_wb_result[3] EX|mem_wb_result[2] EX|mem_wb_result[1] EX|mem_wb_result[0] -autobundled
netbloc @EX|mem_wb_result 1 0 2 7221 678 7461
load netBundle @EX|op1 8 EX|op1[7] EX|op1[6] EX|op1[5] EX|op1[4] EX|op1[3] EX|op1[2] EX|op1[1] EX|op1[0] -autobundled
netbloc @EX|op1 1 0 2 NJ 838 7521
load netBundle @EX|op2 8 EX|op2[7] EX|op2[6] EX|op2[5] EX|op2[4] EX|op2[3] EX|op2[2] EX|op2[1] EX|op2[0] -autobundled
netbloc @EX|op2 1 0 1 7221 748n
load netBundle @EX|pc_in 8 EX|pc_in[7] EX|pc_in[6] EX|pc_in[5] EX|pc_in[4] EX|pc_in[3] EX|pc_in[2] EX|pc_in[1] EX|pc_in[0] -autobundled
netbloc @EX|pc_in 1 0 4 NJ 998 NJ 998 NJ 998 8101
load netBundle @EX|rd_in 5 EX|rd_in[4] EX|rd_in[3] EX|rd_in[2] EX|rd_in[1] EX|rd_in[0] -autobundled
netbloc @EX|rd_in 1 0 5 NJ 1308 NJ 1308 NJ 1308 NJ 1308 NJ
load netBundle @EX|alu_result 8 EX|alu_result[7] EX|alu_result[6] EX|alu_result[5] EX|alu_result[4] EX|alu_result[3] EX|alu_result[2] EX|alu_result[1] EX|alu_result[0] -autobundled
netbloc @EX|alu_result 1 4 1 N 438
load netBundle @EX|pc_branch 8 EX|pc_branch[7] EX|pc_branch[6] EX|pc_branch[5] EX|pc_branch[4] EX|pc_branch[3] EX|pc_branch[2] EX|pc_branch[1] EX|pc_branch[0] -autobundled
netbloc @EX|pc_branch 1 4 1 N 928
load netBundle @EX|src10_i_n_ 8 EX|src10_i_n_0 EX|src10_i_n_1 EX|src10_i_n_2 EX|src10_i_n_3 EX|src10_i_n_4 EX|src10_i_n_5 EX|src10_i_n_6 EX|src10_i_n_7 -autobundled
netbloc @EX|src10_i_n_ 1 2 1 7781 398n
load netBundle @EX|src1 8 EX|src1[7] EX|src1[6] EX|src1[5] EX|src1[4] EX|src1[3] EX|src1[2] EX|src1[1] EX|src1[0] -autobundled
netbloc @EX|src1 1 3 1 8081 418n
load netBundle @EX|src2 8 EX|src2[7] EX|src2[6] EX|src2[5] EX|src2[4] EX|src2[3] EX|src2[2] EX|src2[1] EX|src2[0] -autobundled
netbloc @EX|src2 1 3 1 8101 478n
load netBundle @EX|src2_raw0_i_n_ 8 EX|src2_raw0_i_n_0 EX|src2_raw0_i_n_1 EX|src2_raw0_i_n_2 EX|src2_raw0_i_n_3 EX|src2_raw0_i_n_4 EX|src2_raw0_i_n_5 EX|src2_raw0_i_n_6 EX|src2_raw0_i_n_7 -autobundled
netbloc @EX|src2_raw0_i_n_ 1 1 1 N 738
load netBundle @EX|src2_raw 8 EX|src2_raw[7] EX|src2_raw[6] EX|src2_raw[5] EX|src2_raw[4] EX|src2_raw[3] EX|src2_raw[2] EX|src2_raw[1] EX|src2_raw[0] -autobundled
netbloc @EX|src2_raw 1 2 3 7841 978 NJ 978 8351J
load netBundle @EX|alu_result_out 8 EX|alu_result_out[7] EX|alu_result_out[6] EX|alu_result_out[5] EX|alu_result_out[4] EX|alu_result_out[3] EX|alu_result_out[2] EX|alu_result_out[1] EX|alu_result_out[0] -autobundled
netbloc @EX|alu_result_out 1 5 1 8701 288n
load netBundle @EX|src2_raw_out 8 EX|src2_raw_out[7] EX|src2_raw_out[6] EX|src2_raw_out[5] EX|src2_raw_out[4] EX|src2_raw_out[3] EX|src2_raw_out[2] EX|src2_raw_out[1] EX|src2_raw_out[0] -autobundled
netbloc @EX|src2_raw_out 1 5 1 N 1168
load netBundle @EX|rd_out 5 EX|rd_out[4] EX|rd_out[3] EX|rd_out[2] EX|rd_out[1] EX|rd_out[0] -autobundled
netbloc @EX|rd_out 1 5 1 8721 1128n
load netBundle @EX|pc_out 8 EX|pc_out[7] EX|pc_out[6] EX|pc_out[5] EX|pc_out[4] EX|pc_out[3] EX|pc_out[2] EX|pc_out[1] EX|pc_out[0] -autobundled
netbloc @EX|pc_out 1 5 1 N 918
load netBundle @ex_alu_result 8 ex_alu_result[7] ex_alu_result[6] ex_alu_result[5] ex_alu_result[4] ex_alu_result[3] ex_alu_result[2] ex_alu_result[1] ex_alu_result[0] -autobundled
netbloc @ex_alu_result 1 0 6 180 130 NJ 130 NJ 130 NJ 130 6991 210 8900
load netBundle @ex_pc_branch 8 ex_pc_branch[7] ex_pc_branch[6] ex_pc_branch[5] ex_pc_branch[4] ex_pc_branch[3] ex_pc_branch[2] ex_pc_branch[1] ex_pc_branch[0] -autobundled
netbloc @ex_pc_branch 1 0 6 140 90 NJ 90 NJ 90 NJ 90 NJ 90 9080
load netBundle @ex_rd 5 ex_rd[4] ex_rd[3] ex_rd[2] ex_rd[1] ex_rd[0] -autobundled
netbloc @ex_rd 1 0 6 200 150 NJ 150 NJ 150 4761 170 NJ 170 8980
load netBundle @ex_src2_raw 8 ex_src2_raw[7] ex_src2_raw[6] ex_src2_raw[5] ex_src2_raw[4] ex_src2_raw[3] ex_src2_raw[2] ex_src2_raw[1] ex_src2_raw[0] -autobundled
netbloc @ex_src2_raw 1 0 6 160 110 NJ 110 NJ 110 NJ 110 NJ 110 9060
load netBundle @fwd_a 2 fwd_a[1] fwd_a[0] -autobundled
netbloc @fwd_a 1 4 1 6730 478n
load netBundle @fwd_b 2 fwd_b[1] fwd_b[0] -autobundled
netbloc @fwd_b 1 4 1 6690 578n
load netBundle @id_alu_ctrl 4 id_alu_ctrl[3] id_alu_ctrl[2] id_alu_ctrl[1] id_alu_ctrl[0] -autobundled
netbloc @id_alu_ctrl 1 3 2 4580J 250 7011
load netBundle @id_imm 8 id_imm[7] id_imm[6] id_imm[5] id_imm[4] id_imm[3] id_imm[2] id_imm[1] id_imm[0] -autobundled
netbloc @id_imm 1 3 2 4600J 290 6750
load netBundle @id_rd 5 id_rd[4] id_rd[3] id_rd[2] id_rd[1] id_rd[0] -autobundled
netbloc @id_rd 1 3 2 4660J 918 6750
load netBundle @id_rdata1 8 id_rdata1[7] id_rdata1[6] id_rdata1[5] id_rdata1[4] id_rdata1[3] id_rdata1[2] id_rdata1[1] id_rdata1[0] -autobundled
netbloc @id_rdata1 1 3 2 4720J 938 6810
load netBundle @id_rdata2 8 id_rdata2[7] id_rdata2[6] id_rdata2[5] id_rdata2[4] id_rdata2[3] id_rdata2[2] id_rdata2[1] id_rdata2[0] -autobundled
netbloc @id_rdata2 1 3 2 4740J 958 6830
load netBundle @id_rs1 5 id_rs1[4] id_rs1[3] id_rs1[2] id_rs1[1] id_rs1[0] -autobundled
netbloc @id_rs1 1 3 1 4640 668n
load netBundle @id_rs2 5 id_rs2[4] id_rs2[3] id_rs2[2] id_rs2[1] id_rs2[0] -autobundled
netbloc @id_rs2 1 3 1 4700 726n
load netBundle @if_instruction 32 if_instruction[31] if_instruction[30] if_instruction[29] if_instruction[28] if_instruction[27] if_instruction[26] if_instruction[25] if_instruction[24] if_instruction[23] if_instruction[22] if_instruction[21] if_instruction[20] if_instruction[19] if_instruction[18] if_instruction[17] if_instruction[16] if_instruction[15] if_instruction[14] if_instruction[13] if_instruction[12] if_instruction[11] if_instruction[10] if_instruction[9] if_instruction[8] if_instruction[7] if_instruction[6] if_instruction[5] if_instruction[4] if_instruction[3] if_instruction[2] if_instruction[1] if_instruction[0] -autobundled
netbloc @if_instruction 1 2 1 3120 368n
load netBundle @if_pc 8 if_pc[7] if_pc[6] if_pc[5] if_pc[4] if_pc[3] if_pc[2] if_pc[1] if_pc[0] -autobundled
netbloc @if_pc 1 2 1 3100 498n
load netBundle @mem_alu_result 8 mem_alu_result[7] mem_alu_result[6] mem_alu_result[5] mem_alu_result[4] mem_alu_result[3] mem_alu_result[2] mem_alu_result[1] mem_alu_result[0] -autobundled
netbloc @mem_alu_result 1 1 1 1390 308n
load netBundle @pc_branch 8 pc_branch[7] pc_branch[6] pc_branch[5] pc_branch[4] pc_branch[3] pc_branch[2] pc_branch[1] pc_branch[0] -autobundled
netbloc @pc_branch 1 1 1 1330 458n
load netBundle @mem_rd 5 mem_rd[4] mem_rd[3] mem_rd[2] mem_rd[1] mem_rd[0] -autobundled
netbloc @mem_rd 1 1 3 1410 598 3140 270 4540J
load netBundle @mem_read_data 8 mem_read_data[7] mem_read_data[6] mem_read_data[5] mem_read_data[4] mem_read_data[3] mem_read_data[2] mem_read_data[1] mem_read_data[0] -autobundled
netbloc @mem_read_data 1 1 1 1330 688n
load netBundle @wb_write_data 8 wb_write_data[7] wb_write_data[6] wb_write_data[5] wb_write_data[4] wb_write_data[3] wb_write_data[2] wb_write_data[1] wb_write_data[0] -autobundled
netbloc @wb_write_data 1 2 3 3040 2128 4800J 1018 6790
levelinfo -pg 1 0 370 1580 3280 4981 7171 9100
levelinfo -hier EX * 7341 7661 7961 8201 8491 *
levelinfo -hier FWD_UNIT * 5101 5381 5641 5841 6161 6471 *
levelinfo -hier ID * 3410 3750 4090 *
levelinfo -hier IF * 1700 1950 2160 2400 2660 *
levelinfo -hier MEM * 590 910 *
levelinfo -hier WB * 1750 *
pagesize -pg 1 -db -bbox -sgen -80 0 9100 2140
pagesize -hier EX -db -bbox -sgen 7171 238 8771 1488
pagesize -hier FWD_UNIT -db -bbox -sgen 4981 338 6601 828
pagesize -hier ID -db -bbox -sgen 3280 298 4360 2058
pagesize -hier IF -db -bbox -sgen 1580 298 2890 568
pagesize -hier MEM -db -bbox -sgen 370 238 1190 968
pagesize -hier WB -db -bbox -sgen 1580 666 1880 796
show
zoom 0.196177
scrollpos 48 -176
#
# initialize ictrl to current module riscv_top work:riscv_top:NOFILE
ictrl init topinfo |
