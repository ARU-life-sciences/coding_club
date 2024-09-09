# create some functions to clean up the input data.

setwd("~/Documents/ARU/ARU-life-sciences/coding_club/data/")

# Load the data
geckos <- read.csv("./Szabo_2024_geckos.csv", check.names = FALSE)

id_svl_weight_sex <- unique(
  geckos[, c(1:4)]
)[complete.cases(unique(geckos[, c(1:4)])), ]

id_svl_weight_sex <- id_svl_weight_sex[order(id_svl_weight_sex$ID), ]

per_id <- split(x = geckos[5:nrow(geckos), -c(1:4)], f = geckos$ID)

gecko_data <- lapply(per_id, function(d) {
  dd <- as.data.frame(t(d))

  colnames(dd) <- dd[rownames(dd) == "Date", ]
  dd <- dd[!rownames(dd) == "Date", ]

  dd$Date <- gsub("\\..*", "", rownames(dd))
  rownames(dd) <- NULL

  dd
})

index <- 1
out <- list()

# now iterate over the gecko data and add in the id, svl, weight, and sex
# data. both datasets are in the same order, so should be a straight iteration
for (i in gecko_data) {
  i$ID <- id_svl_weight_sex$ID[index]
  i$SVL <- id_svl_weight_sex$SVL[index]
  i$Weight <- id_svl_weight_sex$weight[index]
  i$Sex <- id_svl_weight_sex$sex[index]

  out[[index]] <- i
  index <- index + 1
}

write.csv(
  x = do.call("rbind", out[-13]), file = "../gecko_data.csv",
  row.names = FALSE
)
