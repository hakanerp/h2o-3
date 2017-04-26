setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source("../../../scripts/h2o-r-test-setup.R")



# Test PCA on USArrests.csv
test.pca.arrests <- function() {
  Log.info("generating tenThousandCat1000C.csv\n")
  df = h2o.createFrame(rows=10000000, cols = 1000,factors = 10000,categorical_fraction = 1 ,
  integer_fraction=0, binary_fraction=0,missing_fraction=0)
  h2o.downloadCSV(df, "tenThousandCat1000C.csv")
  h2o.rm(df)

  Log.info("generating hundredThousandCat1000C.csv\n")
  df = h2o.createFrame(rows=10000000, cols = 1000,factors = 100000,categorical_fraction = 1 ,
  integer_fraction=0, binary_fraction=0,missing_fraction=0)
  h2o.downloadCSV(df, "hundredThousandCat1000C.csv")
  h2o.rm(df)

  Log.info("generating hundredThousandCat100C.csv\n")
  df = h2o.createFrame(rows=10000000, cols = 100,factors = 100000,categorical_fraction = 1 ,
  integer_fraction=0, binary_fraction=0,missing_fraction=0)
  h2o.downloadCSV(df, "hundredThousandCat100C.csv")
  h2o.rm(df)

  Log.info("generating oneMillionCat1000C.csv\n")
  df = h2o.createFrame(rows=10000000, cols = 1000,factors = 1000000,categorical_fraction = 1 ,
  integer_fraction=0, binary_fraction=0,missing_fraction=0)
  h2o.downloadCSV(df, "oneMillionCat1000C.csv")
  h2o.rm(df)

  Log.info("generating oneMillionCat100C.csv\n")
  df = h2o.createFrame(rows=10000000, cols = 100,factors = 1000000,categorical_fraction = 1 ,
  integer_fraction=0, binary_fraction=0,missing_fraction=0)
  h2o.downloadCSV(df, "oneMillionCat100C.csv")
  h2o.rm(df)

}

doTest("PCA Test: USArrests Data", test.pca.arrests)
