
import pandas as pd
import numpy as np

df = pd.read_csv('../data/sample_loans.csv')

def simulate_prepayment(row):
    rate = 0.03 if row['type'] == 'fixed' else 0.06
    hazard = 1 - np.exp(-rate * row['duration'])
    return hazard

df['prepayment_prob'] = df.apply(simulate_prepayment, axis=1)
df.to_csv('../data/loan_prepayment_results.csv', index=False)
