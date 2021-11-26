function [decrypted_txt, decrypt_key] = mcmc_decrypt_text(encrypted_txt, pr_trans)

% This function mcmc_decrypt_text.m is written for you. You can study the code,
% but do not accidentally modify and break it!
% mcmc_decrypt_text.m calls 5 helper functions which you have to write.
%
% mcmc_decrypt_text.m takes a character array of encrypted text and a matrix of transition probability
% and decrypts the text using the Metropolis-Hasting algorithm. The assumption here is that
% the original text is encrypted using a substitution cipher, e.g., all the 'a' are converted to
% 'c', all the 'e' are converted to 'a' and so on.
%
% Inputs:
%    encrypted_txt = 1 x N character array (i.e., string)
%    pr_trans = 27 x 27 matrix, where pr_trans(i, j)  = probability j-th letter in the alphabet occurs immediately after i-th letter in the alphabet
%                               e.g., pr_trans(1, 2)  = probability character b occurring after character a
%                               e.g., pr_trans(1, 27) = probability character ' ' occurring after character a
%
% Output:
%	decrypted_txt = 1 x N character array (i.e., string) corresponding to decrypted version of encrypted txt
%	decrypted_key = 1 x 27 double array that inverts the substitution cipher.
%
%	More specifically, decrypted_txt = double2char(decrypt_key(char2double(encrypted_txt)));
%   For example, suppose the original text was encrypted by converting 'e' to 'a', etc.
%   Then the 1st element of decrypt_key should be equal to 5.


% initialize random number generator so that we get same behavior each time
% this makes it easy to debug and grade your assignment
rng(126,'twister');

% initialize decrypt_key
decrypt_key = 1:27;

% compute log probability of encrypted txt
current_log_pr = logn_pr_txt(encrypted_txt, pr_trans);

% run mcmc for 15000 iterations
for iteration = 1:15000

    % randomly exchange two elements in decrypt_key in order to generate new key
    new_key = swap_two_elements(decrypt_key);

    % Metropolis move
    accept_new_key = metropolis(decrypt_key, new_key, pr_trans, encrypted_txt);    
    if(accept_new_key)
        decrypt_key = new_key;
    end

    % print progress
    if((mod(iteration, 100) == 0 & iteration < 2000) || mod(iteration, 1000) == 0)
        decrypted_txt = double2char(decrypt_key(char2double(encrypted_txt)));
        current_log_pr = logn_pr_txt(decrypted_txt, pr_trans);

        disp(['Run ' num2str(iteration, '%05d') ': log probability = ' num2str(current_log_pr)]);
        disp(decrypted_txt);
        disp(' ');
        pause(0);
    end
end
decrypted_txt = double2char(decrypt_key(char2double(encrypted_txt)));


% helper function: swap_two_elements
% randomly swap two elements in the array
function new_key = swap_two_elements(decrypt_key)

indices = randperm(length(decrypt_key));
swap_keys = decrypt_key(indices(1:2));

new_key = decrypt_key;
new_key(indices(1)) = swap_keys(2);
new_key(indices(2)) = swap_keys(1);









