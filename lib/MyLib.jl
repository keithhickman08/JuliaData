module MyLib

using CSV
using MLDataUtils
using DelimitedFiles
using DataTables

function GetData()
  mkdir("data")
  a = readdlm(download("https://archive.ics.uci.edu/ml/machine-learning-databases/00484/tripadvisor_review.csv"), ',', header=false)
  open("data/travel.txt", "w") do f
    writedlm(f, a, ",")
  end
  
end 

function TrainTest()
  a = readdlm("data/travel.txt", ',', Any, '\n')
  a = shuffleobs(a, obsdim=1)
  train, test = splitobs(a, at = 0.7, obsdim=1)
end

end
