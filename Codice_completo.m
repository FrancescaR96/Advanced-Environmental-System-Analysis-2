clear
clc

addpath('Dati globali\')
addpath('Laboratori Giuliani\')

lonMuzza = [9.3, 9.9];
latMuzza = [45.05, 45.5];

%% scenario 70 2091_2100
tas70_2091_2100 = extractNetCDFdata('mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_tas_global_daily_2091_2100.nc', 'tas');
pr70_2091_2100 = extractNetCDFdata('mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_pr_global_daily_2091_2100.nc', 'pr');

tas70_2091_2100_Muzza = cutNetCDFdata( tas70_2091_2100, lonMuzza, latMuzza );
pr70_2091_2100_Muzza = cutNetCDFdata( pr70_2091_2100, lonMuzza, latMuzza );

T1 = tas70_2091_2100_Muzza.value;
P1 = pr70_2091_2100_Muzza.value;


save -ascii tas70_2091_2100_Muzza.txt T1
save -ascii pr70_2091_2100_Muzza.txt P1

clear tas70_2091_2100
clear pr70_2091_2100

%% scenario 26 2091_2100
tas26_2091_2100 = extractNetCDFdata('mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_tas_global_daily_2091_2100.nc', 'tas');
pr26_2091_2100 = extractNetCDFdata('mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_pr_global_daily_2091_2100.nc', 'pr');

tas26_2091_2100_Muzza = cutNetCDFdata( tas26_2091_2100, lonMuzza, latMuzza );
pr26_2091_2100_Muzza = cutNetCDFdata( pr26_2091_2100, lonMuzza, latMuzza );

T2 = tas26_2091_2100_Muzza.value;
P2 = pr26_2091_2100_Muzza.value;

save -ascii tas26_2091_2100_Muzza.txt T2
save -ascii pr26_2091_2100_Muzza.txt P2

clear tas26_2091_2100
clear pr26_2091_2100

%% scenario 70 2051_2060

tas70_2051_2060 = extractNetCDFdata('mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_tas_global_daily_2051_2060.nc', 'tas');
pr70_2051_2060 = extractNetCDFdata('mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp370_pr_global_daily_2051_2060.nc', 'pr');

tas70_2051_2060_Muzza = cutNetCDFdata( tas70_2051_2060, lonMuzza, latMuzza );
pr70_2051_2060_Muzza = cutNetCDFdata( pr70_2051_2060, lonMuzza, latMuzza );

T3 = tas70_2051_2060_Muzza.value;
P3 = pr70_2051_2060_Muzza.value;

save -ascii tas70_2051_2060_Muzza.txt T3
save -ascii pr70_2051_2060_Muzza.txt P3

clear tas70_2051_2060
clear pr70_2051_2060

%% scenario 26 2051_2060

tas26_2051_2060 = extractNetCDFdata('mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_tas_global_daily_2051_2060.nc', 'tas');
pr26_2051_2060 = extractNetCDFdata('mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp126_pr_global_daily_2051_2060.nc', 'pr');

tas26_2051_2060_Muzza = cutNetCDFdata( tas26_2051_2060, lonMuzza, latMuzza );
pr26_2051_2060_Muzza = cutNetCDFdata( pr26_2051_2060, lonMuzza, latMuzza );

T4 = tas26_2051_2060_Muzza.value;
P4 = pr26_2051_2060_Muzza.value;

save -ascii tas26_2051_2060_Muzza.txt T4
save -ascii pr26_2051_2060_Muzza.txt P4

clear tas26_2051_2060
clear pr26_2051_2060

%% scenario 85 2051_2060
tas85_2051_2060 = extractNetCDFdata('mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp585_tas_global_daily_2051_2060.nc', 'tas');
pr85_2051_2060 = extractNetCDFdata('mpi-esm1-2-hr_r1i1p1f1_w5e5_ssp585_pr_global_daily_2051_2060.nc', 'pr');

tas85_2051_2060_Muzza = cutNetCDFdata( tas85_2051_2060, lonMuzza, latMuzza );
pr85_2051_2060_Muzza = cutNetCDFdata( pr85_2051_2060, lonMuzza, latMuzza );

T5 = tas85_2051_2060_Muzza.value;
P5 = pr85_2051_2060_Muzza.value;

save -ascii tas85_2051_2060_Muzza.txt T5
save -ascii pr85_2051_2060_Muzza.txt P5

clear tas85_2051_2060
clear pr85_2051_2060


%% togliamo 29/02 anni bisestili
load -ascii tasH_2001_2010.txt 
load -ascii tas85_2091_2100_Muzza.txt 
load -ascii prH_2001_2010_Muzza.txt 
load -ascii pr85_2091_2100_Muzza.txt 
load -ascii pr26_2051_2060_Muzza.txt
load -ascii pr26_2091_2100_Muzza.txt
load -ascii pr70_2051_2060_Muzza.txt
load -ascii pr70_2091_2100_Muzza.txt
load -ascii pr85_2051_2060_Muzza.txt
load -ascii tas26_2091_2100_Muzza.txt
load -ascii tas26_2051_2060_Muzza.txt
load -ascii tas70_2091_2100_Muzza.txt
load -ascii tas85_2051_2060_Muzza.txt
load -ascii tas70_2051_2060_Muzza.txt


id29h = findLeapYears([2001,1,1],[2010,12,31]);
id29c = findLeapYears([2051,1,1],[2060,12,31]);
id29f = findLeapYears([2091,1,1],[2100,12,31]);

tasH_Muzza_sb = tasH_2001_2010(~id29h);
prH_Muzza_sb = prH_2001_2010_Muzza(~id29h);

tas85_2091_2100_Muzza_sb = tas85_2091_2100_Muzza(~id29f);
pr85_2091_2100_Muzza_sb = pr85_2091_2100_Muzza(~id29f);

tas70_2091_2100_Muzza_sb = tas70_2091_2100_Muzza(~id29f);
pr70_2091_2100_Muzza_sb = pr70_2091_2100_Muzza(~id29f);

tas26_2091_2100_Muzza_sb = tas26_2091_2100_Muzza(~id29f);
pr26_2091_2100_Muzza_sb = pr26_2091_2100_Muzza(~id29f);

tas70_2051_2060_Muzza_sb = tas70_2051_2060_Muzza(~id29c);
pr70_2051_2060_Muzza_sb = pr70_2051_2060_Muzza(~id29c);

tas26_2051_2060_Muzza_sb = tas26_2051_2060_Muzza(~id29c);
pr26_2051_2060_Muzza_sb = pr26_2051_2060_Muzza(~id29c);

tas85_2051_2060_Muzza_sb = tas85_2051_2060_Muzza(~id29c);
pr85_2051_2060_Muzza_sb = pr85_2051_2060_Muzza(~id29c);

TH = tasH_Muzza_sb;
PH = prH_Muzza_sb;

T85_2091_2100 = tas85_2091_2100_Muzza_sb;
P85_2091_2100 = pr85_2091_2100_Muzza_sb;

T70_2091_2100 = tas70_2091_2100_Muzza_sb;
P70_2091_2100 = pr70_2091_2100_Muzza_sb;

T26_2091_2100 = tas26_2091_2100_Muzza_sb;
P26_2091_2100 = pr26_2091_2100_Muzza_sb;

T85_2051_2060 = tas85_2051_2060_Muzza_sb;
P85_2051_2060 = pr85_2051_2060_Muzza_sb;

T70_2051_2060 = tas70_2051_2060_Muzza_sb;
P70_2051_2060 = pr70_2051_2060_Muzza_sb;

T26_2051_2060 = tas26_2051_2060_Muzza_sb;
P26_2051_2060 = pr26_2051_2060_Muzza_sb;


save -ascii tasH_2001_2010_Muzza_sb.txt TH
save -ascii tas85_2091_2100_Muzza_sb.txt T85_2091_2100
save -ascii prH_2001_2010_Muzza_sb.txt PH
save -ascii pr85_2091_2100_Muzza_sb.txt P85_2091_2100
save -ascii tas70_2091_2100_Muzza_sb.txt T70_2091_2100
save -ascii pr70_2091_2100_Muzza_sb.txt P70_2091_2100
save -ascii tas26_2091_2100_Muzza_sb.txt T26_2091_2100
save -ascii pr26_2091_2100_Muzza_sb.txt P26_2091_2100
save -ascii tas70_2051_2060_Muzza_sb.txt T70_2051_2060
save -ascii pr70_2051_2060_Muzza_sb.txt P70_2051_2060
save -ascii tas26_2051_2060_Muzza_sb.txt T26_2051_2060
save -ascii pr26_2051_2060_Muzza_sb.txt P26_2051_2060
save -ascii tas85_2051_2060_Muzza_sb.txt T85_2051_2060
save -ascii pr85_2051_2060_Muzza_sb.txt P85_2051_2060

%% ricavo osservazioni per la nostra cella
addpath('model')

% retrieve historical observations for a specific cell of the model (the
% historical data are available over the period 1/1/1993-31/12/2007)
myCell = 720 ; % replace this with the sum of the (n1*n2)^2, where n is the last digit of your personal codes
histYears = [2001:2007];
[Tobs, Pobs] = getMeteo(histYears, myCell);

save -ascii Pobs.txt Pobs
save -ascii Tobs.txt Tobs 

%% dopo downscaling scenari 2051_2060
Td_26_2051_2060 = [];
Td_70_2051_2060 = [];
Td_85_2051_2060 = [];

save -ascii Td_26_2051_2060.txt Td_26_2051_2060
save -ascii Td_70_2051_2060.txt Td_70_2051_2060
save -ascii Td_85_2051_2060.txt Td_85_2051_2060

Pd_26_2051_2060 = [];
Pd_70_2051_2060 = [];
Pd_85_2051_2060 = [];

save -ascii Pd_26_2051_2060.txt Pd_26_2051_2060
save -ascii Pd_70_2051_2060.txt Pd_70_2051_2060
save -ascii Pd_85_2051_2060.txt Pd_85_2051_2060

%% loading dati
addpath('Scenari dopo downscaling\')
addpath('Laboratori Giuliani\')
addpath('Osservazioni cella 720\')
addpath('Dati ritagliati senza 29_02\')

load -ascii Td_26_2051_2060.txt
load -ascii Td_70_2051_2060.txt
load -ascii Td_85_2051_2060.txt

load -ascii Pd_26_2051_2060.txt 
load -ascii Pd_70_2051_2060.txt 
load -ascii Pd_85_2051_2060.txt

load -ascii Td_26_91_100.txt
load -ascii Td_70_91_100.txt
load -ascii Td_85_91_100.txt

load -ascii Pd_26_91_100.txt 
load -ascii Pd_70_91_100.txt 
load -ascii Pd_85_91_100.txt

load -ascii Tobs.txt
load -ascii Pobs.txt

load -ascii tasH_2001_2010_Muzza_sb.txt 
load -ascii tas85_2091_2100_Muzza_sb.txt 
load -ascii prH_2001_2010_Muzza_sb.txt
load -ascii pr85_2091_2100_Muzza_sb.txt 
load -ascii tas70_2091_2100_Muzza_sb.txt 
load -ascii pr70_2091_2100_Muzza_sb.txt 
load -ascii tas26_2091_2100_Muzza_sb.txt 
load -ascii pr26_2091_2100_Muzza_sb.txt 
load -ascii tas70_2051_2060_Muzza_sb.txt
load -ascii pr70_2051_2060_Muzza_sb.txt 
load -ascii tas26_2051_2060_Muzza_sb.txt
load -ascii pr26_2051_2060_Muzza_sb.txt 
load -ascii tas85_2051_2060_Muzza_sb.txt 
load -ascii pr85_2051_2060_Muzza_sb.txt

%% comparison of trajectories pre/post downscaling
T26_2051_2060_m = moving_average( tas26_2051_2060_Muzza_sb, 365, 15 ) ; 
T26d_2051_2060_m = moving_average( Td_26_2051_2060, 365, 15 ) ; 

T70_2051_2060_m = moving_average( tas70_2051_2060_Muzza_sb, 365, 15 ) ; 
T70d_2051_2060_m = moving_average( Td_70_2051_2060, 365, 15 ) ;

T85_2051_2060_m = moving_average( tas85_2051_2060_Muzza_sb, 365, 15 ) ; 
T85d_2051_2060_m = moving_average( Td_85_2051_2060, 365, 15 ) ;

T26_2091_2100_m = moving_average( tas26_2091_2100_Muzza_sb, 365, 15 ) ; 
T26d_2091_2100_m = moving_average( Td_26_91_100, 365, 15 ) ; 

T70_2091_2100_m = moving_average( tas70_2091_2100_Muzza_sb, 365, 15 ) ; 
T70d_2091_2100_m = moving_average( Td_70_91_100, 365, 15 ) ;

T85_2091_2100_m = moving_average( tas85_2091_2100_Muzza_sb, 365, 15 ) ; 
T85d_2091_2100_m = moving_average( Td_85_91_100, 365, 15 ) ;

Tctrl_m = moving_average( tasH_2001_2010_Muzza_sb, 365,15);
Tobs_m = moving_average( Tobs, 365,15);

figure; 
plot( [Tobs_m, Tctrl_m, T26_2051_2060_m, T26d_2051_2060_m] ) ;
axis([1 365 0 35]); title('Temperature in 2051-2060- SSP1-2.6'); ylabel('Temperature [°C]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');
figure; 
plot( [Tobs_m, Tctrl_m, T70_2051_2060_m, T70d_2051_2060_m] ) ;
axis([1 365 0 35]); title('Temperature in 2051-2060 - SSP3-7.0'); ylabel('Temperature [°C]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');
figure; 
plot( [Tobs_m, Tctrl_m, T85_2051_2060_m, T85d_2051_2060_m] ) ;
axis([1 365 0 35]); title('Temperature in 2051-2060 - SSP5-8.5'); ylabel('Temperature [°C]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');

figure; 
plot( [Tobs_m, Tctrl_m, T26_2091_2100_m, T26d_2091_2100_m] ) ;
axis([1 365 0 35]); title('Temperature in 2091-2100 - SSP1-2.6'); ylabel('Temperature [°C]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');
figure; 
plot( [Tobs_m, Tctrl_m, T70_2091_2100_m, T70d_2091_2100_m] ) ;
axis([1 365 0 35]); title('Temperature in 2091-2100 - SSP3-7.0'); ylabel(' Temperature [°C]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');
figure; 
plot( [Tobs_m, Tctrl_m, T85_2091_2100_m, T85d_2091_2100_m] ) ;
axis([1 365 0 35]); title('Temperature in 2091-2100 - SSP5-8.5'); ylabel('Temperature [°C]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');

P26_2051_2060_m = moving_average( pr26_2051_2060_Muzza_sb, 365, 15 ) ; 
P26d_2051_2060_m = moving_average( Pd_26_2051_2060, 365, 15 ) ; 

P70_2051_2060_m = moving_average( pr70_2051_2060_Muzza_sb, 365, 15 ) ; 
P70d_2051_2060_m = moving_average( Pd_70_2051_2060, 365, 15 ) ;

P85_2051_2060_m = moving_average( pr85_2051_2060_Muzza_sb, 365, 15 ) ; 
P85d_2051_2060_m = moving_average( Pd_85_2051_2060, 365, 15 ) ;

P26_2091_2100_m = moving_average( pr26_2091_2100_Muzza_sb, 365, 15 ) ; 
P26d_2091_2100_m = moving_average( Pd_26_91_100, 365, 15 ) ; 

P70_2091_2100_m = moving_average( pr70_2091_2100_Muzza_sb, 365, 15 ) ; 
P70d_2091_2100_m = moving_average( Pd_70_91_100, 365, 15 ) ;

P85_2091_2100_m = moving_average( pr85_2091_2100_Muzza_sb, 365, 15 ) ; 
P85d_2091_2100_m = moving_average( Pd_85_91_100, 365, 15 ) ;

Pctrl_m = moving_average( prH_2001_2010_Muzza_sb, 365,15);
Pobs_m = moving_average( Pobs, 365,15);

figure; 
plot( [Pobs_m, Pctrl_m, P26_2051_2060_m, P26d_2051_2060_m] ) ;
axis([1 365 0 10]); title('Precipitation in 2051-2060 - SSP1-2.6'); ylabel('Precipitation [mm/d]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');
figure; 
plot( [Pobs_m, Pctrl_m, P70_2051_2060_m, P70d_2051_2060_m] ) ;
axis([1 365 0 10]); title('Precipitation in 2051-2060 - SSP3-7.0'); ylabel('Precipitation [mm/d]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');
figure; 
plot( [Pobs_m, Pctrl_m, P85_2051_2060_m, P85d_2051_2060_m] ) ;
axis([1 365 0 10]); title('Precipitation in 2051-2060 - SSP5-8.5'); ylabel('Precipitation [mm/d]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');

figure; 
plot( [Pobs_m, Pctrl_m, P26_2091_2100_m, P26d_2091_2100_m] ) ;
axis([1 365 0 10]); title('Precipitation in 2091-2100 - SSP1-2.6'); ylabel('Precipitation [mm/d]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');
figure; 
plot( [Pobs_m, Pctrl_m, P70_2091_2100_m, P70d_2091_2100_m] ) ;
axis([1 365 0 10]); title('Precipitation in 2091-2100 - SSP3-7.0'); ylabel('Precipitation [mm/d]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');
figure; 
plot( [Pobs_m, Pctrl_m, P85_2091_2100_m, P85d_2091_2100_m] ) ;
axis([1 365 0 10]); title('Precipitation in 2091-2100 - SSP5-8.5'); ylabel('Precipitation [mm/d]')
legend('observation', 'ctrl', 'pre-downscaling', 'after-downscaling');

%% run the model under historical and projected conditions
addpath('model\')
cellIdx = 720 ; 
crop = 13 ; % [10 11 13 14 15] ;

% yield dal 2001 al 2007
T= zeros(365,7);
P= zeros(365,7);
Y= zeros(1,7);
a=1;
b=365;
for i= 1:7
    T(:,i) = Tobs(a:b);
    P(:,i) = Pobs(a:b);
    Y(i) = simulation_script_curr(crop, cellIdx, T(:,i), P(:,i));
    a=a+365;
    b=b+365;
end

Y_01_07_medio= mean(Y);

% yield scenario 26 2051-2060
T_26_51_60= zeros(365,10);
P_26_51_60= zeros(365,10);
Y_26_51_60= zeros(1,10);
a=1;
b=365;
for i= 1:10
    T_26_51_60(:,i) = Td_26_2051_2060(a:b);
    P_26_51_60(:,i) = Pd_26_2051_2060(a:b);
    Y_26_51_60(i) = simulation_script_curr(crop, cellIdx, T_26_51_60(:,i), P_26_51_60(:,i));
    a=a+365;
    b=b+365;
end

Y_26_51_60_medio= mean(Y_26_51_60);

% yield scenario 70 2051-2060
T_70_51_60= zeros(365,10);
P_70_51_60= zeros(365,10);
Y_70_51_60= zeros(1,10);
a=1;
b=365;
for i= 1:10
    T_70_51_60(:,i) = Td_70_2051_2060(a:b);
    P_70_51_60(:,i) = Pd_70_2051_2060(a:b);
    Y_70_51_60(i) = simulation_script_curr(crop, cellIdx, T_70_51_60(:,i), P_70_51_60(:,i));
    a=a+365;
    b=b+365;
end

Y_70_51_60_medio= mean(Y_70_51_60);

% yield scenario 85 2051-2060
T_85_51_60= zeros(365,10);
P_85_51_60= zeros(365,10);
Y_85_51_60= zeros(1,10);
a=1;
b=365;
for i= 1:10
    T_85_51_60(:,i) = Td_85_2051_2060(a:b);
    P_85_51_60(:,i) = Pd_85_2051_2060(a:b);
    Y_85_51_60(i) = simulation_script_curr(crop, cellIdx, T_85_51_60(:,i), P_85_51_60(:,i));
    a=a+365;
    b=b+365;
end

Y_85_51_60_medio= mean(Y_85_51_60);


% yield scenario 26 2091-2100
T_26_91_100= zeros(365,10);
P_26_91_100= zeros(365,10);
Y_26_91_100= zeros(1,10);
a=1;
b=365;
for i= 1:10
    T_26_91_100(:,i) = Td_26_91_100(a:b);
    P_26_91_100(:,i) = Pd_26_91_100(a:b);
    Y_26_91_100(i) = simulation_script_curr(crop, cellIdx, T_26_91_100(:,i), P_26_91_100(:,i));
    a=a+365;
    b=b+365;
end

Y_26_91_100_medio= mean(Y_26_91_100);

% yield scenario 70 2091-2100
T_70_91_100= zeros(365,10);
P_70_91_100= zeros(365,10);
Y_70_91_100= zeros(1,10);
a=1;
b=365;
for i= 1:10
    T_70_91_100(:,i) = Td_70_91_100(a:b);
    P_70_91_100(:,i) = Pd_70_91_100(a:b);
    Y_70_91_100(i) = simulation_script_curr(crop, cellIdx, T_70_91_100(:,i), P_70_91_100(:,i));
    a=a+365;
    b=b+365;
end

Y_70_91_100_medio= mean(Y_70_91_100);

% yield scenario 85 2091-2100
T_85_91_100= zeros(365,10);
P_85_91_100= zeros(365,10);
Y_85_91_100= zeros(1,10);
a=1;
b=365;
for i= 1:10
    T_85_91_100(:,i) = Td_85_91_100(a:b);
    P_85_91_100(:,i) = Pd_85_91_100(a:b);
    Y_85_91_100(i) = simulation_script_curr(crop, cellIdx, T_85_91_100(:,i), P_85_91_100(:,i));
    a=a+365;
    b=b+365;
end

Y_85_91_100_medio= mean(Y_85_91_100);

histYears=[2051:2060];
figure; plot( histYears, Y_85_51_60, '.-'); title('Annual yield'); ylabel(' Annual yield of maize [kg/year]'); grid on;

histYears=[2091:2100];
figure; plot( histYears, Y_85_91_100, '.-'); title('Annual yield'); ylabel(' Annual yield of maize [kg/year]'); grid on;


delta_26_2051_2060 = (Y_01_07_medio- Y_26_51_60_medio)/ Y_01_07_medio;
delta_70_2051_2060 = (Y_01_07_medio- Y_70_51_60_medio)/ Y_01_07_medio;
delta_85_2051_2060 = (Y_01_07_medio- Y_85_51_60_medio)/ Y_01_07_medio;

delta_26_2091_2100 = (Y_01_07_medio- Y_26_91_100_medio)/ Y_01_07_medio;
delta_70_2091_2100 = (Y_01_07_medio- Y_70_91_100_medio)/ Y_01_07_medio;
delta_85_2091_2100 = (Y_01_07_medio- Y_85_91_100_medio)/ Y_01_07_medio;

% visualize results: yield and associated climatic conditions
figure; 
subplot(131); bar([Y_01_07_medio Y_26_51_60_medio]); title('Average annual yield - SSP1-2.6'); ylabel(' Average annual yield of maize [kg/year]'); set(gca, 'XTickLabel',{'2001-2007','2051-2060'});
subplot(132); plot([Tobs_m,T26d_2051_2060_m] ); title('Temperature - SSP1-2.6'); ylabel(' Temperature [°C]');
axis([1 365 0 35]); legend('2001-2007', '2051-2060'); grid on;
subplot(133); plot([Pobs_m, P26d_2051_2060_m]); title('Precipitation- SSP1-2.6'); ylabel('Precipitation [mm/d]');
axis([1 365 0 10]); grid on;
legend('2001-2007', '2051-2060')

figure; 
subplot(131); bar([Y_01_07_medio Y_26_91_100_medio]); title('Average annual yield - SSP1-2.6'); ylabel(' Average annual yield of maize [kg/year]'); set(gca, 'XTickLabel',{'2001-2007','2091-2100'});
subplot(132); plot([Tobs_m,T26d_2091_2100_m] ); title('Temperature - SSP1-2.6'); ylabel(' Temperature [°C]');
axis([1 365 0 35]); legend('2001-2007', '2091-2100'); grid on;
subplot(133); plot([Pobs_m, P26d_2091_2100_m]); title('Precipitation- SSP1-2.6'); ylabel('Precipitation [mm/d]');
axis([1 365 0 10]); grid on;
legend('2001-2007', '2091-2100')

figure; 
subplot(131); bar([Y_01_07_medio Y_70_51_60_medio]); title('Average annual yield - SSP3-7.0'); ylabel(' Average annual yield of maize [kg/year]'); set(gca, 'XTickLabel',{'2001-2007','2051-2060'});
subplot(132); plot([Tobs_m,T70d_2051_2060_m] ); title('Temperature - SSP3-7.0'); ylabel(' Temperature [°C]');
axis([1 365 0 35]); legend('2001-2007', '2051-2060');grid on;
subplot(133); plot([Pobs_m, P70d_2051_2060_m]); title('Precipitation- SSP3-7.0'); ylabel('Precipitation [mm/d]');
axis([1 365 0 10]); grid on;
legend('2001-2007', '2051-2060')

figure; 
subplot(131); bar([Y_01_07_medio Y_70_91_100_medio]); title('Average annual yield - SSP3-7.0'); ylabel(' Average annual yield of maize [kg/year]'); set(gca, 'XTickLabel',{'2001-2007','2091-2100'});
subplot(132); plot([Tobs_m,T70d_2091_2100_m] );  title('Temperature - SSP3-7.0'); ylabel(' Temperature [°C]');
axis([1 365 0 35]); legend('2001-2007', '2091-2100'); grid on;
subplot(133); plot([Pobs_m, P70d_2091_2100_m]); title('Precipitation- SSP3-7.0'); ylabel('Precipitation [mm/d]');
axis([1 365 0 10]); grid on;
legend('2001-2007', '2091-2100')

figure; 
subplot(131); bar([Y_01_07_medio Y_85_51_60_medio]); title('Average annual yield - SSP5-8.5'); ylabel(' Average annual yield of maize [kg/year]'); set(gca, 'XTickLabel',{'2001-2007','2051-2060'});
subplot(132); plot([Tobs_m,T85d_2051_2060_m] ); title('Temperature - SSP5-8.5'); ylabel(' Temperature [°C]');
axis([1 365 0 35]); legend('2001-2007', '2051-2060'); grid on;
subplot(133); plot([Pobs_m, P85d_2051_2060_m]); title('Precipitation- SSP5-8.5'); ylabel('Precipitation [mm/d]');
axis([1 365 0 10]); grid on;
legend('2001-2007', '2051-2060')

figure; 
subplot(131); bar([Y_01_07_medio Y_85_91_100_medio]); title('Average annual yield - SSP5-8.5'); ylabel(' Average annual yield of maize [kg/year]'); set(gca, 'XTickLabel',{'2001-2007','2091-2100'});
subplot(132); plot([Tobs_m,T85d_2091_2100_m] ); title('Temperature - SSP5-8.5'); ylabel(' Temperature [°C]');
axis([1 365 0 35]); legend('2001-2007', '2091-2100'); grid on;
subplot(133); plot([Pobs_m, P85d_2091_2100_m]); title('Precipitation- SSP5-8.5'); ylabel('Precipitation [mm/d]');
axis([1 365 0 10]); grid on;
legend('2001-2007', '2091-2100')

%barplot per confrontare tutti yield medi annuali insieme per i diversi
%scenari
figure;
bar([Y_01_07_medio Y_26_51_60_medio Y_70_51_60_medio Y_85_51_60_medio; Y_01_07_medio Y_26_91_100_medio Y_70_91_100_medio Y_85_91_100_medio ]); title ('Average annual yield comparison'); ylabel(' Average annual yield of maize [kg/year]'); set(gca, 'XTickLabel',{'Historical vs 2051-2060','Historical vs 2091-2100'});
legend('Historical', 'SSP1-2.6', 'SSP3-7.0', 'SSP5-8.5')
%% script for the generation of the exposure space for the bottom-up
% assessment of climate change vulnerabilities of the Muzza district.

% analyze hystorical climate and yield
addpath('model');
% load historical observations of temperature and precipitation
myCell = 720 ; 
histYears = [1993:2007]; % we can use the full dataset here
[Tobs, Pobs] = getMeteo(histYears, myCell);

% simulated yield over history
myCrop = 13; % maize
Ny = length(Tobs) / 365;
TH = reshape(Tobs, 365, Ny);
PH = reshape(Pobs, 365, Ny);
YH = nan(Ny,1);
for i = 1:Ny
    YH(i) = simulation_script_curr(myCrop, myCell, TH(:,i), PH(:,i) );
end
figure; plot( histYears, YH, '.-'); title('annual yield'); ylabel(' Annual yield of maize [kg/year]'); grid on;

%annual yield over 2091-2100
myCrop = 13; % maize
myCell = 720;
histYears=[2091:2100];
Ny = length(tas85_2091_2100_Muzza_sb) / 365;
TH = reshape(tas85_2091_2100_Muzza_sb, 365, Ny);
PH = reshape(pr85_2091_2100_Muzza_sb, 365, Ny);
YH = nan(Ny,1);
for i = 1:Ny
    YH(i) = simulation_script_curr(myCrop, myCell, TH(:,i), PH(:,i) );
end
figure; plot( histYears, YH, '.-'); title('Annual yield'); ylabel(' Annual yield of maize [kg/year]'); grid on;

histYears=[2051:2060];
Ny = length(tas85_2051_2060_Muzza_sb) / 365;
TH = reshape(tas85_2051_2060_Muzza_sb, 365, Ny);
PH = reshape(pr85_2051_2060_Muzza_sb, 365, Ny);

%% analysis of historical climate and model performance

% annual mean 
figure;
subplot(211); plot( histYears, mean( TH ), '.-' ); title('Mean annual temperature');
ylabel('Temperature [°C]'); grid on;
subplot(212); plot( histYears, mean( PH ), '.-' ); title('Mean annual precipitation');
ylabel('Precipitation [mm/d]'); grid on; xlabel('years');

% cyclostationary average
figure; subplot(211);
for i = 1:Ny
hold on; plot( moving_average( TH(:,i), 365, 5 ), 'k--' );
end
hold on; plot( moving_average( Tobs, 365, 5 ), 'r-', 'LineWidth', 2);
ylabel('°C'); grid on; title('temperature');
subplot(212);
for i = 1:Ny
hold on; plot( moving_average( PH(:,i), 365, 5 ), 'k--' );
end
hold on; plot( moving_average( Pobs, 365, 5 ), 'r-', 'LineWidth', 2);
ylabel('mm/d'); grid on; title('precipitation'); xlabel('days');

% box-plot
figure; 
subplot(211); boxplot(TH,histYears); title('temperature'); ylabel('°C');
subplot(212); boxplot(PH,histYears); title('precipitation'); ylabel('mm/d');

% selection of failure threshold
Yfailure = YH(end-2) ; % yield of 2005 selected as critical

%% additive perturbation 
[T2001, P2001] = getMeteo(2001, myCell);
dT_add = [-2:1:8]; nT = length(dT_add)
dP_add = [-10:2:10]; nP = length(dP_add)

% temp scenarios
TTadd = nan(365,nT) ;
for i = 1:nT
   TTadd(:,i) = T2001 + dT_add(i) ;
end
figure; plot(TTadd, 'LineWidth', 1);
TTadd_m = mean(TTadd)
TTadd_s = std(TTadd)

% precip scenarios
PPadd = nan(365,nP) ;
for i = 1:nP
   PPadd(:,i) = P2001 + dP_add(i) ;
end
figure; plot(PPadd, 'LineWidth', 1);
% remove negative values
PPadd( PPadd<0 ) = 0;  
figure; plot(PPadd, 'LineWidth', 1);
PPadd_m = mean(PPadd)
PPadd_s = std(PPadd)
Ndry = sum( PPadd == 0 )

% stress test
YYadd = nan(nP,nT) ;
for i = 1:nP
    for j = 1:nT
        YYadd (i,j) = simulation_script_curr(myCrop, myCell, TTadd(:,j), PPadd(:,i) );
    end
end

FB = plotExposureSpace( YYadd, dT_add, dP_add, Yfailure, 'DT', 'DP' )

%% multiplicative perturbation
dT_m = [0.7:0.06:1.3]; nT = length(dT_m)
dP_m = [0.7:0.06:1.3]; nP = length(dP_m)

% temp scenarios
TTm = nan(365,nT) ;
for i = 1:nT
   TTm(:,i) = T2001 * dT_m(i) ;
end
figure; plot(TTm, 'LineWidth', 2);
TTm_m = mean(TTm)
TTm_s = std(TTm)

% precip scenarios
PPm = nan(365,nP) ;
for i = 1:nP
   PPm(:,i) = P2001 * dP_m(i) ;
end
figure; plot(PPm, 'LineWidth', 2);
% remove negative values
% PPadd( PPadd<0 ) = 0;  % not necessary here
%figure; plot(PPadd, 'LineWidth', 2);
PPm_m = mean(PPm)
PPm_s = std(PPm)
Ndry = sum( PPm == 0 )

% stress test
YYm = nan(nP,nT) ;
for i = 1:nP
    for j = 1:nT
        YYm (i,j) = simulation_script_curr(myCrop, myCell, TTm(:,j), PPm(:,i) );
    end
end

FB = plotExposureSpace( YYm, dT_m, dP_m, Yfailure, 'DT', 'DP' )

%% mixed ensemble
nP = length( dP_m ) % multipl. precip
nT = length( dT_add ) % additive temp
YYmx = nan(nP,nT) ;
for i = 1:nP
    for j = 1:nT
        YYmx(i,j) = simulation_script_curr(myCrop, myCell, TTadd(:,j), PPm(:,i) );
    end
end
FB = plotExposureSpace( YYmx, dT_add, dP_m, Yfailure, 'DT', 'DP' )

% number of failures
f_add = 1 - sum(FBadd(:))/length(FBadd(:))
f_m = 1 - sum(FBm(:))/length(FBm(:))
f_mx = 1 - sum(FBmx(:))/length(FBmx(:))

%% from yield to revenue
RR = yield_to_revenue( YYmx, myCrop );
Rf = yield_to_revenue( Yfailure, myCrop )
FBr = plotExposureSpace( RR, dT_add, dP_m, Rf, 'DT', 'DP');


%% adaptive capacity

% simulation of alternative crops (rice = crop code 15) 
testCrop = 15 ; 
YY_15 = nan(nP,nT) ;
for i = 1:nP
    for j = 1:nT
        YY_15(i,j) = simulation_script_curr(testCrop, myCell, TTadd(:,j), PPm(:,i) );
    end
end
RR_15 = yield_to_revenue( YY_15, 15 ) ;

F15 = plotExposureSpace( RR_15, dT_add, dP_m, Rf, 'DT', 'DP' ); title('RICE');  % matrix F15 will specify the failure scenarios of rice
F13 = plotExposureSpace( RR, dT_add, dP_m, Rf, 'DT', 'DP' ); title('MAIZE');    % matrix F13 will specify the failure scenarios of maize

% adaptation for failures of maize only
RR_15a = RR ;
for i = 1:nP
    for j = 1:nT
        if F13(i,j) > 0 % need adaptation
            if F15(i,j) == 0 % rice is safe -> switch
                RR_15a(i,j) = RR_15(i,j) ;
            end
        end
    end
end
F15a = plotExposureSpace( RR_15a, dT_add, dP_m, Rf, 'DT', 'DP' ); title('MAIZE+RICE')

% benefit of adaptation
deltaF = F13 - F15a ;

figure; colormap(gray); % white pixels indicate scenarios with crop switch
imagesc( dT_add, dP_m, deltaF); set(gca,'YDir', 'normal')
xlabel('DT'); ylabel('DP');

% simulation of alternative crops (soybean = crop code 14) 
testCrop = 14 ; 
YY_14 = nan(nP,nT) ;
for i = 1:nP
    for j = 1:nT
        YY_14(i,j) = simulation_script_curr(testCrop, myCell, TTadd(:,j), PPm(:,i) );
    end
end
RR_14 = yield_to_revenue( YY_14, 14 ) ;

F14 = plotExposureSpace( RR_14, dT_add, dP_m, Rf, 'DT', 'DP' ); title('SOYBEAN');  % matrix F14 will specify the failure scenarios of soybean
F13 = plotExposureSpace( RR, dT_add, dP_m, Rf, 'DT', 'DP' ); title('MAIZE');    % matrix F13 will specify the failure scenarios of maize

% adaptation for failures of maize only
RR_14a = RR ;
for i = 1:nP
    for j = 1:nT
        if F13(i,j) > 0 % need adaptation
            if F14(i,j) == 0 % rice is safe -> switch
                RR_14a(i,j) = RR_14(i,j) ;
            end
        end
    end
end
F14a = plotExposureSpace( RR_14a, dT_add, dP_m, Rf, 'DT', 'DP' ); title('MAIZE+SOYBEAN')

% benefit of adaptation
deltaF = F13 - F14a ;

figure; colormap(gray); % white pixels indicate scenarios with crop switch
imagesc( dT_add, dP_m, deltaF); set(gca,'YDir', 'normal')
xlabel('DT'); ylabel('DP');

% simulation of alternative crops (tomato = crop code 10) 
testCrop = 10 ; 
YY_10 = nan(nP,nT) ;
for i = 1:nP
    for j = 1:nT
        YY_10(i,j) = simulation_script_curr(testCrop, myCell, TTadd(:,j), PPm(:,i) );
    end
end
RR_10 = yield_to_revenue( YY_10, 10 ) ;

F10 = plotExposureSpace( RR_10, dT_add, dP_m, Rf, 'DT', 'DP' ); title('TOMATO');  % matrix F15 will specify the failure scenarios of tomato
F13 = plotExposureSpace( RR, dT_add, dP_m, Rf, 'DT', 'DP' ); title('MAIZE');    % matrix F13 will specify the failure scenarios of maize

% adaptation for failures of maize only
RR_10a = RR ;
for i = 1:nP
    for j = 1:nT
        if F13(i,j) > 0 % need adaptation
            if F10(i,j) == 0 % rice is safe -> switch
                RR_10a(i,j) = RR_10(i,j) ;
            end
        end
    end
end
F10a = plotExposureSpace( RR_10a, dT_add, dP_m, Rf, 'DT', 'DP' ); title('MAIZE+TOMATO')

% benefit of adaptation
deltaF = F13 - F10a ;

figure; colormap(gray); % white pixels indicate scenarios with crop switch
imagesc( dT_add, dP_m, deltaF); set(gca,'YDir', 'normal')
xlabel('DT'); ylabel('DP');

% simulation of alternative crops (grass = crop code 11) 
testCrop = 11 ; 
YY_11 = nan(nP,nT) ;
for i = 1:nP
    for j = 1:nT
        YY_11(i,j) = simulation_script_curr(testCrop, myCell, TTadd(:,j), PPm(:,i) );
    end
end
RR_11 = yield_to_revenue( YY_11, 11 ) ;

F11 = plotExposureSpace( RR_11, dT_add, dP_m, Rf, 'DT', 'DP' ); title('GRASS');  % matrix F11 will specify the failure scenarios of grass
F13 = plotExposureSpace( RR, dT_add, dP_m, Rf, 'DT', 'DP' ); title('MAIZE');    % matrix F13 will specify the failure scenarios of maize

% adaptation for failures of maize only
RR_11a = RR ;
for i = 1:nP
    for j = 1:nT
        if F13(i,j) > 0 % need adaptation
            if F10(i,j) == 0 % grass is safe -> switch
                RR_11a(i,j) = RR_11(i,j) ;
            end
        end
    end
end
F11a = plotExposureSpace( RR_11a, dT_add, dP_m, Rf, 'DT', 'DP' ); title('MAIZE+GRASS')

% benefit of adaptation
deltaF = F13 - F11a ;

figure; colormap(gray); % white pixels indicate scenarios with crop switch
imagesc( dT_add, dP_m, deltaF); set(gca,'YDir', 'normal')
xlabel('DT'); ylabel('DP');

%% overlay IPCC scenarios
addpath ('Scenari dopo downscaling\')

load -ascii Td_26_2051_2060.txt
load -ascii Td_70_2051_2060.txt
load -ascii Td_85_2051_2060.txt

load -ascii Pd_26_2051_2060.txt 
load -ascii Pd_70_2051_2060.txt 
load -ascii Pd_85_2051_2060.txt

load -ascii Td_26_91_100.txt
load -ascii Td_70_91_100.txt
load -ascii Td_85_91_100.txt

load -ascii Pd_26_91_100.txt 
load -ascii Pd_70_91_100.txt 
load -ascii Pd_85_91_100.txt

T_26_51_60_IPCC = reshape(Td_26_2051_2060, 365, 10);
T_70_51_60_IPCC = reshape(Td_70_2051_2060, 365, 10);
T_85_51_60_IPCC = reshape(Td_85_2051_2060, 365, 10);
T_26_91_100_IPCC = reshape(Td_26_91_100, 365, 10);
T_70_91_100_IPCC = reshape(Td_70_91_100, 365, 10);
T_85_91_100_IPCC = reshape(Td_85_91_100, 365, 10);

P_26_51_60_IPCC = reshape(Pd_26_2051_2060, 365, 10);
P_70_51_60_IPCC = reshape(Pd_70_2051_2060, 365, 10);
P_85_51_60_IPCC = reshape(Pd_85_2051_2060, 365, 10);
P_26_91_100_IPCC = reshape(Pd_26_91_100, 365, 10);
P_70_91_100_IPCC = reshape(Pd_70_91_100, 365, 10);
P_85_91_100_IPCC = reshape(Pd_85_91_100, 365, 10);

% annual mean 
figure; 
subplot(211); plot( T2001, 'k-' ); ylabel('temperature (°C)')
hold on; plot( T_26_51_60_IPCC, 'r-'); axis([1 365 -10 40]); 
hold on; plot( T_70_51_60_IPCC, 'c-'); axis([1 365 -10 40]); 
hold on; plot( T_85_51_60_IPCC, 'g-'); axis([1 365 -10 40]); 
hold on; plot( T_26_91_100_IPCC, 'm-'); axis([1 365 -10 40]); 
hold on; plot( T_70_91_100_IPCC, 'b-'); axis([1 365 -10 40]); 
hold on; plot( T_85_91_100_IPCC, 'y-'); axis([1 365 -10 40]); 
legend('history','scenario 26 2051-2060 IPCC','scenario 70 2051-2060 IPCC', 'scenario 85 2051-2060 IPCC','scenario 26 2051-2060 IPCC','scenario 70 2051-2060 IPCC','scenario 85 2051-2060 IPCC')
subplot(212); plot( P2001, 'k-' ); ylabel('precipitation (mm/d)')
hold on; plot( P_26_51_60_IPCC, 'r-'); axis([1 365 0 140]);
hold on; plot( P_70_51_60_IPCC, 'c-'); axis([1 365 0 140]); 
hold on; plot( P_85_51_60_IPCC, 'g-'); axis([1 365 0 140]); 
hold on; plot( P_26_91_100_IPCC, 'm-'); axis([1 365 0 140]); 
hold on; plot( P_70_91_100_IPCC, 'b-'); axis([1 365 0 140]); 
hold on; plot( P_85_91_100_IPCC, 'y-'); axis([1 365 0 140]); 
legend('history','scenario 26 2051-2060 IPCC','scenario 70 2051-2060 IPCC', 'scenario 85 2051-2060 IPCC','scenario 26 2051-2060 IPCC','scenario 70 2051-2060 IPCC','scenario 85 2051-2060 IPCC')

% average change of the last decade 
DT_26_51_60 = mean(Td_26_2051_2060) - mean(T2001)
DT_70_51_60 = mean(Td_70_2051_2060) - mean(T2001)
DT_85_51_60 = mean(Td_85_2051_2060) - mean(T2001)
DT_26_91_100 = mean(Td_26_91_100) - mean(T2001)
DT_70_91_100 = mean(Td_70_91_100) - mean(T2001)
DT_85_91_100 = mean(Td_85_91_100) - mean(T2001)
DP_26_51_60 = mean(Pd_26_2051_2060) / mean(P2001)
DP_70_51_60 = mean(Pd_70_2051_2060) / mean(P2001)
DP_85_51_60 = mean(Pd_85_2051_2060) / mean(P2001)
DP_26_91_100 = mean(Pd_26_91_100) / mean(P2001)
DP_70_91_100 = mean(Pd_70_91_100) / mean(P2001)
DP_85_91_100 = mean(Pd_85_91_100) / mean(P2001)

% plot on the original exposure space of maize 
plotExposureSpace( RR, dT_add, dP_m, Rf, 'DT', 'DP' ); title('MAIZE');
hold on; plot( DT_26_51_60, DP_26_51_60, 'k*', 'MarkerSize', 15 )
hold on; plot( DT_70_51_60, DP_70_51_60, 'r*', 'MarkerSize', 15 )
hold on; plot( DT_85_51_60, DP_85_51_60, 'm*', 'MarkerSize', 15 )
hold on; plot( DT_26_91_100, DP_26_91_100, 'k^', 'MarkerSize', 15 )
hold on; plot( DT_70_91_100, DP_70_91_100, 'r^', 'MarkerSize', 15 )
hold on; plot( DT_85_91_100, DP_85_91_100, 'm^', 'MarkerSize', 15 )
%plot maize+grass
plotExposureSpace( RR_11a, dT_add, dP_m, Rf, 'DT', 'DP' ); title('MAIZE+GRASS');
hold on; plot( DT_26_51_60, DP_26_51_60, 'k*', 'MarkerSize', 15 )
hold on; plot( DT_70_51_60, DP_70_51_60, 'r*', 'MarkerSize', 15 )
hold on; plot( DT_85_51_60, DP_85_51_60, 'm*', 'MarkerSize', 15 )
hold on; plot( DT_26_91_100, DP_26_91_100, 'k^', 'MarkerSize', 15 )
hold on; plot( DT_70_91_100, DP_70_91_100, 'r^', 'MarkerSize', 15 )
hold on; plot( DT_85_91_100, DP_85_91_100, 'm^', 'MarkerSize', 15 )

