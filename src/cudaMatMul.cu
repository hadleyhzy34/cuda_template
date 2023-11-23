#include "cudaMatMul.h"
#include <cuda.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

__global__ void test_kernel(void) { printf("hello from gpu\n"); }

namespace Wrapper {
void wrapper(void) {
  test_kernel<<<1, 5>>>();
  cudaDeviceSynchronize();
}
} // namespace Wrapper
