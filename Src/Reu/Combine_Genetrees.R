#enter the path of the parent directory where the folder of the genetrees are located
listfile<- list.files(path="",
                      pattern= "txt",full.names = T, recursive = TRUE) #To include sub directories, change the recursive = TRUE, else FALSE.

#extract the files with folder name, change to fit needs
listfile_genetree <- listfile[grep("",listfile)]

#function to read all of the files and their data and return it as dat
read_file <- function(filename) {
  dat <- read.table(filename,header = FALSE, sep = "\t")
  return(dat)
}

#apply to all filenames and bind them into one dataframe
all_dat <- do.call(rbind, lapply(listfile_genetree, read_file))

write.table(all_dat, file = "combinedtrees.txt", sep = "\t",
            row.names = FALSE, col.names = FALSE, quote = FALSE)