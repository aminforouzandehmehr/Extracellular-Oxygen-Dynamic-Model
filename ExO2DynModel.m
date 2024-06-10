%% The model of extracellular oxygen dynamics in Forouzandehmehr et al., 2024 (https://doi.org/10.1242/dmm.050365)
% Author: Amin Forouzandehmehr

OBL = 0.133;            % Source/bath O2 concentration in normal condition (physoxia) 0.133 mM (https://doi.org/10.1074/jbc.M116.751826)
alp = 1.1626e-01;       % conversion factor Cm/(F*Vc*1e-18): A/F to mM/s Paci et al., 2018 and Wei et al., 2014
bta = (1-z)*OBL;        % Physoxia = 0, SEV1 = 0.5855 representing 20% INaK & IpCa inhibition, SEV2 = 0.7174 representing 31% INaK & IpCa inhibition. bta = 1-O2.
eps = 5;                % (s^-1) diffusion rate based on Fick's law eps = 2D/dx^2 --> dx = 10 um, D = 2.5e-10 m^2/s (ischemia-reperfusion)

O2s = OBL-bta*(0.5*(1+tanh((0.06)*(time-300))))+bta*(0.5*(1+tanh((0.06)*(time-900))));  

dY(33,1) = -alp*1.6*0.2658*(1*0.2*i_NaK + 1*i_PCa) - 1.6*ATPase + eps*(O2s-Y(33));
O2O = Y(33);
do2dt = dY(33,1);
