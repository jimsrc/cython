from distutils.core import setup, Extension
from Cython.Build import cythonize

ext = Extension("nr3",
                sources=["nr3.pyx",], #"mt19937.cpp", "tt.cc"],
                language="c++")

setup(name="nr3",
      ext_modules=cythonize(ext))
