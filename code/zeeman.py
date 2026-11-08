#!/usr/bin/env python
# coding: utf-8

# # Zeeman-Effekt: Auswertung
# Messdaten laden, Aufspaltung berechnen und das Bohrsche Magneton bestimmen.

# In[1]:


import numpy as np
from fitting import weighted_fit
from plots import plot_fit


# ## Messdaten
# Magnetfeld in T, Aufspaltung in µeV (aus den Interferenzbildern).

# In[2]:


B = np.array([0.25, 0.50, 0.75, 1.00])
dE = np.array([14.1, 29.5, 42.7, 58.6])
sigma = np.array([0.8, 0.8, 0.9, 1.0])


# ## Anpassung

# In[3]:


mu_B, sigma_mu_B = weighted_fit(B, dE, sigma)
print(f"mu_B = ({mu_B:.1f} +- {sigma_mu_B:.1f}) micro-eV/T")
plot_fit(B, dE, sigma, mu_B, "figures/fit.pdf")
