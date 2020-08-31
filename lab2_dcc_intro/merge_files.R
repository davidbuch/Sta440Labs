# Modified from R-Bloggers.com post "Looping through files"
path <- "/hpc/group/sta440-f20/shared_data/20_analysis_datasets/"
file_names <- list.files(path, pattern = "survey_data_week[0123456789]+_CLEANED.csv")

tables <- list()
for(f in 1:length(file_names)){
  tables[[f]] <- read.csv(paste0(path,file_names[f]), stringsAsFactors = FALSE)
  if(f == 1){
      full_table <- tables[[f]]
  }else{
    full_table <- rbind(full_table, tables[[f]][,intersect(colnames(full_table),colnames(tables[[f]]))])
  }
  print(dim(tables[[f]]))
}
full_table <- as.data.frame(
  lapply(full_table,function(x) if(class(x) == "character"){return(as.factor(x))}else{return(x)})
  )
print(dim(full_table))
summary(full_table)
write.csv(full_table,"full.csv")
