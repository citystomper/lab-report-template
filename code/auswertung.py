#!/usr/bin/env python
# coding: utf-8

# # Auswertung
# Daten laden, eine Gerade anpassen und das Ergebnis darstellen.

# In[1]:


import numpy as np
from fitting import weighted_fit
from plots import plot_fit


# ## Daten
# Beispielwerte mit Unsicherheiten.

# In[2]:


x = np.array([0.25, 0.50, 0.75, 1.00])
y = np.array([14.1, 29.5, 42.7, 58.6])
sigma = np.array([0.8, 0.8, 0.9, 1.0])


# ## Anpassung

# In[3]:


a, sigma_a = weighted_fit(x, y, sigma)
print(f"a = {a:.1f} +- {sigma_a:.1f}")
plot_fit(x, y, sigma, a, "figures/fit.pdf")
