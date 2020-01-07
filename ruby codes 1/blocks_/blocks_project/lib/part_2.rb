def all_words_capitalized?(arr)
    arr.all?{|word|capitalized?(word)}
end
def capitalized?(word)
    if word==word.capitalize
        return true
    else 
        return false
    end

end


def no_valid_url?(arr)
    arr.none?{|url|valid_url?(url)}
end
def valid_url?(url)
    array=[".com",".io",".net",".org"]
    if array.any?{|ele|url.include?(ele)}
        return true
    else 
        return false
    end
end


def any_passing_students?(arr)
    arr.any?{|student|passing?(student)}
end
def passing?(stu_hash)
    a=stu_hash[:grades]
    if (a.sum)/(a.length.to_f) >= 75.0
        return true
    else 
        return false
    end
end