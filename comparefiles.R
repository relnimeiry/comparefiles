
setwd("~/OneDrive - Johns Hopkins University/R 2020/comparefiles")
file1 <- readxl::read_excel("file1.xlsx")
file2 <- readxl::read_excel("file2.xlsx")

 
#fast check to see if files are exactly replica
library(tools)
md5sum("file1.csv") == md5sum("file2.csv")


#slow check to visualise/see if line by line exactly match across* (must be sorted)
# install.packages("diffr")
library(diffr)
diffr(file1 = "file1.csv", file2 = "file2.csv", before = "man", after = "auto")


#slow check for how many records mismatch (must be sorted); compares headers
fileloc1 <- "file1.csv"
fileloc2 <- "file2.csv"
all.equal(readLines(fileloc1), readLines(fileloc2), check.attributes = T, header=T) 

# Compare mean relative difference based on each column; 
man <- read_csv("file1.csv") %>% 
  group_by(x) %>% 
  arrange(x)


auto <- read_csv("file2.csv") %>% 
  group_by(x) %>% 
  arrange(x)


all.equal(target = man, current = auto, check.attributes = F)


nrow(file1)
nrow(file2)

