system.time(eval(source("./run_analysis.R")))
conn <- file("raw/test/Inertial Signals/body_acc_x_test.txt")
# h <- readLines(conn, n = 1)
# h <- unlist(strsplit(h, " +", perl = T))
# h <- as.numeric(h[-1])
# mean(h) #which mean?
# summary(h)