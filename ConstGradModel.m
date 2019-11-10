function [t1, x1, z1,L1,cos_alfa1] = ConstGradModel(cos_alfa0,c0,a,t,x,z)
%% ConstGradModel(cos_alfa0,c0,a,t,x,z)->constant grandient tracing model
sin_alfa0 = sqrt(1-cos_alfa0^2);
alfa0     = acos(cos_alfa0);        %�����������
P = cos_alfa0/c0;
IP = 1/P;
R = -IP/a;
if z < inf
    c1        = a*z + c0;
    cos_alfa1 = P*c1;    %��������������
    alfa1     = acos(cos_alfa1);    %����������
%   sin_alfa1 = sin(alfa1);         %��������������
    sin_alfa1 = sqrt(1-cos_alfa1^2);
    x1 = R*(sin_alfa1 - sin_alfa0);
    %x1 = z/tan((alfa0+alfa1)/2);                                                            %�����������ܵ�ˮƽ��������
    t1 = (log((1+sin_alfa0)/(1-sin_alfa0)) - log((1+sin_alfa1)/(1-sin_alfa1)))/(2*a);    %�������ܵĴ���ʱ������
%   t1 = abs(t1);           %��֤Ϊ���� 
    z1 = z;         %����ʵ�ʵ��������    
%   L1 = sqrt(x1^2+z1^2);  %�ڵ�i�������м����б�ߣ��ں��ʱ���ܲ�׼ȷ
    L1 = R*(alfa1-alfa0);    %��Ļ��εĳ���
    return;       
end
if x < inf
    tan0 = sin_alfa0/cos_alfa0;
    z=x*tan0;
    %c1=c0*(a*z+1);
    c1=c0+a*z;
    cos_alfa1 = P*c1;    %��������������
    alfa1 = acos(cos_alfa1);        %����������
%   sin_alfa1 = sin(alfa1);         %��������������
    sin_alfa1 = sqrt(1-cos_alfa1^2);
%   z1 = x*tan(alfa0);                               %��ʵ�ʴﵽ����������
    %z1 = (c1/c0 - 1)/a;                               %��ʵ�ʴﵽ����������
     z1=(c1-c0)/a;
    x1 = x;                     %��ʵ�ʴﵽ���ˮƽ��������
%   t1 = x/cos_alfa0/c0;
    %t1 = (log((1+sin_alfa0)/(1-sin_alfa0)) - log((1+sin_alfa1)/(1-sin_alfa1)))/(2*a*c0);    %�������ܵĴ���ʱ������
     t1 = (log((1+sin_alfa0)/(1-sin_alfa0)) - log((1+sin_alfa1)/(1-sin_alfa1)))/(2*a);
    t1 = abs(t1);           %��֤Ϊ���� 
%   L1 = x/cos((alfa0+alfa1)/2); 
    L1 = R*(alfa1-alfa0);    %��Ļ��εĳ���
end
if t < inf
%���ݶȵĵ�һ�������⣬��������ʱ�䣬�õ����z����ˮƽλ��x
    t1 = t;         %����ʵ�ʵ�ʱ������
   % A = log((1+sin_alfa0)/(1-sin_alfa0)) - 2*a*c0*t;
     A = log((1+sin_alfa0)/(1-sin_alfa0)) - 2*a*t;
    sin_alfa1 = (exp(A) - 1)/(exp(A) + 1);            %�����󵽴����������
    cos_alfa1 = sqrt(1-sin_alfa1^2);                          %�����󵽴����������
    alfa1 = acos(cos_alfa1);        %����������
    c1 = cos_alfa1/cos_alfa0*c0;                      %��ʵ�ʵ���������

    %z1 = (c1/c0 - 1)/a;                            %��ʵ�ʴﵽ����������
    z1=(c1-c0)/a;
%   x1 = z1*(cos_alfa0+cos_alfa1)/(sin_alfa0 + sin_alfa1);                %��ʵ�ʴﵽ���ˮƽ��������
    x1 = R*(sin_alfa1 - sin_alfa0);
%   L1 = z1/sin_alfa0; 
    L1 = R*(alfa1-alfa0);    %��Ļ��εĳ���
end