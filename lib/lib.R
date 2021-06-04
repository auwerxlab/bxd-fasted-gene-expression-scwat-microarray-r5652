# Pull, extract and the return the path of files specified by a location and a list of extensions
get.platform.files <- function(dir = ".", ext = c("pgf", "clf", "bgp", "mps")){
  
  suppressMessages(library("here"))
  suppressMessages(library("dplyr"))
  
  platform_files <- vector("list", length = length(ext)) %>%
    `names<-`(ext)
  
  for(s in ext){
    system(paste0('cd ', here(),
                  ' && git lfs pull --include="', basename(dir), '/*.', s, '*"',
                  ' && unzip ', dir, '/*.', s, '.zip -d ', dir,
                  ' || gunzip -k ', dir, '/*.', s, '.gz'))
    platform_files[[s]] <- list.files(dir, pattern = paste0("*.", s, "$"),
                                      full.names = T)
  }
  return(platform_files)
}
