module MyLib

using CSV
using MLDataUtils
using DelimitedFiles

function GetData()
  mkdir("data")
  a = readdlm(download("https://archive.ics.uci.edu/ml/machine-learning-databases/00484/tripadvisor_review.csv"), ',', header=false)
  open("data/travel.txt", "w") do f
    writedlm(f, a, ",")
  end
  
end 

end
