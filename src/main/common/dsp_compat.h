/* DSP compatibility header: map ARM CMSIS-DSP and NMSIS-DSP names to common macros */
#pragma once
#include <stdint.h>

#if defined(__arm__) || defined(__ARM__) || defined(__ARM_ARCH)
#include "arm_math.h"
#define fmt_sin_f32(x) arm_sin_f32((x))
#define fmt_cos_f32(x) arm_cos_f32((x))
#define fmt_sqrt_f32(x,out) arm_sqrt_f32((x),(out))
#define fmt_std_f32(p,len,out) arm_std_f32((p),(len),(out))
#define fmt_sub_f32(a,b,d,n) arm_sub_f32((a),(b),(d),(n))
#define fmt_scale_f32(a,s,d,n) arm_scale_f32((a),(s),(d),(n))
#define fmt_mult_f32(a,b,d,n) arm_mult_f32((a),(b),(d),(n))

#elif defined(__riscv) || defined(__riscv__)
#include "riscv_math.h"
#define fmt_sin_f32(x) riscv_sin_f32((x))
#define fmt_cos_f32(x) riscv_cos_f32((x))
#define fmt_sqrt_f32(x,out) riscv_sqrt_f32((x),(out))
#define fmt_std_f32(p,len,out) riscv_std_f32((p),(len),(out))
#define fmt_sub_f32(a,b,d,n) riscv_sub_f32((a),(b),(d),(n))
#define fmt_scale_f32(a,s,d,n) riscv_scale_f32((a),(s),(d),(n))
#define fmt_mult_f32(a,b,d,n) riscv_mult_f32((a),(b),(d),(n))

#else
#include <math.h>
static inline float fmt_sin_f32(float x) { return sinf(x); }
static inline float fmt_cos_f32(float x) { return cosf(x); }
static inline void fmt_sqrt_f32(float in, float *out) { *out = sqrtf(in); }
static inline void fmt_std_f32(const float *p, uint32_t len, float *out) {
    if (len == 0) { *out = 0.0f; return; }
    float mean = 0.0f;
    for (uint32_t i = 0; i < len; i++) mean += p[i];
    mean /= (float)len;
    float sum = 0.0f;
    for (uint32_t i = 0; i < len; i++) { float d = p[i] - mean; sum += d * d; }
    *out = sqrtf(sum / (float)((len > 1) ? (len - 1) : 1));
}
static inline void fmt_sub_f32(const float *a, const float *b, float *d, uint32_t n) {
    for (uint32_t i = 0; i < n; i++) d[i] = a[i] - b[i];
}
static inline void fmt_scale_f32(const float *a, float s, float *d, uint32_t n) {
    for (uint32_t i = 0; i < n; i++) d[i] = a[i] * s;
}
static inline void fmt_mult_f32(const float *a, const float *b, float *d, uint32_t n) {
    for (uint32_t i = 0; i < n; i++) d[i] = a[i] * b[i];
}
#endif
