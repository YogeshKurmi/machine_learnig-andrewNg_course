function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;
    
stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    
    
  % here yval is groundTruth label ie 1 or 0   (anomaly or normal)
   %and pval is the probablity to the corresponding labels
      cvPredictions=(pval < epsilon) ;   %now we have our prediction vector for this particular epsilon
      tp = sum((cvPredictions==1) & (yval==1) ) ; % this will give us no. of true positives similarly the followings
      fp =sum(( cvPredictions==1) & (yval==0) ) ;
      fn =sum(( cvPredictions==0) & (yval==1) ) ;
       % now we'll calculate the precision and recall so as to find the F1 score for evaluation purpose of epsilon
       prec= tp/(tp+fp ) ;
       rec = tp/(tp+fn ) ;
       F1=(2*prec*rec)/(prec + rec ) ;
       
       if F1> bestF1       % ie. if loop will be operated only if this condition hold true
           bestF1=F1 ; 
           bestEpsilon= epsilon ; 
       end
end       
 

%[bestF1, index ]=max(F1) ;
%bestEpsilon=

% we cud also aproach  like this  if we cud initialize all those bestF1   F1 etc as matrix           % but this cud we lengthy and cranky aproach



    % =============================================================

end
