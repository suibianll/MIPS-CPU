parameter Type_LW=4'h0;
parameter Type_LB=4'h1;
parameter Type_LBU=4'h2;
parameter Type_LH=4'h3;
parameter Type_LHU=4'h4;
parameter Type_LWL=4'h5;
parameter Type_LWR=4'h6;
/*LW类型*/
parameter Type_SW=3'h0;
parameter Type_SB=3'h1;
parameter Type_SH=3'h2;
parameter Type_SWL=3'h3;
parameter Type_SWR=3'h4;
/*SW类型*/

parameter A_NOP=5'h0;
parameter A_ADD=5'h1;
parameter A_SUB=5'h2;
parameter A_AND=5'h3;
parameter A_OR=5'h4;
parameter A_XOR=5'h5;
parameter A_NOR=5'h6;
parameter A_SLL=5'h7;
parameter A_SRL=5'h8;
parameter A_LUI=5'h9;
parameter A_COM=5'ha;
parameter A_COMU=5'hb;
parameter A_MULT=5'hc;
/*用于ALU*/

parameter FUNCT_ADD=6'h20;
parameter FUNCT_ADDU=6'h21;
parameter FUNCT_AND=6'h24;
parameter FUNCT_MULT=6'h18;
parameter FUNCT_MULTU=6'h19;
parameter FUNCT_NOR=6'h27;
parameter FUNCT_XOR=6'h26;
parameter FUNCT_OR=6'h25;
parameter FUNCT_SLL=6'h0;
parameter FUNCT_SLLV=6'h4;
parameter FUNCT_SRL=6'h2;
parameter FUNCT_SRLV=6'h6;
parameter FUNCT_SUB=6'h22;
parameter FUNCT_SUBU=6'h23;
parameter FUNCT_JR=6'h8;
parameter FUNCT_SLT=6'h2a;
parameter FUNCT_SLTU=6'h2b;
parameter FUNCT_MOVN=6'hb;
parameter FUNCT_MOVZ=6'ha;

/*用于判断指令funct段*/

parameter OP_RTYPE=6'h0;
parameter OP_ADDI=6'h8;
parameter OP_ADDIU=6'h9;
parameter OP_ANDI=6'hc;
parameter OP_ORI=6'hd;
parameter OP_XORI=6'he;
parameter OP_BEQ=6'h4; //=0
parameter OP_BGEZ=6'h1;//>=0
parameter OP_BGTZ=6'h7;//>0
parameter OP_BLEZ=6'h6;//<=0
parameter OP_BLTZ=6'h1;//<0
parameter OP_BNE=6'h5;//不相等
parameter OP_J=6'h2;
parameter OP_JR=6'h0;
parameter OP_JAL=6'h3;
parameter OP_LW=6'h23;
parameter OP_LB=6'h20;
parameter OP_LBU=6'h24;
parameter OP_LH=6'h21;
parameter OP_LHU=6'h25;
parameter OP_LWL=6'h22;
parameter OP_LWR=6'h26;
parameter OP_SW=6'h2b;
parameter OP_SB=6'h28;
parameter OP_SH=6'h29;
parameter OP_SWL=6'h2a;
parameter OP_SWR=6'h2e;
parameter OP_LUI=6'hf;
parameter OP_SLTI=6'ha;
parameter OP_SLTIU=6'hb;
parameter OP_MUL=6'h1c;
/*用于判断指令op段*/

