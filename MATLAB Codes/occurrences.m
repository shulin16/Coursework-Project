function count = occurrences(string, sub)
count = 0
for x = 1:(strlength(string)-strlength(sub)+1)
    if string(x:x+strlength(sub)-1) == sub
       count = count + 1
    end
end
end