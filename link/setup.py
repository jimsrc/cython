""" Example of building a module with a Cython file. See the distutils
and numpy distutils documentations for more info:
http://docs.scipy.org/doc/numpy/reference/distutils.html
"""
# Author: Gael Varoquaux
# License: BSD

import numpy
from Cython.Distutils import build_ext

# module name
modname = 'cython_wrapper'
# cython builds the 'modname'.cpp file including these 
# sources in this order:
depends = [
    'c_code.cpp',
    'code2.cpp', 
    'code3.cpp',
]

def configuration(parent_package='', top_path=None):
    """ Function used to build our configuration.
    """
    from numpy.distutils.misc_util import Configuration

    # The configuration object that hold information on all the files
    # to be built.
    config = Configuration('', parent_package, top_path)
    config.add_extension(modname,
                         sources=['%s.pyx'%modname],
                         language="c++",
                         # libraries=['m'],
                         depends=depends, 
                         include_dirs=[numpy.get_include(), '.'],
                         #libraries=['code2',],
                         #library_dirs=['.']
                         )
    return config


if __name__ == '__main__':
    # Retrieve the parameters of our local configuration
    params = configuration(top_path='').todict()

    # Override the C-extension building so that it knows about '.pyx'
    # Cython files
    params['cmdclass'] = dict(build_ext=build_ext)

    # Call the actual building/packaging function (see distutils docs)
    from numpy.distutils.core import setup
    setup(**params)
