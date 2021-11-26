%Q1(a)
NumericArray = double('He had to think of a solution')
CharacterArray = char(NumericArray)
CharacterArray = char([119 104 121 32 115 111 32 115 101 114 105 111 117 115])

%Q1(b)
char2double('abc')
char2double('ABC')
char2double('A ZA')


%Q1(c)
double2char([1 2 3])
double2char([1 27 26 1])
double2char([9 27 3 1 14 27 6 9 7 21 18 5 27 9 20 27 15 21 20])


%Q2(a)
%load('/Users/tianshulin/Desktop/EE3731C CA2/sem1_2021_encrypt.mat')
frank_original_double = char2double(frank_original_txt)
frank_encrypted_double = frank_encrypt_key(frank_original_double)
frank_encrypted_txt = double2char(frank_encrypted_double)

encrypted_text = double2char(frank_encrypt_key(char2double('He had to think of a solution')))


%Q2(b)
frank_encrypted_double = char2double(frank_encrypted_txt)
frank_decrypted_double = frank_decrypt_key(frank_encrypted_double)
frank_decrypted_txt = double2char(frank_decrypted_double)


decrypted_text = double2char(frank_decrypt_key(char2double('hokyscowdewywsmumkc')))

%Q3(a)
pr_trans = compute_transition_probability(training_txt)
pr_trans(1,1)
pr_trans(2,3)
maximum = max(max(pr_trans))
[x,y] = find(pr_trans==maximum)
double2char(x)
double2char(y)

%Q3(b)
logn_pr = logn_pr_txt(frank_encrypted_txt, pr_trans)
logn_pr = logn_pr_txt(frank_original_txt, pr_trans)

%Q3(c)
mystery_encrypted_double = char2double(mystery_encrypted_txt)
mystery_decrypted_double = mystery_decrypt_key(mystery_encrypted_double)
mystery_decrypted_txt = double2char(mystery_decrypted_double)


% now we have frank_decrypted_txt && mystery_decrypted_txt
p_frank = logn_pr_txt(frank_decrypted_txt, pr_trans)
p_mystery = logn_pr_txt(mystery_decrypted_txt, pr_trans)

%Q4(a)

metropolis(current_key, new_key, pr_trans, encrypted_txt)

%(i)
[accept_new_key, prob_accept] = metropolis(frank_decrypt_key, mystery_decrypt_key, pr_trans, frank_encrypted_txt)

%(ii)
frank_decrypt_key_new = frank_decrypt_key
frank_decrypt_key_new ([12 13]) = frank_decrypt_key_new ([13 12])

[accept_new_key1, prob_accept1] = metropolis(frank_decrypt_key, frank_decrypt_key_new, pr_trans, frank_encrypted_txt)


%(b)
[decrypted_txt_mcmc, decrypt_key_mcmc] = mcmc_decrypt_text(frank_encrypted_txt, pr_trans)

%(c)
[decrypted_txt_mystery_mcmc, decrypt_key_mystery_mcmc] = mcmc_decrypt_text(mystery_encrypted_txt, pr_trans)
