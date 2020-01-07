require "byebug"
def select_even_nums(arr)
    arr=arr.select(&:even?)
end


def reject_puppies(arr)
    arr.reject{|hash| hash["age"]<=2}
end

def count_positive_subarrays(arr)
    arr.count {|sub_arr| sub_arr.sum>0}
end

def aba_translate(word)
    vowels="aeiou"
    p=0
    word.each_char.with_index do |char,i|
        if vowels.include?(char)
            word.insert(p+1,"b"+char)
            p+=3
        else
        p+=1
        end
    end
end


def aba_array(arr)
    new_array=arr.map{|word|aba_translate(word)}
end