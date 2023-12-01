#include <iostream>
#include <cuda_runtime.h>

using namespace std;

int main()
{
    // 獲取當前 CUDA 設備的 ID
    int deviceId;
    cudaGetDevice(&deviceId);

    // 顯示當前使用的設備 ID
    cout << "Device: " << deviceId << endl;

    // 獲取硬體的靜態限制每個線程塊可容納的最大線程數
    int maxThreadsPerBlock;
    cudaDeviceGetAttribute(&maxThreadsPerBlock, cudaDevAttrMaxThreadsPerBlock, deviceId);
    cout << "Max Threads Per Block :" << maxThreadsPerBlock << endl;

    // 獲取每個線程塊的最大維度
    int maxThreadsDimX, maxThreadsDimY, maxThreadsDimZ;
    cudaDeviceGetAttribute(&maxThreadsDimX, cudaDevAttrMaxBlockDimX, deviceId);
    cudaDeviceGetAttribute(&maxThreadsDimY, cudaDevAttrMaxBlockDimY, deviceId);
    cudaDeviceGetAttribute(&maxThreadsDimZ, cudaDevAttrMaxBlockDimZ, deviceId);

    cout << "Max Threads Dim X: " << maxThreadsDimX << endl;
    cout << "Max Threads Dim Y: " << maxThreadsDimY << endl;
    cout << "Max Threads Dim Z: " << maxThreadsDimZ << endl;

    // 獲取每個網格的最大維度
    int maxGridDimX, maxGridDimY, maxGridDimZ;
    cudaDeviceGetAttribute(&maxGridDimX, cudaDevAttrMaxGridDimX, deviceId);
    cudaDeviceGetAttribute(&maxGridDimY, cudaDevAttrMaxGridDimY, deviceId);
    cudaDeviceGetAttribute(&maxGridDimZ, cudaDevAttrMaxGridDimZ, deviceId);

    cout << "Max Grid Dim X: " << maxGridDimX << endl;
    cout << "Max Grid Dim Y: " << maxGridDimY << endl;
    cout << "Max Grid Dim Z: " << maxGridDimZ << endl;

    // 獲取每個線程束的大小
    int warpSize;
    cudaDeviceGetAttribute(&warpSize, cudaDevAttrWarpSize, deviceId);

    cout << "Warp Size: " << warpSize << endl;

    return 0;
}

