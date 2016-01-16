#cython: wraparound=False, boundscheck=False, cdivision=True
#cython: profile=False, nonecheck=False, overflowcheck=False
#cython: cdivision_warnings=False, unraisable_tracebacks=False
import numpy as np
#cimport numpy as np

cpdef iterate(Z, c):
    '''Element by elemenent iteration.

    Args:
        Z (ndarray - int) - Represents 2D space
        c (namedtuple) - Container for constants
    Returns:
        Z (ndarray - int)
    '''

    # Holds the sum of neighbors for each element in Z
    N = np.zeros((c.rows-1, c.cols-1), dtype=int)

    cdef int rows = c.rows
    cdef int cols = c.cols
    cdef long [:, :] N_ = N
    cdef long [:, :] Z_ = Z
    cdef int x, y

    with nogil:
        
        # Count neighbors
        for x in range(1, rows-1):
            for y in range(1, cols-1):
                N_[x, y] = (Z_[x-1, y-1] + Z_[x-1, y] + Z_[x-1, y+1] +
                            Z_[x,   y-1]              + Z_[x,   y+1] +
                            Z_[x+1, y-1] + Z_[x+1, y] + Z_[x+1, y+1])
                
        # Apply rules 
        for x in range(1, rows-1):
            for y in range(1, cols-1):
                if Z_[x, y] == 1 and (N_[x, y] < 2 or N_[x, y] > 3):
                    Z_[x, y] = 0
                elif Z_[x, y] == 0 and N_[x, y] == 3:
                     Z_[x, y] = 1

    return np.array(Z_)
