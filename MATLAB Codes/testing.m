% 1+occurrences('aaabababa', 'aa')

%pr_trans = compute_transition_probability('aaabababa')
%pr_trans = compute_transition_probability(training_txt)

%NumericArray = double('He had to think of a solution')
%CharacterArray = char(NumericArray)
%CharacterArray = char([119 104 121 32 115 111 32 115 101 114 105 111 117 115])


%logn_pr = logn_pr_txt(frank_encrypted_txt, pr_trans)
%logn_pr = logn_pr_txt(frank_original_txt, pr_trans)

%pr_trans1 = compute_transition_probability('aaabababa')

%mystery_decrypted_double = mystery_decrypt_key(frank_encrypted_double)
%mystery_decrypted_txt = double2char(mystery_decrypted_double)
% now we have frank_decrypted_txt && mystery_decrypted_txt
%p_frank = logn_pr_txt(frank_decrypted_txt, pr_trans)
%p_mystery = logn_pr_txt(mystery_decrypted_txt, pr_trans)

%metropolis(current_key, new_key, pr_trans, encrypted_txt)
%[accept_new_key, prob_accept] = metropolis(frank_decrypt_key, mystery_decrypt_key, pr_trans, frank_encrypted_txt)

%frank_decrypt_key_new = frank_decrypt_key
%frank_decrypt_key_new ([12 13]) = frank_decrypt_key_new ([13 12])

%[accept_new_key1, prob_accept1] = metropolis(frank_decrypt_key, frank_decrypt_key_new, pr_trans, frank_encrypted_txt)

%function [decrypted_txt, decrypt_key] = mcmc_decrypt_text(encrypted_txt, pr_trans)
%[decrypted_txt_mcmc, decrypt_key_mcmc] = mcmc_decrypt_text(frank_encrypted_txt, pr_trans)
%[decrypted_txt_mystery_mcmc, decrypt_key_mystery_mcmc] = mcmc_decrypt_text(mystery_encrypted_txt, pr_trans)
p_mystery = logn_pr_txt(mystery_decrypted_txt, pr_trans)
