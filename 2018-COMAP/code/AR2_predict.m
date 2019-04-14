% Prediction method by AR2 and Daniel testing
function [fitting,pre_result,RE]=AR2_predict(input)

% input is row time series
%Find the rank of the original time series
R=tiedrank(input); 
n=length(input); 
T=1:n; 

qs=1-6/(n*(n^2-1))*sum((T-R).^2);   % qs
T=qs*sqrt(n-2)/sqrt(1-qs^2) ;  % |T|
t_alpha=tinv(0.975,n-2);     % talpha/2
if  abs(T) > t_alpha 
    fprintf( 'not smooth')
    % Daniel testing:time series are not smooth
    % Find the first difference of the original time series
    delta=diff(input);   
    %Estimate the parameters of the model by using the AR(2) method
    fitting=ar(delta,2,'ls') ; % fitting struct
    hat=predict(fitting,[delta'; 0],2);
    pre_result=[input(1),input+hat(2)'];% prediction
    RE=abs((pre_result(1:end-1)-input)./input);  %Relative error
    
else
    fprintf(' smooth')
    % Daniel testing:time series are not smooth
    fitting=ar(input,2,'ls');
    hat = predict(fitting,[input';0],2);
    pre_result=hat';
    RE=abs((pre_result(1:end-1)-input)./input);
end
% 
%    