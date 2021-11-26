function pr_trans = compute_transition_probability(input_txt)

% Please write this function based on the following specifications.
%
% compute_transition_probability.m takes an input text and
% computes a matrix of transition probability.
%
% Input:
%	input_txt = 1 x N character array
%
% Output:
%    pr_trans = 27 x 27 matrix, where pr_trans(i, j)  = probability j-th letter in the alphabet occurs immediately after i-th letter in the alphabet
%                               e.g., pr_trans(1, 2)  = probability character b occurring immediately after character a
%                               e.g., pr_trans(1, 27) = probability character ' ' occurring immediately after character a
%
% pr_trans(i, j) is defined to be equal to
% (1 + #times j-th letter of alphabet appears after i-th letter of alphabet in input_txt) divided by
% (27 + #times i-th letter of alphabet appears in the text except at the last position in the text)
%
% For example, if the input_txt is 'aaabababa', then
%	# times 'a' appears not corresponding to last position is 5;
%   # times 'a' appears after 'a' is 2; # times 'b' appears after 'a' is 3.
%
%   Therefore pr_trans(1, 1) = (1 + 2)/(5 + 27) = 0.09375
%			  pr_trans(1, 2) = (1 + 3)/(5 + 27) = 0.125
%			  pr_trans(1, 3) = ... = pr_trans(1, 27) = 1/(5 + 27) = 0.03125...
%
%	Observe that sum(pr_trans(1, :)) is equal to 1

pr_trans = ones(27)

for i = 1:27
    for j = 1:27
        % Initialize variables
        num = 0
        den = 0
        sub = append(double2char(i), double2char(j))
        
        % Occurrences is a function I wrote to calculate the # of times of
        % a string appears incluing the overlapping term
        num = 1+ occurrences(input_txt, sub)
        A = count(input_txt, double2char(i))
        if (input_txt(end) == double2char(i))
            A = A-1
        end
        den = 27+A
        pr_trans(i,j) = num/den
    end

end
end



