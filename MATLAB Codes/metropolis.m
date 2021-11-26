function [accept_new_key, prob_accept] = metropolis(current_key, new_key, pr_trans, encrypted_txt)

% Please write this function based on the following specifications.
%
% metropolis.m takes as inputs the current decryption key (current_key),
% the new decryption key (new_key), a matrix of transition probability
% and the encrypted text (encrypt_txt). 
%
% metropolis.m computes whether to accept the
% new key (accept_new_key = 1) or reject the new key (accept_new_key = 0)
% using the Metropolis algorithm criteria. metropolis.m also outputs the 
% probability that the new key is accepted over the old key.
%
% Inputs:
%   current_key = 1 x 27 double array
%   new_key     = 1 x 27 double array
%   pr_trans    = 27 x 27 matrix, where  pr_trans(i, j)  = probability of j-th letter in the alphabet occurs immediately after i-th letter in the alphabet
%                               e.g., pr_trans(1, 2)  = probability character b occurring immediately after character a
%                               e.g., pr_trans(1, 27) = probability character ' ' occurring immediately after character a
%   encrypted_txt = 1 x N character array
%
% Output:
%	accept_new_key = 1 x 1 double 
%	prob_accept = 1 x 1 double = probability of accepting new key
%
% Metropolis criteria:
%   Metropolis.m computes the log p(encrypted_txt | current_key) and 
%   log p(encrypted_txt | new_key). Let's denote these log_curr and log_new.
%
%	If log_new > log_curr, we definitely accept the new key (i.e., accept_new_key = prob_accept = 1). 
%
%   If log_new < log_curr, then we accept the new key with probability 
%	prob_accept = exp(log_new - log_curr). accept_new_key is then set based on a
%   "coin toss": if (rand(1) < prob_accept), then accept_new_key = 1 else it
%	is set to 0.
%
% IMPORTANT NOTE: To ensure the behavior of everyone's code is the same, 
%   (1) Do NOT set the seed of the random number generator. We have already set the seed
%       in mcmc_decrypt_text. 
%
%   (2) Use "rand(1) < prob_accept" check as described above to decide 
%		whether to accept. For example, "(1 - rand(1)) < p" would
%		technically still be correct, but your code will behave different from 
%		everyone else.


%decrypted_text = double2char(current_key(char2double(encrypted_txt)))
log_curr = logn_pr_txt(double2char(current_key(char2double(encrypted_txt))), pr_trans)
log_new = logn_pr_txt(double2char(new_key(char2double(encrypted_txt))), pr_trans)

if log_new >= log_curr
    accept_new_key = 1
    prob_accept = 1
else
    prob_accept = exp(log_new - log_curr)
    if (rand(1) < prob_accept)
        accept_new_key = 1
    else
        accept_new_key = 0
    end
end
        
end