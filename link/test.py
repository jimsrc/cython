""" Script to smoke-test our Cython wrappers
"""
# Author: Gael Varoquaux
# License: BSD
import numpy as np

import cython_wrapper as cw
a = cw.py_compute(10)

print 'The array created is %s' % a
print 'It carries a reference to our deallocator: %s ' % a.base
np.testing.assert_allclose(a, np.arange(10))


b = cw.py_compute_2d_ii(4, 4)
print " ---> ok "
print " ---> 2d array: \n", b
print " ----> b.shape: ", b.shape
print 'It carries a reference to our deallocator: %s ' % b.base

c = cw.create_1d_array(4.55, 6)


#raw_input()
