# Dynamic CSTR Modeling & Kinetic Parameter Estimation with PFR Benchmarking

## Project Overview
This project demonstrates modeling and analysis of an **isothermal Continuous Stirred Tank Reactor (CSTR)** for a single irreversible reaction \( A \rightarrow B \). Kinetic parameters were estimated from synthetic conversion data, and comparisons were made with an equivalent **Plug Flow Reactor (PFR)**. Optional sensitivity analysis and basic PI control exploration were also performed.

---

## Why This Matters
Understanding CSTR dynamics and kinetic parameter estimation is fundamental in **reaction engineering**, catalysis, and process design. This project illustrates:

- Formulating and solving ODE-based reactor models
- Parameter estimation via nonlinear least squares
- CSTR vs PFR design comparison
- Sensitivity analysis on feed concentration and residence time
- Optional control strategies for maintaining target conversion

---

## Repository Structure

cstr-pfr-kinetics-identification/

├── conversion_data.csv # Synthetic conversion vs residence time data

├── fit_kinetics.m # Estimates reaction rate constant k and order n

├── run_cstr_model.m # Solves the CSTR ODE model

├── pfr_compare.m # Generates design curves comparing CSTR vs PFR

├── sensitivity.m # Sensitivity analysis for tau and CA0

└── README.md # This document


---

## Dataset
- Synthetic conversion data generated to mimic realistic CSTR behavior.
- CSV contains columns:  
  - `tau` : Residence time (min)  
  - `X`   : Conversion of A  
- Data is used for parameter fitting and model validation.

---

## Modeling Approach
1. **CSTR Dynamics:** Modeled as an ODE:

\[
\frac{dC_A}{dt} = \frac{C_{A0} - C_A}{\tau} - k C_A^n
\]

2. **Parameter Estimation:**  
   - Used `lsqnonlin` in MATLAB to fit reaction rate constant \( k \) and order \( n \)  
   - Residuals and sum of squared errors assessed fitting quality  
   - Confidence intervals (CI) calculated where applicable

3. **PFR Benchmarking:**  
   - PFR design equation solved numerically  
   - Conversion vs residence time compared with CSTR

4. **Sensitivity Analysis:**  
   - Explored effects of residence time (\( \tau \)) and feed concentration (\( C_{A0} \)) on conversion


---

## Results Summary
- **Fitted Kinetic Parameters:**  
  - Example outcome: \( k \approx 0.61 \), \( n \approx 1.0 \)  
- **Residual Analysis:** Sum of squared errors ~0.03 → good fit  
- **Design Curves:**  
  - CSTR requires higher residence time than PFR for same conversion  
- **Sensitivity:** Conversion highly sensitive to τ; moderate sensitivity to feed concentration  


**Figures** (from MATLAB outputs):
- Residuals before/after fitting
- Conversion vs residence time for CSTR and PFR
- Sensitivity plots


---


**Author**

[Collins Chukwuma](https://www.linkedin.com/in/collins-chukwuma-567845216?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app)
