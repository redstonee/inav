#pragma once

#include <stdint.h>

typedef float float32_t;

void arm_sub_f32(float32_t *pSrcA, float32_t *pSrcB, float32_t *pDst, uint32_t blockSize);
void arm_scale_f32(float32_t *pSrc, float32_t scale, float32_t *pDst, uint32_t blockSize);
void arm_mult_f32(float32_t *pSrcA, float32_t *pSrcB, float32_t *pDst, uint32_t blockSize);
