function log_pr = logn_pr_txt(input_txt, pr_trans)

% Please write this function based on the following specifications.
%
% logn_pr_txt.m takes an input text and a matrix of transition probability
% and computes the (natural) logarithm of the likelihood of input_txt given transition probability
% The idea is that if the input_txt is encrypted, the log probability is going to be small
% but if the input_txt is decrypted, the log probability is going to be big.
%
% Inputs:
%   input_txt = 1 x N character array
%   pr_trans = 27 x 27 matrix, where  pr_trans(i, j)  = probability of j-th letter in the alphabet occurs immediately after i-th letter in the alphabet
%                               e.g., pr_trans(1, 2)  = probability character b occurring immediately after character a
%                               e.g., pr_trans(1, 27) = probability character ' ' occurring immediately after character a
%
% Output:
%	logn_pr = 1 x 1 scalar
%
% The best way to explain how logn_pr is computed is with an example.
% Suppose input_txt = 'abcb', then
%
%	logn_pr = log(probability 'b' occurs after 'a') + log(probability 'c' occurs after 'b') + log(probability 'b' occurs after 'c')
%	        = log(pr_trans(1,2)) + log(pr_trans(2,3)) + log(pr_trans(3, 2))
%
% Note that in matlab log corresponds to the natural logarithm.
if strlength(input_txt) < 2
    print("Error")
else
    x = 0
    log_pr = 0
    for x = 1:(strlength(input_txt)-1)
        log_pr = log_pr + log(pr_trans(char2double(input_txt(x)), char2double(input_txt(x+1))))
        x = x+1
    end
end
end
       



