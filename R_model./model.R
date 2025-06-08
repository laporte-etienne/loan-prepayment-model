
# Prepayment model (simplified)
loan_data <- read.csv('../data/sample_loans.csv')

simulate_prepayment <- function(loan) {
  rate <- ifelse(loan$type == 'fixed', 0.03, 0.06)
  hazard <- 1 - exp(-rate * loan$duration)
  return(hazard)
}

loan_data$prepayment_prob <- apply(loan_data, 1, simulate_prepayment)
write.csv(loan_data, '../data/loan_prepayment_results.csv', row.names=FALSE)
