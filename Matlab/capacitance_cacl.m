%% Calculate Full And Emtpy Tank Capacitance 
clc
clear all
e0= 8.854e-12;
eW=1; % on air
K2=88; % on water
W= 21e-2;
L= 23e-2; 
A=W*L;
d= 0.3e-2;
C_full=(K2*e0*A)/d;
C_empty=(eW*e0*A)/d;

C_empty_Tank_pF=C_empty*1e12;     % pikofarad
C_full_Tank_nF=C_full*1e9;    %  nanofarad

C_empty_Tank_pF  % pikofarad
C_full_Tank_nF   %  nanofarad

%% Water Level Based, Capacitance and Voltage Calculation 
clc
clear all
C0= 1.425494e-10;
Vi=0.2; % Input 200mVp-p 1kHz
Gain=10; % Instrumental amplifier gain 
Water_Level = 4/4; % 4/4 3/4 2/4 1/4 0/4 Water Level 
e0= 8.854e-12; 
eW=1; % on air
K2=88; % on water
W= 21e-2;
Ho= 23e-2; 
H_fluid=Ho*Water_Level;
H_air=Ho-H_fluid;
A_water=W*H_fluid;
A_air=W*H_air;
d= 0.3e-2;
C_water=(K2*e0*A_water)/d;
C_air=(eW*e0*A_air)/d;
C_total = C_water +C_air ; 

C_total_nF=C_total*1e9; %  nanofarad
if C_total_nF<1
 C_total_pF=C_total*1e12;     % pikofarad
    C_total_pF
else
    C_total_nF
end
Vo= ((C_total)/(C_total+C0))*Vi*Gain;
    Vo
    
%% Sum of Square of Errors
SSE=(-0.204-0.426+0.122+0.171+0.304)^2;
    SSE