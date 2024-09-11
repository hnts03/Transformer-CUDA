#include <iostream>
#include <cuda_runtime.h>

int main() {
    int deviceCount;
    cudaGetDeviceCount(&deviceCount);

    for (int i = 0; i < deviceCount; ++i) {
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, i);

        std::cout << "Device " << i << ": " << prop.name << std::endl;
        std::cout << "  Compute capability: " << prop.major << "." << prop.minor << std::endl;

        if (prop.major > 3 || (prop.major == 3 && prop.minor >= 5)) {
            std::cout << "  Supports Dynamic Parallelism: Yes" << std::endl;
        } else {
            std::cout << "  Supports Dynamic Parallelism: No" << std::endl;
        }
    }

    return 0;
}

