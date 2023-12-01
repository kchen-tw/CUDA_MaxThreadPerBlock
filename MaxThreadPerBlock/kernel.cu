#include <iostream>
#include <cuda_runtime.h>



int main()
{
    // 獲取當前 CUDA 設備的 ID
    int deviceId;
    cudaGetDevice(&deviceId);

    // 顯示當前使用的設備 ID
    std::cout << "Device: " << deviceId << std::endl;

    // 獲取硬體的靜態限制每個線程塊可容納的最大線程數
    int maxThreadsPerBlock;
    cudaDeviceGetAttribute(&maxThreadsPerBlock, cudaDevAttrMaxThreadsPerBlock, deviceId);
    std::cout << "Max Threads Per Block :" << maxThreadsPerBlock << std::endl;

    // 獲取每個線程塊的最大維度
    int maxThreadsDimX, maxThreadsDimY, maxThreadsDimZ;
    cudaDeviceGetAttribute(&maxThreadsDimX, cudaDevAttrMaxBlockDimX, deviceId);
    cudaDeviceGetAttribute(&maxThreadsDimY, cudaDevAttrMaxBlockDimY, deviceId);
    cudaDeviceGetAttribute(&maxThreadsDimZ, cudaDevAttrMaxBlockDimZ, deviceId);

    std::cout << "Max Threads Dim X: " << maxThreadsDimX << std::endl;
    std::cout << "Max Threads Dim Y: " << maxThreadsDimY << std::endl;
    std::cout << "Max Threads Dim Z: " << maxThreadsDimZ << std::endl;

    // 獲取每個網格的最大維度
    int maxGridDimX, maxGridDimY, maxGridDimZ;
    cudaDeviceGetAttribute(&maxGridDimX, cudaDevAttrMaxGridDimX, deviceId);
    cudaDeviceGetAttribute(&maxGridDimY, cudaDevAttrMaxGridDimY, deviceId);
    cudaDeviceGetAttribute(&maxGridDimZ, cudaDevAttrMaxGridDimZ, deviceId);

    std::cout << "Max Grid Dim X: " << maxGridDimX << std::endl;
    std::cout << "Max Grid Dim Y: " << maxGridDimY << std::endl;
    std::cout << "Max Grid Dim Z: " << maxGridDimZ << std::endl;

    // 獲取每個線程束的大小
    int warpSize;
    cudaDeviceGetAttribute(&warpSize, cudaDevAttrWarpSize, deviceId);

    std::cout << "Warp Size: " << warpSize << std::endl;

    return 0;
}

