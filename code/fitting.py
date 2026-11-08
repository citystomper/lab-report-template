"""Fit routines used by the analysis notebook."""
import numpy as np


def weighted_fit(x, y, sigma):
    """Weighted least-squares fit of y = a * x through the origin.

    Returns the slope a and its standard uncertainty.
    """
    w = 1 / sigma**2
    a = np.sum(w * x * y) / np.sum(w * x**2)
    sigma_a = np.sqrt(1 / np.sum(w * x**2))
    return a, sigma_a
