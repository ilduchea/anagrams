require('rest-client')

class String
  define_method(:actual_word) do |word|
    api_result_hash = eval(RestClient.get("https://api.pearson.com/v2/dictionaries/ldoce5/entries?headword=#{word}&limit=1&apikey=mTD3NJzp4wJSsge5ZtTGA2D4umaZqUPj"))

    if api_result_hash[:count] > 0
      result = true
    else
      result = false
    end
    result
  end
end
