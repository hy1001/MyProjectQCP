function [output] = odefile(varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CellCycle
% Generated: 31-Aug-2016 09:21:04
% 
% [output] = odefile() => output = initial conditions in column vector
% [output] = odefile('states') => output = state names in cell-array
% [output] = odefile('algebraic') => output = algebraic variable names in cell-array
% [output] = odefile('parameters') => output = parameter names in cell-array
% [output] = odefile('parametervalues') => output = parameter values in column vector
% [output] = odefile('variablenames') => output = variable names in cell-array
% [output] = odefile('variableformulas') => output = variable formulas in cell-array
% [output] = odefile(time,statevector) => output = time derivatives in column vector
% 
% State names and ordering:
% 
% statevector(1): PYT
% statevector(2): PYTP
% statevector(3): MPF
% statevector(4): Cyclin
% statevector(5): YT
% statevector(6): Cdc25P
% statevector(7): Wee1
% statevector(8): APC_
% statevector(9): Cdc25
% statevector(10): Wee1P
% statevector(11): IEP
% statevector(12): IE
% statevector(13): APC
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global time
parameterValuesNew = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HANDLE VARIABLE INPUT ARGUMENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin == 0,
	% Return initial conditions of the state variables (and possibly algebraic variables)
	output = [0, 0, 0, 0, 0, 1, 0, 0, 0, 1, ...
		0, 1, 1];
	output = output(:);
	return
elseif nargin == 1,
	if strcmp(varargin{1},'states'),
		% Return state names in cell-array
		output = {'PYT', 'PYTP', 'MPF', 'Cyclin', 'YT', 'Cdc25P', 'Wee1', 'APC_', 'Cdc25', 'Wee1P', ...
			'IEP', 'IE', 'APC'};
	elseif strcmp(varargin{1},'algebraic'),
		% Return algebraic variable names in cell-array
		output = {};
	elseif strcmp(varargin{1},'parameters'),
		% Return parameter names in cell-array
		output = {'k3', 'k1', 'V25p', 'V25pp', 'trans4_Vweepp', 'trans4_Vweep', 'trans5_kcak', 'trans6_kpp', 'trans7_V25p', 'trans7_V25pp', ...
			'trans8_Vweepp', 'trans8_Vweep', 'trans9_kcak', 'trans10_kpp', 'trans12_V2p', 'trans12_V2pp', 'trans13_kf', 'trans13_Kf', 'trans15_ka', 'trans15_Ka', ...
			'trans16_kb', 'trans16_Kb', 'trans17_kg', 'trans17_Kg', 'trans18_kh', 'trans18_Kh', 'trans19_kd', 'trans19_Kd', 'trans20_kc', 'trans20_Kc', ...
			'trans21_V2p', 'trans21_V2pp', 'trans22_V2p', 'trans22_V2pp', 'trans11_V2p', 'trans11_V2pp', 'trans14_V2p', 'trans14_V2pp', 'trans23_ke', 'trans23_Ke', ...
			'Document'};
	elseif strcmp(varargin{1},'parametervalues'),
		% Return parameter values in column vector
		output = [0.5, 0.01, 0.017, 0.17, 1, 0.01, 0.64, 0.004, 0.017, 0.17, ...
			1, 0.01, 0.64, 0.004, 0.005, 0.25, 0.1, 1, 2, 0.1, ...
			0.1, 1, 2, 0.01, 0.15, 0.01, 0.13, 1, 0.13, 0.01, ...
			0.005, 0.25, 0.005, 0.25, 0.005, 0.25, 0.005, 0.25, 2, 0.1, ...
			1];
	elseif strcmp(varargin{1},'variablenames'),
		% Return variable names in cell-array
		output = {'Cdc2', 'AA'};
	elseif strcmp(varargin{1},'variableformulas'),
		% Return variable formulas in cell-array
		output = {'1', '1'};
	else
		error('Wrong input arguments! Please read the help text to the ODE file.');
	end
	output = output(:);
	return
elseif nargin == 2,
	time = varargin{1};
	statevector = varargin{2};
elseif nargin == 3,
	time = varargin{1};
	statevector = varargin{2};
	parameterValuesNew = varargin{3};
	if length(parameterValuesNew) ~= 41,
		parameterValuesNew = [];
	end
elseif nargin == 4,
	time = varargin{1};
	statevector = varargin{2};
	parameterValuesNew = varargin{4};
else
	error('Wrong input arguments! Please read the help text to the ODE file.');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STATES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PYT = statevector(1);
PYTP = statevector(2);
MPF = statevector(3);
Cyclin = statevector(4);
YT = statevector(5);
Cdc25P = statevector(6);
Wee1 = statevector(7);
APC_ = statevector(8);
Cdc25 = statevector(9);
Wee1P = statevector(10);
IEP = statevector(11);
IE = statevector(12);
APC = statevector(13);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isempty(parameterValuesNew),
	k3 = 0.5;
	k1 = 0.01;
	V25p = 0.017;
	V25pp = 0.17;
	trans4_Vweepp = 1;
	trans4_Vweep = 0.01;
	trans5_kcak = 0.64;
	trans6_kpp = 0.004;
	trans7_V25p = 0.017;
	trans7_V25pp = 0.17;
	trans8_Vweepp = 1;
	trans8_Vweep = 0.01;
	trans9_kcak = 0.64;
	trans10_kpp = 0.004;
	trans12_V2p = 0.005;
	trans12_V2pp = 0.25;
	trans13_kf = 0.1;
	trans13_Kf = 1;
	trans15_ka = 2;
	trans15_Ka = 0.1;
	trans16_kb = 0.1;
	trans16_Kb = 1;
	trans17_kg = 2;
	trans17_Kg = 0.01;
	trans18_kh = 0.15;
	trans18_Kh = 0.01;
	trans19_kd = 0.13;
	trans19_Kd = 1;
	trans20_kc = 0.13;
	trans20_Kc = 0.01;
	trans21_V2p = 0.005;
	trans21_V2pp = 0.25;
	trans22_V2p = 0.005;
	trans22_V2pp = 0.25;
	trans11_V2p = 0.005;
	trans11_V2pp = 0.25;
	trans14_V2p = 0.005;
	trans14_V2pp = 0.25;
	trans23_ke = 2;
	trans23_Ke = 0.1;
	Document = 1;
else
	k3 = parameterValuesNew(1);
	k1 = parameterValuesNew(2);
	V25p = parameterValuesNew(3);
	V25pp = parameterValuesNew(4);
	trans4_Vweepp = parameterValuesNew(5);
	trans4_Vweep = parameterValuesNew(6);
	trans5_kcak = parameterValuesNew(7);
	trans6_kpp = parameterValuesNew(8);
	trans7_V25p = parameterValuesNew(9);
	trans7_V25pp = parameterValuesNew(10);
	trans8_Vweepp = parameterValuesNew(11);
	trans8_Vweep = parameterValuesNew(12);
	trans9_kcak = parameterValuesNew(13);
	trans10_kpp = parameterValuesNew(14);
	trans12_V2p = parameterValuesNew(15);
	trans12_V2pp = parameterValuesNew(16);
	trans13_kf = parameterValuesNew(17);
	trans13_Kf = parameterValuesNew(18);
	trans15_ka = parameterValuesNew(19);
	trans15_Ka = parameterValuesNew(20);
	trans16_kb = parameterValuesNew(21);
	trans16_Kb = parameterValuesNew(22);
	trans17_kg = parameterValuesNew(23);
	trans17_Kg = parameterValuesNew(24);
	trans18_kh = parameterValuesNew(25);
	trans18_Kh = parameterValuesNew(26);
	trans19_kd = parameterValuesNew(27);
	trans19_Kd = parameterValuesNew(28);
	trans20_kc = parameterValuesNew(29);
	trans20_Kc = parameterValuesNew(30);
	trans21_V2p = parameterValuesNew(31);
	trans21_V2pp = parameterValuesNew(32);
	trans22_V2p = parameterValuesNew(33);
	trans22_V2pp = parameterValuesNew(34);
	trans11_V2p = parameterValuesNew(35);
	trans11_V2pp = parameterValuesNew(36);
	trans14_V2p = parameterValuesNew(37);
	trans14_V2pp = parameterValuesNew(38);
	trans23_ke = parameterValuesNew(39);
	trans23_Ke = parameterValuesNew(40);
	Document = parameterValuesNew(41);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VARIABLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cdc2 = 1;
AA = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REACTION KINETICS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trans1 = k3*Cyclin*Document;
trans2 = k1*Document;
trans3 = (V25p+Cdc25P*(V25pp-V25p))*PYT*Document;
trans4 = (trans4_Vweepp+(1-Wee1)*(trans4_Vweep-trans4_Vweepp))*YT*Document;
trans5 = trans5_kcak*PYT*Document;
trans6 = trans6_kpp*PYTP*Document;
trans7 = (trans7_V25p+Cdc25P*(trans7_V25pp-trans7_V25p))*PYTP*Document;
trans8 = (trans8_Vweepp+(1-Wee1)*(trans8_Vweep-trans8_Vweepp))*MPF*Document;
trans9 = trans9_kcak*YT*Document;
trans10 = trans10_kpp*MPF*Document;
trans12 = (trans12_V2p+APC_*(trans12_V2pp-trans12_V2p))*Cyclin*Document;
trans13 = trans13_kf*Wee1P/(trans13_Kf+Wee1P)*Document;
trans15 = trans15_ka*MPF*Cdc25/(trans15_Ka+Cdc25)*Document;
trans16 = trans16_kb*Cdc25P/(trans16_Kb+Cdc25P)*Document;
trans17 = trans17_kg*MPF*IE/(trans17_Kg+IE)*Document;
trans18 = trans18_kh*IEP/(trans18_Kh+IEP)*Document;
trans19 = trans19_kd*APC_/(trans19_Kd+APC_)*Document;
trans20 = trans20_kc*IEP*APC/(trans20_Kc+APC)*Document;
trans21 = (trans21_V2p+APC_*(trans21_V2pp-trans21_V2p))*MPF*Document;
trans22 = (trans22_V2p+APC_*(trans22_V2pp-trans22_V2p))*YT*Document;
trans11 = (trans11_V2p+APC_*(trans11_V2pp-trans11_V2p))*PYT*Document;
trans14 = (trans14_V2p+APC_*(trans14_V2pp-trans14_V2p))*PYTP*Document;
trans23 = trans23_ke*MPF*Wee1/(trans23_Ke+Wee1)*Document;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DIFFERENTIAL EQUATIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PYT_dot = -trans3+trans4-trans5+trans6-trans11;
PYTP_dot = +trans5-trans6-trans7+trans8-trans14;
MPF_dot = +trans7-trans8+trans9-trans10-trans21;
Cyclin_dot = -trans1+trans2-trans12;
YT_dot = +trans1+trans3-trans4-trans9+trans10-trans22;
Cdc25P_dot = +trans15-trans16;
Wee1_dot = +trans13-trans23;
APC__dot = -trans19+trans20;
Cdc25_dot = -trans15+trans16;
Wee1P_dot = -trans13+trans23;
IEP_dot = +trans17-trans18;
IE_dot = -trans17+trans18;
APC_dot = +trans19-trans20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RETURN VALUES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STATE ODEs
output(1) = PYT_dot;
output(2) = PYTP_dot;
output(3) = MPF_dot;
output(4) = Cyclin_dot;
output(5) = YT_dot;
output(6) = Cdc25P_dot;
output(7) = Wee1_dot;
output(8) = APC__dot;
output(9) = Cdc25_dot;
output(10) = Wee1P_dot;
output(11) = IEP_dot;
output(12) = IE_dot;
output(13) = APC_dot;
% return a column vector 
output = output(:);
return


