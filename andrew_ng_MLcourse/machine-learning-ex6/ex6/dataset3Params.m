function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
Cs=[0.01,0.03,0.1,0.3,1,3,10,30 ];
sigmas=[0.01,0.03,0.1,0.3,1,3,10,30] ;
min_error=1000;
%model=zeros((length(sigma))*(length(C)),1);
%M=zeros(64,1);
for i =1: length(Cs)
     for j=1:length(sigmas)
          model= svmTrain(X, y, Cs(i), @(x1, x2) gaussianKernel(x1, x2, sigmas(j)));
          %M=[ (C(i),sigma(j) ) , 1 ];
         
%we got total 64 models 
%model=model(:,:);
 %predictions=zeros(size(yval,1),64);
    
          predictions=svmPredict(model,Xval);  
%prediction_error   =zeros(64,1)  ;  
          prediction_error=mean(double(predictions ~= yval));
          if ( prediction_error <= min_error)
             min_error=prediction_error;
             C=Cs(i);
             sigma=sigmas(j);
          end
     end    
end     


 %[value,index]=max(prediction_error);
 
%[C,sigma]=M(index,1)




% =========================================================================

end
