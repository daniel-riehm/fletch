
# Define ssize_t for MSVC builds
file(COPY ${pybind11_patch}/include/pybind11/numpy.h
  DESTINATION ${pybind11_source}/include/pybind11/
)
