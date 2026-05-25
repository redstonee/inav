# 0 "libraries\\NMSIS\\DSP\\Source\\FastMathFunctions\\riscv_sin_f32.c"
# 1 "C:\\Users\\RedStone\\src\\fmu\\FMT-Firmware\\target\\redstonee_tek\\ch32_fmu//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "libraries\\NMSIS\\DSP\\Source\\FastMathFunctions\\riscv_sin_f32.c"
# 30 "libraries\\NMSIS\\DSP\\Source\\FastMathFunctions\\riscv_sin_f32.c"
# 1 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h" 1
# 31 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
# 1 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h" 1
# 57 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"
# 118 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h"
# 1 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 1
# 20 "libraries\\NMSIS\\Core\\Include/nmsis_core.h"
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stdint.h" 1 3 4
# 9 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stdint.h" 3 4
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\stdint.h" 1 3 4
# 12 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\stdint.h" 3 4
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 1 3 4







# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\features.h" 1 3 4
# 28 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\features.h" 3 4
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\_newlib_version.h" 1 3 4
# 29 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\features.h" 2 3 4
# 9 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 2 3 4
# 41 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 3 4

# 41 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\stdint.h" 2 3 4
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_intsup.h" 1 3 4
# 35 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 190 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 14 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\stdint.h" 2 3 4
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_stdint.h" 1 3 4
# 20 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stdint.h" 2 3 4
# 21 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2





# 1 "libraries\\NMSIS\\Core\\Include/nmsis_version.h" 1
# 27 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2
# 74 "libraries\\NMSIS\\Core\\Include/nmsis_core.h"
# 1 "libraries\\NMSIS\\Core\\Include/nmsis_compiler.h" 1
# 30 "libraries\\NMSIS\\Core\\Include/nmsis_compiler.h"
# 1 "libraries\\NMSIS\\Core\\Include/nmsis_gcc.h" 1
# 31 "libraries\\NMSIS\\Core\\Include/nmsis_gcc.h"
# 1 "libraries\\NMSIS\\Core\\Include/riscv_encoding.h" 1
# 25 "libraries\\NMSIS\\Core\\Include/riscv_encoding.h"
# 1 "libraries\\NMSIS\\Core\\Include/riscv_bits.h" 1
# 26 "libraries\\NMSIS\\Core\\Include/riscv_encoding.h" 2
# 32 "libraries\\NMSIS\\Core\\Include/nmsis_gcc.h" 2
# 109 "libraries\\NMSIS\\Core\\Include/nmsis_gcc.h"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"

  
# 113 "libraries\\NMSIS\\Core\\Include/nmsis_gcc.h"
 struct __attribute__((packed, aligned(1))) T_UINT16_WRITE {
      uint16_t v;
  };
#pragma GCC diagnostic pop





#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"

  struct __attribute__((packed, aligned(1))) T_UINT16_READ {
      uint16_t v;
  };
#pragma GCC diagnostic pop





#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"

  struct __attribute__((packed, aligned(1))) T_UINT32_WRITE {
      uint32_t v;
  };
#pragma GCC diagnostic pop





#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpacked"
#pragma GCC diagnostic ignored "-Wattributes"

  struct __attribute__((packed, aligned(1))) T_UINT32_READ {
      uint32_t v;
  };
#pragma GCC diagnostic pop
# 31 "libraries\\NMSIS\\Core\\Include/nmsis_compiler.h" 2
# 75 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2



# 1 "libraries\\NMSIS\\Core\\Include/core_feature_base.h" 1
# 55 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
typedef unsigned long rv_csr_t;
# 68 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
typedef union {
    struct {
        rv_csr_t a:1;
        rv_csr_t b:1;
        rv_csr_t c:1;
        rv_csr_t d:1;
        rv_csr_t e:1;
        rv_csr_t f:1;
        rv_csr_t g:1;
        rv_csr_t h:1;
        rv_csr_t i:1;
        rv_csr_t j:1;
        rv_csr_t k:1;
        rv_csr_t l:1;
        rv_csr_t m:1;
        rv_csr_t n:1;
        rv_csr_t o:1;
        rv_csr_t p:1;
        rv_csr_t q:1;
        rv_csr_t r:1;
        rv_csr_t s:1;
        rv_csr_t t:1;
        rv_csr_t u:1;
        rv_csr_t v:1;
        rv_csr_t w:1;
        rv_csr_t x:1;
        rv_csr_t y:1;
        rv_csr_t z:1;
        rv_csr_t _reserved0:32 -28;
        rv_csr_t mxl:2;
    } b;
    rv_csr_t d;
} CSR_MISA_Type;




typedef union {
    struct {
        rv_csr_t _reserved0:1;
        rv_csr_t sie:1;
        rv_csr_t _reserved1:1;
        rv_csr_t mie:1;
        rv_csr_t _reserved2:1;
        rv_csr_t spie:1;
        rv_csr_t ube:1;
        rv_csr_t mpie:1;
        rv_csr_t spp:1;
        rv_csr_t vs:2;
        rv_csr_t mpp:2;
        rv_csr_t fs:2;
        rv_csr_t xs:2;
        rv_csr_t mprv:1;
        rv_csr_t sum:1;
        rv_csr_t mxr:1;
        rv_csr_t tvm:1;
        rv_csr_t tw:1;
        rv_csr_t tsr:1;
        rv_csr_t spelp:1;
        rv_csr_t sdt:1;
# 142 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
        rv_csr_t _reserved3:6;
        rv_csr_t sd:1;

    } b;
    rv_csr_t d;
} CSR_MSTATUS_Type;





typedef union {
    struct {
        rv_csr_t _reserved0:4;
        rv_csr_t sbe:1;
        rv_csr_t mbe:1;
        rv_csr_t gva:1;
        rv_csr_t mpv:1;
        rv_csr_t _reserved1:1;
        rv_csr_t mpelp:1;
        rv_csr_t mdt:1;
        rv_csr_t _reserved5:21;
    } b;
    rv_csr_t d;
} CSR_MSTATUSH_Type;





typedef union {
    struct {
        rv_csr_t mode:6;
        rv_csr_t addr:32 -6;
    } b;
    rv_csr_t d;
} CSR_MTVEC_Type;




typedef union {
    struct {
        rv_csr_t exccode:12;
        rv_csr_t _reserved0:4;
        rv_csr_t mpil:8;
        rv_csr_t _reserved1:3;
        rv_csr_t mpie:1;
        rv_csr_t mpp:2;
        rv_csr_t minhv:1;



        rv_csr_t interrupt:1;
    } b;
    rv_csr_t d;
} CSR_MCAUSE_Type;




typedef union {
    struct {
        rv_csr_t cy:1;
        rv_csr_t _reserved0:1;
        rv_csr_t ir:1;
        rv_csr_t _reserved1:32 -3;
    } b;
    rv_csr_t d;
} CSR_MCOUNTINHIBIT_Type;




typedef union {
    struct {
        rv_csr_t _reserved0:6;
        rv_csr_t typ:2;
        rv_csr_t ptyp:2;
        rv_csr_t _reserved1:32 -10;
    } b;
    rv_csr_t d;
} CSR_MSUBM_Type;




typedef union {
    struct {
        rv_csr_t mdcause:3;
        rv_csr_t _reserved0:32 -3;
    } b;
    rv_csr_t d;
} CSR_MDCAUSE_Type;




typedef union {
    struct {
        rv_csr_t _reserved0:1;
        rv_csr_t zclsd_en:1;
        rv_csr_t _reserved1:1;
        rv_csr_t bpu:1;
        rv_csr_t _reserved2:2;
        rv_csr_t misalign:1;
        rv_csr_t zcmt_zcmp:1;
        rv_csr_t core_buserr:1;
        rv_csr_t nmi_cause:1;
        rv_csr_t imreturn_en:1;
        rv_csr_t sijump_en:1;
        rv_csr_t ldspec_en:1;
        rv_csr_t _reserved3:1;
        rv_csr_t dbg_sec:1;
        rv_csr_t _reserved4:2;
        rv_csr_t csr_excl_enable:1;
        rv_csr_t _reserved5:32 -18;
    } b;
    rv_csr_t d;
} CSR_MMISCCTRL_Type;

typedef CSR_MMISCCTRL_Type CSR_MMISCCTL_Type;
typedef CSR_MMISCCTRL_Type CSR_MMISC_CTL_Type;




typedef union {
    struct {
        rv_csr_t ic_en:1;
        rv_csr_t ic_scpd_mod:1;
        rv_csr_t ic_ecc_en:1;
        rv_csr_t ic_ecc_excp_en:1;
        rv_csr_t ic_rwtecc:1;
        rv_csr_t ic_rwdecc:1;
        rv_csr_t ic_pf_en:1;
        rv_csr_t ic_cancel_en:1;
        rv_csr_t ic_ecc_chk_en:1;
        rv_csr_t ic_prefetch_en:1;
        rv_csr_t ic_burst_type:1;
        rv_csr_t _reserved0:5;
        rv_csr_t dc_en:1;
        rv_csr_t dc_ecc_en:1;
        rv_csr_t dc_ecc_excp_en:1;
        rv_csr_t dc_rwtecc:1;
        rv_csr_t dc_rwdecc:1;
        rv_csr_t dc_ecc_chk_en:1;
        rv_csr_t dc_prefetch_en:1;
        rv_csr_t dc_burst_type:1;
        rv_csr_t _reserved1:32 -24;
    } b;
    rv_csr_t d;
} CSR_MCACHECTL_Type;

typedef CSR_MCACHECTL_Type CSR_MCACHE_CTL_Type;




typedef union {
    struct {
        rv_csr_t mpie1:1;
        rv_csr_t mpp1:2;
        rv_csr_t _reserved0:3;
        rv_csr_t ptyp1:2;
        rv_csr_t mpie2:1;
        rv_csr_t mpp2:2;
        rv_csr_t _reserved1:3;
        rv_csr_t ptyp2:2;
        rv_csr_t _reserved2:32 -16;
    } b;
    rv_csr_t w;
} CSR_MSAVESTATUS_Type;




typedef union {
    struct {
        rv_csr_t ilm_en:1;
        rv_csr_t ilm_ecc_en:1;
        rv_csr_t ilm_ecc_excp_en:1;
        rv_csr_t ilm_rwecc:1;
        rv_csr_t ilm_ecc_chk_en:1;
        rv_csr_t ilm_va_en:1;
        rv_csr_t _reserved0:4;
        rv_csr_t ilm_bpa:32 -10;
    } b;
    rv_csr_t d;
} CSR_MILMCTL_Type;

typedef CSR_MILMCTL_Type CSR_MILM_CTL_Type;




typedef union {
    struct {
        rv_csr_t dlm_en:1;
        rv_csr_t dlm_ecc_en:1;
        rv_csr_t dlm_ecc_excp_en:1;
        rv_csr_t dlm_rwecc:1;
        rv_csr_t dlm_ecc_chk_en:1;
        rv_csr_t _reserved0:5;
        rv_csr_t dlm_bpa:32 -10;
    } b;
    rv_csr_t d;
} CSR_MDLMCTL_Type;

typedef CSR_MDLMCTL_Type CSR_DILM_CTL_Type;




typedef union {
    struct {
        rv_csr_t tee:1;
        rv_csr_t ecc:1;
        rv_csr_t clic:1;
        rv_csr_t plic:1;
        rv_csr_t fio:1;
        rv_csr_t ppi:1;
        rv_csr_t nice:1;
        rv_csr_t ilm:1;
        rv_csr_t dlm:1;
        rv_csr_t icache:1;
        rv_csr_t dcache:1;
        rv_csr_t smp:1;
        rv_csr_t dsp_n1:1;
        rv_csr_t dsp_n2:1;
        rv_csr_t dsp_n3:1;
        rv_csr_t zc_xlcz:1;
        rv_csr_t iregion:1;
        rv_csr_t vpu_degree:2;
        rv_csr_t sec_mode:1;
        rv_csr_t etrace:1;
        rv_csr_t safety_mecha:2;
        rv_csr_t vnice:1;
        rv_csr_t xlcz:1;
        rv_csr_t zilsd:1;
        rv_csr_t sstc:1;
        rv_csr_t _reserved1:32 -27;
    } b;
    rv_csr_t d;
} CSR_MCFGINFO_Type;

typedef CSR_MCFGINFO_Type CSR_MCFG_INFO_Type;




typedef union {
    struct {
        rv_csr_t set:4;
        rv_csr_t way:3;
        rv_csr_t lsize:3;
        rv_csr_t ecc:1;
        rv_csr_t _reserved0:5;
        rv_csr_t lm_size:5;
        rv_csr_t lm_xonly:1;
        rv_csr_t lm_ecc:1;
        rv_csr_t _reserved1:32 -23;
    } b;
    rv_csr_t d;
} CSR_MICFGINFO_Type;

typedef CSR_MICFGINFO_Type CSR_MICFG_INFO_Type;




typedef union {
    struct {
        rv_csr_t set:4;
        rv_csr_t way:3;
        rv_csr_t lsize:3;
        rv_csr_t ecc:1;
        rv_csr_t _reserved0:5;
        rv_csr_t lm_size:5;
        rv_csr_t lm_ecc:1;
        rv_csr_t _reserved1:32 -22;
    } b;
    rv_csr_t d;
} CSR_MDCFGINFO_Type;

typedef CSR_MDCFGINFO_Type CSR_MDCFG_INFO_Type;




typedef union {
    struct {
        rv_csr_t set:4;
        rv_csr_t way:3;
        rv_csr_t lsize:3;
        rv_csr_t ecc:1;
        rv_csr_t napot:1;
        rv_csr_t _reserved1:4;
        rv_csr_t i_size:3;
        rv_csr_t d_size:3;
        rv_csr_t _reserved2:32 -22;
    } b;
    rv_csr_t d;
} CSR_MTLBCFGINFO_Type;

typedef CSR_MTLBCFGINFO_Type CSR_MTLBCFG_INFO_Type;




typedef union {
    struct {
        rv_csr_t _reserved0:1;
        rv_csr_t ppi_size:5;
        rv_csr_t _reserved1:3;
        rv_csr_t ppi_en:1;
        rv_csr_t ppi_bpa:32 -10;
    } b;
    rv_csr_t d;
} CSR_MPPICFGINFO_Type;

typedef CSR_MPPICFGINFO_Type CSR_MPPICFG_INFO_Type;




typedef union {
    struct {
        rv_csr_t _reserved0:1;
        rv_csr_t fio_size:5;
        rv_csr_t _reserved1:4;
        rv_csr_t fio_bpa:32 -10;
    } b;
    rv_csr_t d;
} CSR_MFIOCFGINFO_Type;

typedef CSR_MFIOCFGINFO_Type CSR_MFIOCFG_INFO_Type;




typedef union {
    struct {
        rv_csr_t ecc_lock:1;
        rv_csr_t _reserved0:32 -1;
    } b;
    rv_csr_t d;
} CSR_MECCLOCK_Type;

typedef CSR_MECCLOCK_Type CSR_MECC_LOCK_Type;




typedef union {
    struct {
        rv_csr_t code:9;
        rv_csr_t _reserved0:7;
        rv_csr_t ramid:5;
        rv_csr_t _reserved1:3;
        rv_csr_t sramid:5;
        rv_csr_t _reserved2:32 -29;
    } b;
    rv_csr_t d;
} CSR_MECCCODE_Type;

typedef CSR_MECCCODE_Type CSR_MECC_CODE_Type;




typedef union {
    struct {
        rv_csr_t ilm_fch_msk:1;
        rv_csr_t ilm_acc_msk:1;
        rv_csr_t dlm_acc_msk:1;
        rv_csr_t ic_fch_msk:1;
        rv_csr_t dc_acc_msk:1;
        rv_csr_t ilm_ext_msk:1;
        rv_csr_t dlm_ext_msk:1;
        rv_csr_t ic_ccm_msk:1;
        rv_csr_t dc_ccm_msk:1;
        rv_csr_t dc_cpbk_msk:1;
        rv_csr_t _reserved0:32 -10;
    } b;
    rv_csr_t d;
} CSR_MECC_CTL_Type;




typedef union {
    struct {
        rv_csr_t ilm_fch_err:1;
        rv_csr_t ilm_acc_err:1;
        rv_csr_t dlm_acc_err:1;
        rv_csr_t ic_fch_err:1;
        rv_csr_t dc_acc_err:1;
        rv_csr_t ilm_ext_err:1;
        rv_csr_t dlm_ext_err:1;
        rv_csr_t ic_ccm_err:1;
        rv_csr_t dc_ccm_err:1;
        rv_csr_t dc_cpbk_err:1;
        rv_csr_t _reserved0:32 -10;
    } b;
    rv_csr_t d;
} CSR_MECC_STATUS_Type;




typedef union {
    struct {
        rv_csr_t _reserved0:1;
        rv_csr_t iregion_size:5;
        rv_csr_t _reserved1:4;
        rv_csr_t iregion_base:32 -10;
    } b;
    rv_csr_t d;
} CSR_MIRGB_INFO_Type;




typedef union {
    struct {
        rv_csr_t ovf_track_en:1;
        rv_csr_t udf_en:1;
        rv_csr_t mode:1;
        rv_csr_t _reserved0:32 -3;
    } b;
    rv_csr_t d;
} CSR_MSTACK_CTL_Type;




typedef union {
    struct {
        rv_csr_t tlb_ecc_en:1;
        rv_csr_t tlb_ecc_excp_en:1;
        rv_csr_t tlb_tram_ecc_inj_en:1;
        rv_csr_t tlb_dram_ecc_inj_en:1;
        rv_csr_t _reserved0:2;
        rv_csr_t tlb_ecc_chk_en:1;
        rv_csr_t napot_en:1;
        rv_csr_t _reserved1:32 -8;
    } b;
    rv_csr_t d;
} CSR_MTLB_CTL_Type;
# 766 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
static inline void __switch_mode(uint8_t mode, uintptr_t stack, void(*entry_point)(void))
{
    unsigned long val = 0;


    val = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x300" : "=r"(__v) : : "memory"); __v; });
    val = (((val) & ~(0x00001800)) | ((mode) * ((0x00001800) & ~((0x00001800)-1))));


    val = (((val) & ~(0x00000080)) | ((0) * ((0x00000080) & ~((0x00000080)-1))));

    ({ rv_csr_t __v = (rv_csr_t)(val); __asm volatile("csrw " "0x300" ", %0" : : "rK"(__v) : "memory"); });


    ({ rv_csr_t __v = (rv_csr_t)((unsigned long)entry_point); __asm volatile("csrw " "0x341" ", %0" : : "rK"(__v) : "memory"); });


    __asm volatile("mv sp, %0" ::"r"(stack));

    __asm volatile("mret");
}
# 816 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline void __enable_ext_irq(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 11)); __asm volatile("csrs " "0x304" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_ext_irq(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 11)); __asm volatile("csrc " "0x304" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __enable_timer_irq(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 7)); __asm volatile("csrs " "0x304" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_timer_irq(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 7)); __asm volatile("csrc " "0x304" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __enable_sw_irq(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 3)); __asm volatile("csrs " "0x304" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_sw_irq(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 3)); __asm volatile("csrc " "0x304" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_core_irq(uint32_t irq)
{
    ({ rv_csr_t __v = (rv_csr_t)(1UL << irq); __asm volatile("csrc " "0x304" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __enable_core_irq(uint32_t irq)
{
    ({ rv_csr_t __v = (rv_csr_t)(1UL << irq); __asm volatile("csrs " "0x304" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline uint32_t __get_core_irq_pending(uint32_t irq)
{
    return ((({ rv_csr_t __v; __asm volatile("csrr %0, " "0x344" : "=r"(__v) : : "memory"); __v; }) >> irq) & 0x1);
}







__attribute__((always_inline)) static inline void __clear_core_irq_pending(uint32_t irq)
{
    ({ rv_csr_t __v = (rv_csr_t)(1UL << irq); __asm volatile("csrc " "0x344" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __enable_irq_s(void)
{
    ({ rv_csr_t __v = (rv_csr_t)(0x00000002); __asm volatile("csrs " "0x100" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_irq_s(void)
{
    ({ rv_csr_t __v = (rv_csr_t)(0x00000002); __asm volatile("csrc " "0x100" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __enable_ext_irq_s(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 9)); __asm volatile("csrs " "0x104" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_ext_irq_s(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 9)); __asm volatile("csrc " "0x104" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __enable_timer_irq_s(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 5)); __asm volatile("csrs " "0x104" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_timer_irq_s(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 5)); __asm volatile("csrc " "0x104" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __enable_sw_irq_s(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 1)); __asm volatile("csrs " "0x104" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_sw_irq_s(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1 << 1)); __asm volatile("csrc " "0x104" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_core_irq_s(uint32_t irq)
{
    ({ rv_csr_t __v = (rv_csr_t)(1UL << irq); __asm volatile("csrc " "0x104" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __enable_core_irq_s(uint32_t irq)
{
    ({ rv_csr_t __v = (rv_csr_t)(1UL << irq); __asm volatile("csrs " "0x104" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline uint32_t __get_core_irq_pending_s(uint32_t irq)
{
    return ((({ rv_csr_t __v; __asm volatile("csrr %0, " "0x144" : "=r"(__v) : : "memory"); __v; }) >> irq) & 0x1);
}







__attribute__((always_inline)) static inline void __clear_core_irq_pending_s(uint32_t irq)
{
    ({ rv_csr_t __v = (rv_csr_t)(1UL << irq); __asm volatile("csrc " "0x144" ", %0" : : "rK"(__v) : "memory"); });
}







static inline uint64_t __get_rv_cycle(void)
{

    volatile uint32_t high0, low, high;
    uint64_t full;

    high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb80" : "=r"(__v) : : "memory"); __v; });
    low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb00" : "=r"(__v) : : "memory"); __v; });
    high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb80" : "=r"(__v) : : "memory"); __v; });
    if (high0 != high) {
        low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb00" : "=r"(__v) : : "memory"); __v; });
    }
    full = (((uint64_t)high) << 32) | low;
    return full;





}






__attribute__((always_inline)) static inline void __set_rv_cycle(uint64_t cycle)
{

    ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb00" ", %0" : : "rK"(__v) : "memory"); });
    ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(cycle >> 32)); __asm volatile("csrw " "0xb80" ", %0" : : "rK"(__v) : "memory"); });
    ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(cycle)); __asm volatile("csrw " "0xb00" ", %0" : : "rK"(__v) : "memory"); });




}







static inline uint64_t __get_rv_instret(void)
{

    volatile uint32_t high0, low, high;
    uint64_t full;

    high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb82" : "=r"(__v) : : "memory"); __v; });
    low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb02" : "=r"(__v) : : "memory"); __v; });
    high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb82" : "=r"(__v) : : "memory"); __v; });
    if (high0 != high) {
        low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb02" : "=r"(__v) : : "memory"); __v; });
    }
    full = (((uint64_t)high) << 32) | low;
    return full;





}






__attribute__((always_inline)) static inline void __set_rv_instret(uint64_t instret)
{

    ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb02" ", %0" : : "rK"(__v) : "memory"); });
    ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(instret >> 32)); __asm volatile("csrw " "0xb82" ", %0" : : "rK"(__v) : "memory"); });
    ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(instret)); __asm volatile("csrw " "0xb02" ", %0" : : "rK"(__v) : "memory"); });




}
# 1147 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
static inline uint64_t __get_rv_time(void)
{

    volatile uint32_t high0, low, high;
    uint64_t full;

    high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xc81" : "=r"(__v) : : "memory"); __v; });
    low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xc01" : "=r"(__v) : : "memory"); __v; });
    high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xc81" : "=r"(__v) : : "memory"); __v; });
    if (high0 != high) {
        low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xc01" : "=r"(__v) : : "memory"); __v; });
    }
    full = (((uint64_t)high) << 32) | low;
    return full;





}
# 1176 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline unsigned long __read_cycle_csr()
{
    return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xc00" : "=r"(__v) : : "memory"); __v; });
}
# 1189 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline unsigned long __read_instret_csr()
{
    return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xc02" : "=r"(__v) : : "memory"); __v; });
}
# 1202 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline unsigned long __read_time_csr()
{
    return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xc01" : "=r"(__v) : : "memory"); __v; });
}
# 1214 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline unsigned long __get_cluster_id(void)
{
    unsigned long id;

    id = (({ rv_csr_t __v; __asm volatile("csrr %0, " "0xf14" : "=r"(__v) : : "memory"); __v; }) >> 8) & 0xFF;
    return id;
}
# 1230 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline unsigned long __get_hart_index(void)
{
    unsigned long id;



    id = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xf14" : "=r"(__v) : : "memory"); __v; });

    return id;
}
# 1250 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline unsigned long __get_hart_id(void)
{
    unsigned long id;
    id = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xf14" : "=r"(__v) : : "memory"); __v; });
    return id;
}
# 1266 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline unsigned long __get_cluster_id_s(void)
{
    unsigned long id;

    id = (({ rv_csr_t __v; __asm volatile("csrr %0, " "0xDC0" : "=r"(__v) : : "memory"); __v; }) >> 8) & 0xFF;
    return id;
}
# 1283 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline unsigned long __get_hart_index_s(void)
{
    unsigned long id;



    id = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xDC0" : "=r"(__v) : : "memory"); __v; });

    return id;
}
# 1304 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline unsigned long __get_hart_id_s(void)
{
    unsigned long id;
    id = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xDC0" : "=r"(__v) : : "memory"); __v; });
    return id;
}
# 1371 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline void __EBREAK(void)
{
    __asm volatile("ebreak");
}







__attribute__((always_inline)) static inline void __ECALL(void)
{
    __asm volatile("ecall");
}




typedef enum WFI_SleepMode {
    WFI_SHALLOW_SLEEP = 0,
    WFI_DEEP_SLEEP = 1
} WFI_SleepMode_Type;
# 1402 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline void __set_wfi_sleepmode(WFI_SleepMode_Type mode)
{
    ({ rv_csr_t __v = (rv_csr_t)(mode); __asm volatile("csrw " "0x811" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __TXEVT(void)
{
    ({ rv_csr_t __v = (rv_csr_t)(0x1); __asm volatile("csrs " "0x812" ", %0" : : "rK"(__v) : "memory"); });
}






__attribute__((always_inline)) static inline void __enable_mcycle_counter(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1U << 0)); __asm volatile("csrc " "0x320" ", %0" : : "rK"(__v) : "memory"); });
}






__attribute__((always_inline)) static inline void __disable_mcycle_counter(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1U << 0)); __asm volatile("csrs " "0x320" ", %0" : : "rK"(__v) : "memory"); });
}






__attribute__((always_inline)) static inline void __enable_minstret_counter(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1U << 2)); __asm volatile("csrc " "0x320" ", %0" : : "rK"(__v) : "memory"); });
}






__attribute__((always_inline)) static inline void __disable_minstret_counter(void)
{
    ({ rv_csr_t __v = (rv_csr_t)((1U << 2)); __asm volatile("csrs " "0x320" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __enable_mhpm_counter(unsigned long idx)
{
    ({ rv_csr_t __v = (rv_csr_t)((1UL << idx)); __asm volatile("csrc " "0x320" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_mhpm_counter(unsigned long idx)
{
    ({ rv_csr_t __v = (rv_csr_t)((1UL << idx)); __asm volatile("csrs " "0x320" ", %0" : : "rK"(__v) : "memory"); });
}
# 1487 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline void __enable_mhpm_counters(unsigned long mask)
{
    ({ rv_csr_t __v = (rv_csr_t)(mask); __asm volatile("csrc " "0x320" ", %0" : : "rK"(__v) : "memory"); });
}
# 1499 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline void __disable_mhpm_counters(unsigned long mask)
{
    ({ rv_csr_t __v = (rv_csr_t)(mask); __asm volatile("csrs " "0x320" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __enable_all_counter(void)
{
    ({ rv_csr_t __v = (rv_csr_t)(0xFFFFFFFF); __asm volatile("csrc " "0x320" ", %0" : : "rK"(__v) : "memory"); });
}







__attribute__((always_inline)) static inline void __disable_all_counter(void)
{
    ({ rv_csr_t __v = (rv_csr_t)(0xFFFFFFFF); __asm volatile("csrs " "0x320" ", %0" : : "rK"(__v) : "memory"); });
}
# 1533 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
static inline void __set_hpm_event(unsigned long idx, unsigned long event)
{
    switch (idx) {
        case 3: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x323" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 4: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x324" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 5: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x325" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 6: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x326" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 7: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x327" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 8: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x328" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 9: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x329" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 10: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x32a" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 11: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x32b" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 12: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x32c" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 13: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x32d" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 14: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x32e" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 15: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x32f" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 16: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x330" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 17: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x331" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 18: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x332" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 19: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x333" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 20: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x334" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 21: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x335" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 22: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x336" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 23: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x337" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 24: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x338" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 25: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x339" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 26: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x33a" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 27: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x33b" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 28: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x33c" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 29: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x33d" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 30: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x33e" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 31: ({ rv_csr_t __v = (rv_csr_t)(event); __asm volatile("csrw " "0x33f" ", %0" : : "rK"(__v) : "memory"); }); break;
        default: break;
    }
}
# 1577 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
static inline unsigned long __get_hpm_event(unsigned long idx)
{
    switch (idx) {
        case 3: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x323" : "=r"(__v) : : "memory"); __v; });
        case 4: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x324" : "=r"(__v) : : "memory"); __v; });
        case 5: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x325" : "=r"(__v) : : "memory"); __v; });
        case 6: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x326" : "=r"(__v) : : "memory"); __v; });
        case 7: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x327" : "=r"(__v) : : "memory"); __v; });
        case 8: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x328" : "=r"(__v) : : "memory"); __v; });
        case 9: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x329" : "=r"(__v) : : "memory"); __v; });
        case 10: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x32a" : "=r"(__v) : : "memory"); __v; });
        case 11: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x32b" : "=r"(__v) : : "memory"); __v; });
        case 12: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x32c" : "=r"(__v) : : "memory"); __v; });
        case 13: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x32d" : "=r"(__v) : : "memory"); __v; });
        case 14: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x32e" : "=r"(__v) : : "memory"); __v; });
        case 15: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x32f" : "=r"(__v) : : "memory"); __v; });
        case 16: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x330" : "=r"(__v) : : "memory"); __v; });
        case 17: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x331" : "=r"(__v) : : "memory"); __v; });
        case 18: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x332" : "=r"(__v) : : "memory"); __v; });
        case 19: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x333" : "=r"(__v) : : "memory"); __v; });
        case 20: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x334" : "=r"(__v) : : "memory"); __v; });
        case 21: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x335" : "=r"(__v) : : "memory"); __v; });
        case 22: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x336" : "=r"(__v) : : "memory"); __v; });
        case 23: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x337" : "=r"(__v) : : "memory"); __v; });
        case 24: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x338" : "=r"(__v) : : "memory"); __v; });
        case 25: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x339" : "=r"(__v) : : "memory"); __v; });
        case 26: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x33a" : "=r"(__v) : : "memory"); __v; });
        case 27: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x33b" : "=r"(__v) : : "memory"); __v; });
        case 28: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x33c" : "=r"(__v) : : "memory"); __v; });
        case 29: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x33d" : "=r"(__v) : : "memory"); __v; });
        case 30: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x33e" : "=r"(__v) : : "memory"); __v; });
        case 31: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0x33f" : "=r"(__v) : : "memory"); __v; });
        default: return 0;
    }
}
# 1620 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
static inline void __set_hpm_counter(unsigned long idx, uint64_t value)
{
    switch (idx) {

        case 3: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb03" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb83" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb03" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 4: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb04" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb84" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb04" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 5: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb05" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb85" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb05" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 6: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb06" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb86" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb06" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 7: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb07" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb87" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb07" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 8: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb08" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb88" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb08" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 9: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb09" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb89" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb09" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 10: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb0a" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb8a" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb0a" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 11: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb0b" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb8b" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb0b" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 12: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb0c" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb8c" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb0c" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 13: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb0d" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb8d" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb0d" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 14: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb0e" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb8e" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb0e" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 15: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb0f" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb8f" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb0f" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 16: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb10" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb90" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb10" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 17: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb11" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb91" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb11" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 18: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb12" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb92" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb12" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 19: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb13" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb93" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb13" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 20: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb14" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb94" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb14" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 21: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb15" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb95" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb15" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 22: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb16" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb96" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb16" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 23: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb17" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb97" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb17" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 24: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb18" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb98" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb18" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 25: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb19" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb99" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb19" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 26: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb1a" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb9a" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb1a" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 27: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb1b" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb9b" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb1b" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 28: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb1c" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb9c" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb1c" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 29: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb1d" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb9d" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb1d" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 30: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb1e" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb9e" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb1e" ", %0" : : "rK"(__v) : "memory"); }); break;
        case 31: ({ rv_csr_t __v = (rv_csr_t)(0); __asm volatile("csrw " "0xb1f" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value >> 32)); __asm volatile("csrw " "0xb9f" ", %0" : : "rK"(__v) : "memory"); });
            ({ rv_csr_t __v = (rv_csr_t)((uint32_t)(value)); __asm volatile("csrw " "0xb1f" ", %0" : : "rK"(__v) : "memory"); }); break;
# 1745 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
        default: break;
    }
}
# 1756 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
static inline uint64_t __get_hpm_counter(unsigned long idx)
{

    volatile uint32_t high0, low, high;
    uint64_t full;

    switch (idx) {
        case 0: return __get_rv_cycle();
        case 2: return __get_rv_instret();
        case 3: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb83" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb03" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb83" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb03" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 4: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb84" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb04" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb84" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb04" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 5: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb85" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb05" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb85" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb05" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 6: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb86" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb06" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb86" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb06" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 7: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb87" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb07" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb87" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb07" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 8: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb88" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb08" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb88" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb08" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 9: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb89" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb09" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb89" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb09" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 10: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8a" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0a" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8a" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0a" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 11: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8b" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0b" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8b" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0b" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 12: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8c" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0c" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8c" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0c" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 13: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8d" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0d" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8d" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0d" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 14: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8e" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0e" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8e" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0e" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 15: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8f" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0f" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb8f" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0f" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 16: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb90" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb10" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb90" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb10" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 17: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb91" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb11" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb91" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb11" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 18: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb92" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb12" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb92" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb12" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 19: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb93" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb13" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb93" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb13" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 20: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb94" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb14" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb94" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb14" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 21: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb95" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb15" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb95" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb15" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 22: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb96" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb16" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb96" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb16" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 23: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb97" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb17" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb97" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb17" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 24: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb98" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb18" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb98" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb18" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 25: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb99" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb19" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb99" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb19" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 26: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9a" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1a" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9a" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1a" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 27: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9b" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1b" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9b" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1b" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 28: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9c" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1c" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9c" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1c" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 29: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9d" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1d" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9d" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1d" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 30: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9e" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1e" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9e" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1e" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
        case 31: high0 = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9f" : "=r"(__v) : : "memory"); __v; });
            low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1f" : "=r"(__v) : : "memory"); __v; });
            high = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb9f" : "=r"(__v) : : "memory"); __v; });
            if (high0 != high) { low = ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1f" : "=r"(__v) : : "memory"); __v; }); }
            full = (((uint64_t)high) << 32) | low; return full;
# 1948 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
        default: return 0;
    }
}
# 1960 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
static inline unsigned long __read_hpm_counter(unsigned long idx)
{
    switch (idx) {
        case 0: return __read_cycle_csr();
        case 2: return __read_instret_csr();
        case 3: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb03" : "=r"(__v) : : "memory"); __v; });
        case 4: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb04" : "=r"(__v) : : "memory"); __v; });
        case 5: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb05" : "=r"(__v) : : "memory"); __v; });
        case 6: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb06" : "=r"(__v) : : "memory"); __v; });
        case 7: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb07" : "=r"(__v) : : "memory"); __v; });
        case 8: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb08" : "=r"(__v) : : "memory"); __v; });
        case 9: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb09" : "=r"(__v) : : "memory"); __v; });
        case 10: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0a" : "=r"(__v) : : "memory"); __v; });
        case 11: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0b" : "=r"(__v) : : "memory"); __v; });
        case 12: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0c" : "=r"(__v) : : "memory"); __v; });
        case 13: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0d" : "=r"(__v) : : "memory"); __v; });
        case 14: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0e" : "=r"(__v) : : "memory"); __v; });
        case 15: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb0f" : "=r"(__v) : : "memory"); __v; });
        case 16: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb10" : "=r"(__v) : : "memory"); __v; });
        case 17: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb11" : "=r"(__v) : : "memory"); __v; });
        case 18: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb12" : "=r"(__v) : : "memory"); __v; });
        case 19: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb13" : "=r"(__v) : : "memory"); __v; });
        case 20: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb14" : "=r"(__v) : : "memory"); __v; });
        case 21: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb15" : "=r"(__v) : : "memory"); __v; });
        case 22: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb16" : "=r"(__v) : : "memory"); __v; });
        case 23: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb17" : "=r"(__v) : : "memory"); __v; });
        case 24: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb18" : "=r"(__v) : : "memory"); __v; });
        case 25: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb19" : "=r"(__v) : : "memory"); __v; });
        case 26: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1a" : "=r"(__v) : : "memory"); __v; });
        case 27: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1b" : "=r"(__v) : : "memory"); __v; });
        case 28: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1c" : "=r"(__v) : : "memory"); __v; });
        case 29: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1d" : "=r"(__v) : : "memory"); __v; });
        case 30: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1e" : "=r"(__v) : : "memory"); __v; });
        case 31: return ({ rv_csr_t __v; __asm volatile("csrr %0, " "0xb1f" : "=r"(__v) : : "memory"); __v; });
        default: return 0;
    }
}
# 2005 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline void __set_medeleg(unsigned long mask)
{
    ({ rv_csr_t __v = (rv_csr_t)(mask); __asm volatile("csrw " "0x302" ", %0" : : "rK"(__v) : "memory"); });
}
# 2017 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline void __set_mideleg(unsigned long mask)
{
    ({ rv_csr_t __v = (rv_csr_t)(mask); __asm volatile("csrw " "0x303" ", %0" : : "rK"(__v) : "memory"); });
}
# 2040 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline void __FENCE_I(void)
{
    __asm volatile("fence.i");
}
# 2074 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline uint8_t __LB(volatile void *addr)
{
    uint8_t result;

    __asm volatile ("lb %0, 0(%1)" : "=r" (result) : "r" (addr));
    return result;
}







__attribute__((always_inline)) static inline uint16_t __LH(volatile void *addr)
{
    uint16_t result;

    __asm volatile ("lh %0, 0(%1)" : "=r" (result) : "r" (addr));
    return result;
}







__attribute__((always_inline)) static inline uint32_t __LW(volatile void *addr)
{
    uint32_t result;

    __asm volatile ("lw %0, 0(%1)" : "=r" (result) : "r" (addr));
    return result;
}
# 2132 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
__attribute__((always_inline)) static inline void __SB(volatile void *addr, uint8_t val)
{
    __asm volatile ("sb %0, 0(%1)" : : "r" (val), "r" (addr));
}







__attribute__((always_inline)) static inline void __SH(volatile void *addr, uint16_t val)
{
    __asm volatile ("sh %0, 0(%1)" : : "r" (val), "r" (addr));
}







__attribute__((always_inline)) static inline void __SW(volatile void *addr, uint32_t val)
{
    __asm volatile ("sw %0, 0(%1)" : : "r" (val), "r" (addr));
}
# 2183 "libraries\\NMSIS\\Core\\Include/core_feature_base.h"
static inline uint32_t __CAS_W(volatile uint32_t *addr, uint32_t oldval, uint32_t newval)
{
    uint32_t result;
    uint32_t rc;

    __asm volatile (
            "0:     lr.w %0, %2      \n"
            "       bne  %0, %z3, 1f \n"
            "       sc.w %1, %z4, %2 \n"
            "       bnez %1, 0b      \n"
            "1:\n"
            : "=&r"(result), "=&r"(rc), "+A"(*addr)
            : "r"(oldval), "r"(newval)
            : "memory");
    return result;
}
# 79 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2


# 1 "libraries\\NMSIS\\Core\\Include/core_feature_fpu.h" 1
# 82 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2

# 1 "libraries\\NMSIS\\Core\\Include/core_feature_dsp.h" 1
# 84 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2

# 1 "libraries\\NMSIS\\Core\\Include/core_feature_vector.h" 1
# 86 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2

# 1 "libraries\\NMSIS\\Core\\Include/core_feature_bitmanip.h" 1
# 88 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2

# 1 "libraries\\NMSIS\\Core\\Include/core_feature_pmp.h" 1
# 36 "libraries\\NMSIS\\Core\\Include/core_feature_pmp.h"
# 1 "libraries\\NMSIS\\Core\\Include/core_compatiable.h" 1
# 75 "libraries\\NMSIS\\Core\\Include/core_compatiable.h"
static inline int32_t __SSAT(int32_t val, uint32_t sat)
{
    if ((sat >= 1U) && (sat <= 32U)) {
        const int32_t max = (int32_t)((1U << (sat - 1U)) - 1U);
        const int32_t min = -1 - max ;
        if (val > max) {
            return max;
        } else if (val < min) {
            return min;
        }
    }
    return val;
}
# 100 "libraries\\NMSIS\\Core\\Include/core_compatiable.h"
static inline uint32_t __USAT(int32_t val, uint32_t sat)
{
    if (sat <= 31U) {
        const uint32_t max = ((1U << sat) - 1U);
        if (val > (int32_t)max) {
            return max;
        } else if (val < 0) {
            return 0U;
        }
    }
    return (uint32_t)val;
}
# 122 "libraries\\NMSIS\\Core\\Include/core_compatiable.h"
__attribute__((always_inline)) static inline uint32_t __REV(uint32_t value)
{
    uint32_t result;

    result = ((value & 0xff000000) >> 24)
        | ((value & 0x00ff0000) >> 8 )
        | ((value & 0x0000ff00) << 8 )
        | ((value & 0x000000ff) << 24);
    return result;
}
# 140 "libraries\\NMSIS\\Core\\Include/core_compatiable.h"
__attribute__((always_inline)) static inline uint32_t __REV16(uint32_t value)
{
    uint32_t result;
    result = ((value & 0xff000000) >> 8)
        | ((value & 0x00ff0000) << 8 )
        | ((value & 0x0000ff00) >> 8 )
        | ((value & 0x000000ff) << 8) ;

    return result;
}
# 159 "libraries\\NMSIS\\Core\\Include/core_compatiable.h"
__attribute__((always_inline)) static inline int16_t __REVSH(int16_t value)
{
    int16_t result;
    result = ((value & 0xff00) >> 8) | ((value & 0x00ff) << 8);
    return result;
}
# 174 "libraries\\NMSIS\\Core\\Include/core_compatiable.h"
__attribute__((always_inline)) static inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
    op2 = op2 & 0x1F;
    if (op2 == 0U) {
      return op1;
    }
    return (op1 >> op2) | (op1 << (32U - op2));
}
# 191 "libraries\\NMSIS\\Core\\Include/core_compatiable.h"
static inline uint64_t __ROR64(uint64_t op1, uint32_t op2)
{
    op2 = op2 & 0x1F;
    if (op2 == 0U) {
      return op1;
    }
    uint32_t tmp1 = (uint32_t)op1;
    uint32_t tmp2 = (uint32_t)(op1 >> 32);
    return (uint64_t)((tmp1 >> op2) | (tmp1 << (32U - op2)))
           | ((uint64_t)((tmp2 >> op2) | (tmp2 << (32U - op2))) << 32);
}
# 212 "libraries\\NMSIS\\Core\\Include/core_compatiable.h"
static inline uint32_t __RBIT(uint32_t value)
{
    uint32_t result;
    uint32_t s = (4U * 8U) - 1U;

    result = value;
    for (value >>= 1U; value != 0U; value >>= 1U) {
        result <<= 1U;
        result |= value & 1U;
        s--;
    }
    result <<= s;
    return result;
}
# 237 "libraries\\NMSIS\\Core\\Include/core_compatiable.h"
static inline uint8_t __CLZ(uint32_t data)
{
    uint8_t ret = 0;
    uint32_t temp = ~data;
    while (temp & 0x80000000) {
          temp <<= 1;
          ret++;
    }
    return ret;
}
# 257 "libraries\\NMSIS\\Core\\Include/core_compatiable.h"
static inline unsigned long __CTZ(unsigned long data)
{
    unsigned long ret = 0;

    while (!(data & 1UL)) {
        ret++;
        data = data >> 1;
    }

    return ret;
}
# 37 "libraries\\NMSIS\\Core\\Include/core_feature_pmp.h" 2
# 90 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2

# 1 "libraries\\NMSIS\\Core\\Include/core_feature_spmp.h" 1
# 92 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2

# 1 "libraries\\NMSIS\\Core\\Include/core_feature_cache.h" 1
# 94 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2

# 1 "libraries\\NMSIS\\Core\\Include/core_feature_cidu.h" 1
# 96 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2

# 1 "libraries\\NMSIS\\Core\\Include/core_feature_pma.h" 1
# 98 "libraries\\NMSIS\\Core\\Include/nmsis_core.h" 2
# 119 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h" 2




# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 1 3
# 10 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\_ansi.h" 1 3
# 10 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\_ansi.h" 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\newlib.h" 1 3
# 11 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\_ansi.h" 2 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\config.h" 1 3



# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\ieeefp.h" 1 3
# 5 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\config.h" 2 3
# 12 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\_ansi.h" 2 3
# 11 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 2 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 1 3
# 13 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\_ansi.h" 1 3
# 14 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 2 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 1 3 4
# 145 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 3 4

# 145 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 3 4
typedef int ptrdiff_t;
# 214 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 3 4
typedef unsigned int size_t;
# 329 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 3 4
typedef int wchar_t;
# 424 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 435 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 3 4
} max_align_t;
# 15 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 2 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_types.h" 1 3
# 24 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_types.h" 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 1 3 4
# 359 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 3 4
typedef unsigned int wint_t;
# 25 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_types.h" 2 3


# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\_types.h" 1 3
# 28 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;



typedef long _off_t;





typedef int __pid_t;



typedef short __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;







typedef unsigned short __ino_t;
# 90 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;







typedef long _fpos_t;
# 131 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_types.h" 3
typedef unsigned int __size_t;
# 147 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_types.h" 3
typedef signed int _ssize_t;
# 158 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\_types.h" 3
typedef _ssize_t __ssize_t;



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;







typedef __builtin_va_list __va_list;
# 16 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 2 3






typedef unsigned long __ULong;
# 34 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\lock.h" 1 3
# 33 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\lock.h" 3
struct __lock;
typedef struct __lock * _LOCK_T;






extern void __retarget_lock_init(_LOCK_T *lock);

extern void __retarget_lock_init_recursive(_LOCK_T *lock);

extern void __retarget_lock_close(_LOCK_T lock);

extern void __retarget_lock_close_recursive(_LOCK_T lock);

extern void __retarget_lock_acquire(_LOCK_T lock);

extern void __retarget_lock_acquire_recursive(_LOCK_T lock);

extern int __retarget_lock_try_acquire(_LOCK_T lock);

extern int __retarget_lock_try_acquire_recursive(_LOCK_T lock);


extern void __retarget_lock_release(_LOCK_T lock);

extern void __retarget_lock_release_recursive(_LOCK_T lock);
# 35 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 2 3
typedef _LOCK_T _flock_t;







struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 98 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 122 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 186 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  _ssize_t (*_read) (struct _reent *, void *,
        char *, int);
  _ssize_t (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 292 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 324 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 613 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**_sig_func)(int);




  struct _glue __sglue;

  __FILE __sf[3];

};
# 819 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 12 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 2 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\cdefs.h" 1 3
# 47 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\cdefs.h" 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 1 3 4
# 48 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\cdefs.h" 2 3
# 13 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 2 3




# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\stddef.h" 1 3 4
# 18 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 2 3
# 27 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 3


void * memchr (const void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void * memcpy (void *restrict, const void *restrict, size_t);
void * memmove (void *, const void *, size_t);
void * memset (void *, int, size_t);
char *strcat (char *restrict, const char *restrict);
char *strchr (const char *, int);
int strcmp (const char *, const char *);
int strcoll (const char *, const char *);
char *strcpy (char *restrict, const char *restrict);
size_t strcspn (const char *, const char *);
char *strerror (int);
size_t strlen (const char *);
char *strncat (char *restrict, const char *restrict, size_t);
int strncmp (const char *, const char *, size_t);
char *strncpy (char *restrict, const char *restrict, size_t);
char *strpbrk (const char *, const char *);
char *strrchr (const char *, int);
size_t strspn (const char *, const char *);
char *strstr (const char *, const char *);

char *strtok (char *restrict, const char *restrict);

size_t strxfrm (char *restrict, const char *restrict, size_t);
# 86 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 3
char *_strdup_r (struct _reent *, const char *);



char *_strndup_r (struct _reent *, const char *, size_t);
# 112 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 3
char * _strerror_r (struct _reent *, int, int, int *);
# 175 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 3
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\string.h" 1 3
# 15 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\string.h" 3
static __inline unsigned long __libc_detect_null(unsigned long w)
{
  unsigned long mask = 0x7f7f7f7f;
  if (sizeof (long) == 8)
    mask = ((mask << 16) << 16) | mask;
  return ~(((w & mask) + mask) | w | mask);
}
# 176 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\string.h" 2 3


# 124 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h" 2
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\math.h" 1 3






# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\machine\\ieeefp.h" 1 3
# 8 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\math.h" 2 3



# 86 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\math.h" 3
extern double atan (double);
extern double cos (double);
extern double sin (double);
extern double tan (double);
extern double tanh (double);
extern double frexp (double, int *);
extern double modf (double, double *);
extern double ceil (double);
extern double fabs (double);
extern double floor (double);






extern double acos (double);
extern double asin (double);
extern double atan2 (double, double);
extern double cosh (double);
extern double sinh (double);
extern double exp (double);
extern double ldexp (double, int);
extern double log (double);
extern double log10 (double);
extern double pow (double, double);
extern double sqrt (double);
extern double fmod (double, double);
# 160 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\math.h" 3
    typedef float float_t;
    typedef double double_t;
# 214 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\math.h" 3
extern int __isinff (float);
extern int __isinfd (double);
extern int __isnanf (float);
extern int __isnand (double);
extern int __fpclassifyf (float);
extern int __fpclassifyd (double);
extern int __signbitf (float);
extern int __signbitd (double);
# 310 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\math.h" 3
extern double infinity (void);
extern double nan (const char *);
extern double copysign (double, double);
extern double logb (double);
extern int ilogb (double);

extern double asinh (double);
extern double cbrt (double);
extern double nextafter (double, double);
extern double rint (double);
extern double scalbn (double, int);

extern double exp2 (double);
extern double scalbln (double, long int);
extern double tgamma (double);
extern double nearbyint (double);
extern long int lrint (double);
extern long long int llrint (double);
extern double round (double);
extern long int lround (double);
extern long long int llround (double);
extern double trunc (double);
extern double remquo (double, double, int *);
extern double fdim (double, double);
extern double fmax (double, double);
extern double fmin (double, double);
extern double fma (double, double, double);


extern double log1p (double);
extern double expm1 (double);



extern double acosh (double);
extern double atanh (double);
extern double remainder (double, double);
extern double gamma (double);
extern double lgamma (double);
extern double erf (double);
extern double erfc (double);
extern double log2 (double);





extern double hypot (double, double);






extern float atanf (float);
extern float cosf (float);
extern float sinf (float);
extern float tanf (float);
extern float tanhf (float);
extern float frexpf (float, int *);
extern float modff (float, float *);
extern float ceilf (float);
extern float fabsf (float);
extern float floorf (float);


extern float acosf (float);
extern float asinf (float);
extern float atan2f (float, float);
extern float coshf (float);
extern float sinhf (float);
extern float expf (float);
extern float ldexpf (float, int);
extern float logf (float);
extern float log10f (float);
extern float powf (float, float);
extern float sqrtf (float);
extern float fmodf (float, float);




extern float exp2f (float);
extern float scalblnf (float, long int);
extern float tgammaf (float);
extern float nearbyintf (float);
extern long int lrintf (float);
extern long long int llrintf (float);
extern float roundf (float);
extern long int lroundf (float);
extern long long int llroundf (float);
extern float truncf (float);
extern float remquof (float, float, int *);
extern float fdimf (float, float);
extern float fmaxf (float, float);
extern float fminf (float, float);
extern float fmaf (float, float, float);

extern float infinityf (void);
extern float nanf (const char *);
extern float copysignf (float, float);
extern float logbf (float);
extern int ilogbf (float);

extern float asinhf (float);
extern float cbrtf (float);
extern float nextafterf (float, float);
extern float rintf (float);
extern float scalbnf (float, int);
extern float log1pf (float);
extern float expm1f (float);


extern float acoshf (float);
extern float atanhf (float);
extern float remainderf (float, float);
extern float gammaf (float);
extern float lgammaf (float);
extern float erff (float);
extern float erfcf (float);
extern float log2f (float);
extern float hypotf (float, float);
# 510 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\math.h" 3
extern long double hypotl (long double, long double);
extern long double sqrtl (long double);
extern long double frexpl (long double, int *);
# 628 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\math.h" 3

# 125 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h" 2
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include\\float.h" 1 3 4
# 126 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h" 2
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include-fixed\\limits.h" 1 3 4
# 34 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include-fixed\\limits.h" 3 4
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include-fixed\\syslimits.h" 1 3 4






# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include-fixed\\limits.h" 1 3 4
# 203 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include-fixed\\limits.h" 3 4
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\limits.h" 1 3 4





# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\sys\\syslimits.h" 1 3 4
# 7 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\riscv-wch-elf\\include\\limits.h" 2 3 4
# 204 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include-fixed\\limits.h" 2 3 4
# 8 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include-fixed\\syslimits.h" 2 3 4
# 35 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include-fixed\\limits.h" 2 3 4
# 127 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h" 2

# 1 "libraries\\NMSIS\\DSP\\Include/riscv_math_types_f16.h" 1
# 129 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h" 2
# 200 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h"
#pragma GCC diagnostic pop
# 237 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h"
  
# 237 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h"
 typedef int8_t q7_t;




  typedef int16_t q15_t;




  typedef int32_t q31_t;




  typedef int64_t q63_t;




  typedef float float32_t;




  typedef double float64_t;







  typedef enum
  {
    RISCV_MATH_SUCCESS = 0,
    RISCV_MATH_ARGUMENT_ERROR = -1,
    RISCV_MATH_LENGTH_ERROR = -2,
    RISCV_MATH_SIZE_MISMATCH = -3,
    RISCV_MATH_NANINF = -4,
    RISCV_MATH_SINGULAR = -5,
    RISCV_MATH_TEST_FAILURE = -6,
    RISCV_MATH_DECOMPOSITION_FAILURE = -7
  } riscv_status;
# 32 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h" 2
# 1 "libraries\\NMSIS\\DSP\\Include/riscv_math_memory.h" 1
# 31 "libraries\\NMSIS\\DSP\\Include/riscv_math_memory.h"
# 1 "libraries\\NMSIS\\DSP\\Include/riscv_math_types.h" 1
# 32 "libraries\\NMSIS\\DSP\\Include/riscv_math_memory.h" 2
# 73 "libraries\\NMSIS\\DSP\\Include/riscv_math_memory.h"
__attribute__((always_inline)) static inline q63_t read_q31x2 (
  q31_t const * pQ31)
{
  q63_t val;




  val = *((q63_t *)pQ31);




  return (val);
}






__attribute__((always_inline)) static inline q63_t read_q31x2_ia (
  q31_t ** pQ31)
{
  q63_t val;

  val = read_q31x2(*pQ31);
  *pQ31 += 2;

  return (val);
}






__attribute__((always_inline)) static inline q63_t read_q31x2_da (
  q31_t ** pQ31)
{
  q63_t val;

  val = read_q31x2(*pQ31);
  *pQ31 -= 2;

  return (val);
}






__attribute__((always_inline)) static inline void write_q31x2 (
  q31_t * pQ31,
  q63_t value)
{




  *((q63_t *)pQ31) = value;




}






__attribute__((always_inline)) static inline void write_q31x2_ia (
  q31_t ** pQ31,
  q63_t value)
{
  write_q31x2(*pQ31, value);
  *pQ31 += 2;
}






__attribute__((always_inline)) static inline q31_t read_q15x2 (
  q15_t const * pQ15)
{
  q31_t val;




  val = __LW((q15_t *)pQ15);


  return (val);
}






__attribute__((always_inline)) static inline q31_t read_q15x2_ia (
  q15_t ** pQ15)
{
  q31_t val;

  val = read_q15x2(*pQ15);
  *pQ15 += 2;

  return (val);
}






__attribute__((always_inline)) static inline q31_t read_q15x2_da (
  q15_t ** pQ15)
{
  q31_t val;

  val = read_q15x2(*pQ15);
  *pQ15 -= 2;

  return (val);
}






__attribute__((always_inline)) static inline void write_q15x2 (
  q15_t * pQ15,
  q31_t value)
{



  __SW(pQ15, value);

}






__attribute__((always_inline)) static inline void write_q15x2_ia (
  q15_t ** pQ15,
  q31_t value)
{
  write_q15x2(*pQ15, value);
  *pQ15 += 2;
}






__attribute__((always_inline)) static inline void write_q15x4 (
  q15_t * pQ15,
  q63_t value)
{




  *((q63_t *)pQ15) = value;




}






__attribute__((always_inline)) static inline void write_q15x4_ia (
  q15_t ** pQ15,
  q63_t value)
{
  write_q15x4(*pQ15, value);
  *pQ15 += 4;
}






__attribute__((always_inline)) static inline void write_q15x4_da (
  q15_t ** pQ15,
  q63_t value)
{
  write_q15x4(*pQ15, value);
  *pQ15 -= 4;
}






__attribute__((always_inline)) static inline q63_t read_q15x4 (
  q15_t const * pQ15)
{
  q63_t val;




  val = *((q63_t *)pQ15);




  return (val);
}






__attribute__((always_inline)) static inline q63_t read_q15x4_ia (
  q15_t ** pQ15)
{
  q63_t val;

  val = read_q15x4(*pQ15);
  *pQ15 += 4;

  return (val);
}






__attribute__((always_inline)) static inline q63_t read_q15x4_da (
  q15_t ** pQ15)
{
  q63_t val;

  val = read_q15x4(*pQ15);
  *pQ15 -= 4;

  return (val);
}






__attribute__((always_inline)) static inline q31_t read_q7x4 (
  q7_t const * pQ7)
{
  q31_t val;




  val = __LW((q7_t *)pQ7);


  return (val);
}






__attribute__((always_inline)) static inline q31_t read_q7x4_ia (
  q7_t ** pQ7)
{
  q31_t val;

  val = read_q7x4(*pQ7);
  *pQ7 += 4;

  return (val);
}






__attribute__((always_inline)) static inline q31_t read_q7x4_da (
  q7_t ** pQ7)
{
  q31_t val;

  val = read_q7x4(*pQ7);
  *pQ7 -= 4;

  return (val);
}






__attribute__((always_inline)) static inline q63_t read_q7x8 (
  q7_t const * pQ7)
{
 q63_t val;




  val = *((q63_t *)pQ7);





  return val;
}






__attribute__((always_inline)) static inline q63_t read_q7x8_ia (
  q7_t ** pQ7)
{
  q63_t val;

  val = read_q7x8(*pQ7);
  *pQ7 += 8;

  return val;
}






__attribute__((always_inline)) static inline q63_t read_q7x8_da (
  q7_t ** pQ7)
{
  q63_t val;

  val = read_q7x8(*pQ7);
  *pQ7 -= 8;

  return val;
}






__attribute__((always_inline)) static inline void write_q7x4 (
  q7_t * pQ7,
  q31_t value)
{
  q31_t val = value;



  __SW(pQ7, val);

}






__attribute__((always_inline)) static inline void write_q7x4_ia (
  q7_t ** pQ7,
  q31_t value)
{
  write_q7x4(*pQ7, value);
  *pQ7 += 4;
}






__attribute__((always_inline)) static inline void write_q7x8_ia (
  q7_t ** pQ7,
  q63_t value)
{




  *((q63_t *)*pQ7) = value;




  *pQ7 += 8;
}
# 33 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h" 2

# 1 "libraries\\NMSIS\\DSP\\Include/dsp/none.h" 1
# 137 "libraries\\NMSIS\\DSP\\Include/dsp/none.h"
  __attribute__((always_inline)) static inline q31_t clip_q63_to_q31(
  q63_t x)
  {
    return ((q31_t) (x >> 32) != ((q31_t) x >> 31)) ?
      ((0x7FFFFFFF ^ ((q31_t) (x >> 63)))) : (q31_t) x;
  }




  __attribute__((always_inline)) static inline q15_t clip_q63_to_q15(
  q63_t x)
  {
    return ((q31_t) (x >> 32) != ((q31_t) x >> 31)) ?
      ((0x7FFF ^ ((q15_t) (x >> 63)))) : (q15_t) (x >> 15);
  }




  __attribute__((always_inline)) static inline q7_t clip_q31_to_q7(
  q31_t x)
  {
    return ((q31_t) (x >> 24) != ((q31_t) x >> 23)) ?
      ((0x7F ^ ((q7_t) (x >> 31)))) : (q7_t) x;
  }




  __attribute__((always_inline)) static inline q15_t clip_q31_to_q15(
  q31_t x)
  {
    return ((q31_t) (x >> 16) != ((q31_t) x >> 15)) ?
      ((0x7FFF ^ ((q15_t) (x >> 31)))) : (q15_t) x;
  }




  __attribute__((always_inline)) static inline q63_t mult32x64(
  q63_t x,
  q31_t y)
  {
    return ((((q63_t) (x & 0x00000000FFFFFFFF) * y) >> 32) +
            (((q63_t) (x >> 32) * y) ) );
  }
# 237 "libraries\\NMSIS\\DSP\\Include/dsp/none.h"
  __attribute__((always_inline)) static inline uint32_t __QADD8(
  uint32_t x,
  uint32_t y)
  {
    q31_t r, s, t, u;

    r = __SSAT(((((q31_t)x << 24) >> 24) + (((q31_t)y << 24) >> 24)), 8) & (int32_t)0x000000FF;
    s = __SSAT(((((q31_t)x << 16) >> 24) + (((q31_t)y << 16) >> 24)), 8) & (int32_t)0x000000FF;
    t = __SSAT(((((q31_t)x << 8) >> 24) + (((q31_t)y << 8) >> 24)), 8) & (int32_t)0x000000FF;
    u = __SSAT(((((q31_t)x ) >> 24) + (((q31_t)y ) >> 24)), 8) & (int32_t)0x000000FF;

    return ((uint32_t)((u << 24) | (t << 16) | (s << 8) | (r )));
  }





  __attribute__((always_inline)) static inline uint32_t __QSUB8(
  uint32_t x,
  uint32_t y)
  {
    q31_t r, s, t, u;

    r = __SSAT(((((q31_t)x << 24) >> 24) - (((q31_t)y << 24) >> 24)), 8) & (int32_t)0x000000FF;
    s = __SSAT(((((q31_t)x << 16) >> 24) - (((q31_t)y << 16) >> 24)), 8) & (int32_t)0x000000FF;
    t = __SSAT(((((q31_t)x << 8) >> 24) - (((q31_t)y << 8) >> 24)), 8) & (int32_t)0x000000FF;
    u = __SSAT(((((q31_t)x ) >> 24) - (((q31_t)y ) >> 24)), 8) & (int32_t)0x000000FF;

    return ((uint32_t)((u << 24) | (t << 16) | (s << 8) | (r )));
  }





  __attribute__((always_inline)) static inline uint32_t __QADD16(
  uint32_t x,
  uint32_t y)
  {

    q31_t r = 0, s = 0;

    r = __SSAT(((((q31_t)x << 16) >> 16) + (((q31_t)y << 16) >> 16)), 16) & (int32_t)0x0000FFFF;
    s = __SSAT(((((q31_t)x ) >> 16) + (((q31_t)y ) >> 16)), 16) & (int32_t)0x0000FFFF;

    return ((uint32_t)((s << 16) | (r )));
  }





  __attribute__((always_inline)) static inline uint32_t __SHADD16(
  uint32_t x,
  uint32_t y)
  {
    q31_t r, s;

    r = (((((q31_t)x << 16) >> 16) + (((q31_t)y << 16) >> 16)) >> 1) & (int32_t)0x0000FFFF;
    s = (((((q31_t)x ) >> 16) + (((q31_t)y ) >> 16)) >> 1) & (int32_t)0x0000FFFF;

    return ((uint32_t)((s << 16) | (r )));
  }





  __attribute__((always_inline)) static inline uint32_t __QSUB16(
  uint32_t x,
  uint32_t y)
  {
    q31_t r, s;

    r = __SSAT(((((q31_t)x << 16) >> 16) - (((q31_t)y << 16) >> 16)), 16) & (int32_t)0x0000FFFF;
    s = __SSAT(((((q31_t)x ) >> 16) - (((q31_t)y ) >> 16)), 16) & (int32_t)0x0000FFFF;

    return ((uint32_t)((s << 16) | (r )));
  }





  __attribute__((always_inline)) static inline uint32_t __SHSUB16(
  uint32_t x,
  uint32_t y)
  {
    q31_t r, s;

    r = (((((q31_t)x << 16) >> 16) - (((q31_t)y << 16) >> 16)) >> 1) & (int32_t)0x0000FFFF;
    s = (((((q31_t)x ) >> 16) - (((q31_t)y ) >> 16)) >> 1) & (int32_t)0x0000FFFF;

    return ((uint32_t)((s << 16) | (r )));
  }





  __attribute__((always_inline)) static inline uint32_t __QASX(
  uint32_t x,
  uint32_t y)
  {
    q31_t r, s;

    r = __SSAT(((((q31_t)x << 16) >> 16) - (((q31_t)y ) >> 16)), 16) & (int32_t)0x0000FFFF;
    s = __SSAT(((((q31_t)x ) >> 16) + (((q31_t)y << 16) >> 16)), 16) & (int32_t)0x0000FFFF;

    return ((uint32_t)((s << 16) | (r )));
  }





  __attribute__((always_inline)) static inline uint32_t __SHASX(
  uint32_t x,
  uint32_t y)
  {
    q31_t r, s;

    r = (((((q31_t)x << 16) >> 16) - (((q31_t)y ) >> 16)) >> 1) & (int32_t)0x0000FFFF;
    s = (((((q31_t)x ) >> 16) + (((q31_t)y << 16) >> 16)) >> 1) & (int32_t)0x0000FFFF;

    return ((uint32_t)((s << 16) | (r )));
  }





  __attribute__((always_inline)) static inline uint32_t __QSAX(
  uint32_t x,
  uint32_t y)
  {
    q31_t r, s;

    r = __SSAT(((((q31_t)x << 16) >> 16) + (((q31_t)y ) >> 16)), 16) & (int32_t)0x0000FFFF;
    s = __SSAT(((((q31_t)x ) >> 16) - (((q31_t)y << 16) >> 16)), 16) & (int32_t)0x0000FFFF;

    return ((uint32_t)((s << 16) | (r )));
  }





  __attribute__((always_inline)) static inline uint32_t __SHSAX(
  uint32_t x,
  uint32_t y)
  {
    q31_t r, s;

    r = (((((q31_t)x << 16) >> 16) + (((q31_t)y ) >> 16)) >> 1) & (int32_t)0x0000FFFF;
    s = (((((q31_t)x ) >> 16) - (((q31_t)y << 16) >> 16)) >> 1) & (int32_t)0x0000FFFF;

    return ((uint32_t)((s << 16) | (r )));
  }





  __attribute__((always_inline)) static inline uint32_t __SMUSDX(
  uint32_t x,
  uint32_t y)
  {
    return ((uint32_t)(((((q31_t)x << 16) >> 16) * (((q31_t)y ) >> 16)) -
                       ((((q31_t)x ) >> 16) * (((q31_t)y << 16) >> 16)) ));
  }




  __attribute__((always_inline)) static inline uint32_t __SMUADX(
  uint32_t x,
  uint32_t y)
  {
    return ((uint32_t)(((((q31_t)x << 16) >> 16) * (((q31_t)y ) >> 16)) +
                       ((((q31_t)x ) >> 16) * (((q31_t)y << 16) >> 16)) ));
  }





  __attribute__((always_inline)) static inline int32_t __QADD(
  int32_t x,
  int32_t y)
  {
    return ((int32_t)(clip_q63_to_q31((q63_t)x + (q31_t)y)));
  }





  __attribute__((always_inline)) static inline int32_t __QSUB(
  int32_t x,
  int32_t y)
  {
    return ((int32_t)(clip_q63_to_q31((q63_t)x - (q31_t)y)));
  }





  __attribute__((always_inline)) static inline uint32_t __SMLAD(
  uint32_t x,
  uint32_t y,
  uint32_t sum)
  {
    return ((uint32_t)(((((q31_t)x << 16) >> 16) * (((q31_t)y << 16) >> 16)) +
                       ((((q31_t)x ) >> 16) * (((q31_t)y ) >> 16)) +
                       ( ((q31_t)sum ) ) ));
  }





  __attribute__((always_inline)) static inline uint32_t __SMLADX(
  uint32_t x,
  uint32_t y,
  uint32_t sum)
  {
    return ((uint32_t)(((((q31_t)x << 16) >> 16) * (((q31_t)y ) >> 16)) +
                       ((((q31_t)x ) >> 16) * (((q31_t)y << 16) >> 16)) +
                       ( ((q31_t)sum ) ) ));
  }





  __attribute__((always_inline)) static inline uint32_t __SMLSDX(
  uint32_t x,
  uint32_t y,
  uint32_t sum)
  {
    return ((uint32_t)(((((q31_t)x << 16) >> 16) * (((q31_t)y ) >> 16)) -
                       ((((q31_t)x ) >> 16) * (((q31_t)y << 16) >> 16)) +
                       ( ((q31_t)sum ) ) ));
  }





  __attribute__((always_inline)) static inline uint64_t __SMLALD(
  uint32_t x,
  uint32_t y,
  uint64_t sum)
  {

    return ((uint64_t)(((((q31_t)x << 16) >> 16) * (((q31_t)y << 16) >> 16)) +
                       ((((q31_t)x ) >> 16) * (((q31_t)y ) >> 16)) +
                       ( ((q63_t)sum ) ) ));
  }





  __attribute__((always_inline)) static inline uint64_t __SMLALDX(
  uint32_t x,
  uint32_t y,
  uint64_t sum)
  {

    return ((uint64_t)(((((q31_t)x << 16) >> 16) * (((q31_t)y ) >> 16)) +
                       ((((q31_t)x ) >> 16) * (((q31_t)y << 16) >> 16)) +
                       ( ((q63_t)sum ) ) ));
  }





  __attribute__((always_inline)) static inline uint32_t __SMUAD(
  uint32_t x,
  uint32_t y)
  {
    return ((uint32_t)(((((q31_t)x << 16) >> 16) * (((q31_t)y << 16) >> 16)) +
                       ((((q31_t)x ) >> 16) * (((q31_t)y ) >> 16)) ));
  }





  __attribute__((always_inline)) static inline uint32_t __SMUSD(
  uint32_t x,
  uint32_t y)
  {
    return ((uint32_t)(((((q31_t)x << 16) >> 16) * (((q31_t)y << 16) >> 16)) -
                       ((((q31_t)x ) >> 16) * (((q31_t)y ) >> 16)) ));
  }





  __attribute__((always_inline)) static inline uint32_t __SXTB16(
  uint32_t x)
  {
    return ((uint32_t)(((((q31_t)x << 24) >> 24) & (q31_t)0x0000FFFF) |
                       ((((q31_t)x << 8) >> 8) & (q31_t)0xFFFF0000) ));
  }




  __attribute__((always_inline)) static inline int32_t __SMMLA(
  int32_t x,
  int32_t y,
  int32_t sum)
  {
    return (sum + (int32_t) (((int64_t) x * y) >> 32));
  }
# 35 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h" 2
# 1 "libraries\\NMSIS\\DSP\\Include/dsp/utils.h" 1
# 31 "libraries\\NMSIS\\DSP\\Include/dsp/utils.h"
# 1 "d:\\mounriver\\mounriver_studio2\\resources\\app\\resources\\win32\\components\\wch\\toolchain\\risc-v embedded gcc12\\lib\\gcc\\riscv-wch-elf\\12.2.0\\include-fixed\\limits.h" 1 3 4
# 32 "libraries\\NMSIS\\DSP\\Include/dsp/utils.h" 2
# 65 "libraries\\NMSIS\\DSP\\Include/dsp/utils.h"
  __attribute__((always_inline)) static inline uint32_t riscv_recip_q31(
        q31_t in,
        q31_t * dst,
  const q31_t * pRecipTable)
  {
    q31_t out;
    uint32_t tempVal;
    uint32_t index, i;
    uint32_t signBits;

    if (in > 0)
    {
      signBits = ((uint32_t) (__CLZ( (uint32_t)in) - 1));
    }
    else
    {
      signBits = ((uint32_t) (__CLZ((uint32_t)(-in)) - 1));
    }


    in = (in << signBits);


    index = (uint32_t)(in >> 24);
    index = (index & 0x0000003F);


    out = pRecipTable[index];



    for (i = 0U; i < 2U; i++)
    {
      tempVal = (uint32_t) (((q63_t) in * out) >> 31);
      tempVal = 0x7FFFFFFFu - tempVal;


      out = clip_q63_to_q31(((q63_t) out * tempVal) >> 30);
    }


    *dst = out;


    return (signBits + 1U);
  }






  __attribute__((always_inline)) static inline uint32_t riscv_recip_q15(
        q15_t in,
        q15_t * dst,
  const q15_t * pRecipTable)
  {
    q15_t out = 0;
    int32_t tempVal = 0;
    uint32_t index = 0, i = 0;
    uint32_t signBits = 0;

    if (in > 0)
    {
      signBits = ((uint32_t)(__CLZ( (uint32_t)in) - 17));
    }
    else
    {
      signBits = ((uint32_t)(__CLZ((uint32_t)(-in)) - 17));
    }


    in = (q15_t)(in << signBits);


    index = (uint32_t)(in >> 8);
    index = (index & 0x0000003F);


    out = pRecipTable[index];



    for (i = 0U; i < 2U; i++)
    {
      tempVal = (((q31_t) in * out) >> 15);
      tempVal = 0x7FFF - tempVal;

      out = (q15_t) (((q31_t) out * tempVal) >> 14);

    }


    *dst = out;


    return (signBits + 1);
  }
# 171 "libraries\\NMSIS\\DSP\\Include/dsp/utils.h"
static inline void riscv_norm_64_to_32u(uint64_t in, int32_t * normalized, int32_t *norm)
{
    int32_t n1;
    int32_t hi = (int32_t) (in >> 32);
    int32_t lo = (int32_t) ((in << 32) >> 32);

    n1 = __CLZ((uint32_t)hi) - 32;
    if (!n1)
    {



        n1 = __CLZ((uint32_t)lo);
        if (!n1)
        {



            *norm = -1;
            *normalized = (((uint32_t) lo) >> 1);
        } else
        {
            if (n1 == 32)
            {



                *norm = 0;
                *normalized = 0;
            } else
            {



                *norm = n1 - 1;
                *normalized = lo << *norm;
            }
        }
    } else
    {



        n1 = 1 - n1;
        *norm = -n1;



        *normalized = (int32_t)(((uint32_t)lo) >> n1) | (hi << (32 - n1));
    }
}

static inline int32_t riscv_div_int64_to_int32(int64_t num, int32_t den)
{
    int32_t result;
    uint64_t absNum;
    int32_t normalized;
    int32_t norm;





    if (num == (int64_t)
# 234 "libraries\\NMSIS\\DSP\\Include/dsp/utils.h" 3 4
                       (-0x7fffffffL - 1L)
# 234 "libraries\\NMSIS\\DSP\\Include/dsp/utils.h"
                               )
    {
        absNum = 0x7fffffffL;
    }
    else
    {
       absNum = (uint64_t) (num > 0 ? num : -num);
    }
    riscv_norm_64_to_32u(absNum, &normalized, &norm);
    if (norm > 0)



        result = (int32_t) num / den;
    else



        result = (int32_t) (num / den);

    return result;
}
# 36 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h" 2

# 1 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h" 1
# 54 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_mult_q7(
  const q7_t * pSrcA,
  const q7_t * pSrcB,
        q7_t * pDst,
        uint32_t blockSize);
# 68 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_mult_q15(
  const q15_t * pSrcA,
  const q15_t * pSrcB,
        q15_t * pDst,
        uint32_t blockSize);
# 82 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_mult_q31(
  const q31_t * pSrcA,
  const q31_t * pSrcB,
        q31_t * pDst,
        uint32_t blockSize);
# 96 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_mult_f32(
  const float32_t * pSrcA,
  const float32_t * pSrcB,
        float32_t * pDst,
        uint32_t blockSize);
# 111 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
void riscv_mult_f64(
const float64_t * pSrcA,
const float64_t * pSrcB,
   float64_t * pDst,
   uint32_t blockSize);
# 126 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_add_f32(
  const float32_t * pSrcA,
  const float32_t * pSrcB,
        float32_t * pDst,
        uint32_t blockSize);
# 141 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
 void riscv_add_f64(
 const float64_t * pSrcA,
 const float64_t * pSrcB,
    float64_t * pDst,
    uint32_t blockSize);
# 156 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_add_q7(
  const q7_t * pSrcA,
  const q7_t * pSrcB,
        q7_t * pDst,
        uint32_t blockSize);
# 170 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_add_q15(
  const q15_t * pSrcA,
  const q15_t * pSrcB,
        q15_t * pDst,
        uint32_t blockSize);
# 184 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_add_q31(
  const q31_t * pSrcA,
  const q31_t * pSrcB,
        q31_t * pDst,
        uint32_t blockSize);
# 198 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_sub_f32(
  const float32_t * pSrcA,
  const float32_t * pSrcB,
        float32_t * pDst,
        uint32_t blockSize);
# 213 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_sub_f64(
  const float64_t * pSrcA,
  const float64_t * pSrcB,
        float64_t * pDst,
        uint32_t blockSize);
# 228 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_sub_q7(
  const q7_t * pSrcA,
  const q7_t * pSrcB,
        q7_t * pDst,
        uint32_t blockSize);
# 242 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_sub_q15(
  const q15_t * pSrcA,
  const q15_t * pSrcB,
        q15_t * pDst,
        uint32_t blockSize);
# 256 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_sub_q31(
  const q31_t * pSrcA,
  const q31_t * pSrcB,
        q31_t * pDst,
        uint32_t blockSize);
# 270 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_scale_f32(
  const float32_t * pSrc,
        float32_t scale,
        float32_t * pDst,
        uint32_t blockSize);
# 285 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_scale_f64(
  const float64_t * pSrc,
        float64_t scale,
        float64_t * pDst,
        uint32_t blockSize);
# 301 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_scale_q7(
  const q7_t * pSrc,
        q7_t scaleFract,
        int8_t shift,
        q7_t * pDst,
        uint32_t blockSize);
# 317 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_scale_q15(
  const q15_t * pSrc,
        q15_t scaleFract,
        int8_t shift,
        q15_t * pDst,
        uint32_t blockSize);
# 333 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_scale_q31(
  const q31_t * pSrc,
        q31_t scaleFract,
        int8_t shift,
        q31_t * pDst,
        uint32_t blockSize);
# 347 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_abs_q7(
  const q7_t * pSrc,
        q7_t * pDst,
        uint32_t blockSize);
# 359 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_abs_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t blockSize);
# 372 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
void riscv_abs_f64(
const float64_t * pSrc,
   float64_t * pDst,
   uint32_t blockSize);
# 385 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_abs_q15(
  const q15_t * pSrc,
        q15_t * pDst,
        uint32_t blockSize);
# 397 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_abs_q31(
  const q31_t * pSrc,
        q31_t * pDst,
        uint32_t blockSize);
# 410 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_dot_prod_f32(
  const float32_t * pSrcA,
  const float32_t * pSrcB,
        uint32_t blockSize,
        float32_t * result);
# 425 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
void riscv_dot_prod_f64(
const float64_t * pSrcA,
const float64_t * pSrcB,
   uint32_t blockSize,
   float64_t * result);
# 440 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_dot_prod_q7(
  const q7_t * pSrcA,
  const q7_t * pSrcB,
        uint32_t blockSize,
        q31_t * result);
# 454 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_dot_prod_q15(
  const q15_t * pSrcA,
  const q15_t * pSrcB,
        uint32_t blockSize,
        q63_t * result);
# 468 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_dot_prod_q31(
  const q31_t * pSrcA,
  const q31_t * pSrcB,
        uint32_t blockSize,
        q63_t * result);
# 482 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_shift_q7(
  const q7_t * pSrc,
        int8_t shiftBits,
        q7_t * pDst,
        uint32_t blockSize);
# 496 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_shift_q15(
  const q15_t * pSrc,
        int8_t shiftBits,
        q15_t * pDst,
        uint32_t blockSize);
# 510 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_shift_q31(
  const q31_t * pSrc,
        int8_t shiftBits,
        q31_t * pDst,
        uint32_t blockSize);
# 524 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
void riscv_offset_f64(
const float64_t * pSrc,
   float64_t offset,
   float64_t * pDst,
   uint32_t blockSize);
# 539 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_offset_f32(
  const float32_t * pSrc,
        float32_t offset,
        float32_t * pDst,
        uint32_t blockSize);
# 554 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_offset_q7(
  const q7_t * pSrc,
        q7_t offset,
        q7_t * pDst,
        uint32_t blockSize);
# 568 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_offset_q15(
  const q15_t * pSrc,
        q15_t offset,
        q15_t * pDst,
        uint32_t blockSize);
# 582 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_offset_q31(
  const q31_t * pSrc,
        q31_t offset,
        q31_t * pDst,
        uint32_t blockSize);
# 595 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_negate_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t blockSize);
# 608 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
void riscv_negate_f64(
const float64_t * pSrc,
   float64_t * pDst,
   uint32_t blockSize);
# 621 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_negate_q7(
  const q7_t * pSrc,
        q7_t * pDst,
        uint32_t blockSize);
# 633 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_negate_q15(
  const q15_t * pSrc,
        q15_t * pDst,
        uint32_t blockSize);
# 645 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_negate_q31(
  const q31_t * pSrc,
        q31_t * pDst,
        uint32_t blockSize);
# 657 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_and_u16(
    const uint16_t * pSrcA,
    const uint16_t * pSrcB,
          uint16_t * pDst,
          uint32_t blockSize);
# 670 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_and_u32(
    const uint32_t * pSrcA,
    const uint32_t * pSrcB,
          uint32_t * pDst,
          uint32_t blockSize);
# 683 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_and_u8(
    const uint8_t * pSrcA,
    const uint8_t * pSrcB,
          uint8_t * pDst,
          uint32_t blockSize);
# 696 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_or_u16(
    const uint16_t * pSrcA,
    const uint16_t * pSrcB,
          uint16_t * pDst,
          uint32_t blockSize);
# 709 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_or_u32(
    const uint32_t * pSrcA,
    const uint32_t * pSrcB,
          uint32_t * pDst,
          uint32_t blockSize);
# 722 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_or_u8(
    const uint8_t * pSrcA,
    const uint8_t * pSrcB,
          uint8_t * pDst,
          uint32_t blockSize);







  void riscv_not_u16(
    const uint16_t * pSrc,
          uint16_t * pDst,
          uint32_t blockSize);







  void riscv_not_u32(
    const uint32_t * pSrc,
          uint32_t * pDst,
          uint32_t blockSize);







  void riscv_not_u8(
    const uint8_t * pSrc,
          uint8_t * pDst,
          uint32_t blockSize);
# 768 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_xor_u16(
    const uint16_t * pSrcA,
    const uint16_t * pSrcB,
          uint16_t * pDst,
          uint32_t blockSize);
# 781 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_xor_u32(
    const uint32_t * pSrcA,
    const uint32_t * pSrcB,
          uint32_t * pDst,
          uint32_t blockSize);
# 794 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
  void riscv_xor_u8(
    const uint8_t * pSrcA,
    const uint8_t * pSrcB,
          uint8_t * pDst,
    uint32_t blockSize);
# 809 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
void riscv_clip_f32(const float32_t * pSrc,
  float32_t * pDst,
  float32_t low,
  float32_t high,
  uint32_t numSamples);
# 824 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
void riscv_clip_q31(const q31_t * pSrc,
  q31_t * pDst,
  q31_t low,
  q31_t high,
  uint32_t numSamples);
# 839 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
void riscv_clip_q15(const q15_t * pSrc,
  q15_t * pDst,
  q15_t low,
  q15_t high,
  uint32_t numSamples);
# 854 "libraries\\NMSIS\\DSP\\Include/dsp/basic_math_functions.h"
void riscv_clip_q7(const q7_t * pSrc,
  q7_t * pDst,
  q7_t low,
  q7_t high,
  uint32_t numSamples);
# 38 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h" 2
# 79 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
  float32_t riscv_sin_f32(
  float32_t x);







  q31_t riscv_sin_q31(
  q31_t x);






  q15_t riscv_sin_q15(
  q15_t x);







  float32_t riscv_cos_f32(
  float32_t x);







  q31_t riscv_cos_q31(
  q31_t x);







  q15_t riscv_cos_q15(
  q15_t x);
# 133 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
  void riscv_vlog_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t blockSize);
# 146 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
  void riscv_vlog_f64(
  const float64_t * pSrc,
        float64_t * pDst,
        uint32_t blockSize);
# 159 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
  void riscv_vlog_q31(const q31_t * pSrc,
        q31_t * pDst,
        uint32_t blockSize);







  void riscv_vlog_q15(const q15_t * pSrc,
        q15_t * pDst,
        uint32_t blockSize);
# 181 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
  void riscv_vexp_f32(
  const float32_t * pSrc,
        float32_t * pDst,
        uint32_t blockSize);
# 194 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
  void riscv_vexp_f64(
  const float64_t * pSrc,
  float64_t * pDst,
  uint32_t blockSize);
# 235 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
__attribute__((always_inline)) static inline riscv_status riscv_sqrt_f32(
  const float32_t in,
  float32_t * pOut)
  {
    if (in >= 0.0f)
    {
      *pOut = sqrtf(in);

      return (RISCV_MATH_SUCCESS);
    }
    else
    {
      *pOut = 0.0f;
      return (RISCV_MATH_ARGUMENT_ERROR);
    }
  }
# 261 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
riscv_status riscv_sqrt_q31(
  q31_t in,
  q31_t * pOut);
# 274 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
riscv_status riscv_sqrt_q15(
  q15_t in,
  q15_t * pOut);
# 296 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
riscv_status riscv_divide_q15(q15_t numerator,
  q15_t denominator,
  q15_t *quotient,
  int16_t *shift);
# 313 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
riscv_status riscv_divide_q31(q31_t numerator,
  q31_t denominator,
  q31_t *quotient,
  int16_t *shift);
# 327 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
  riscv_status riscv_atan2_f32(float32_t y,float32_t x,float32_t *result);
# 337 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
  riscv_status riscv_atan2_q31(q31_t y,q31_t x,q31_t *result);
# 346 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h"
  riscv_status riscv_atan2_q15(q15_t y,q15_t x,q15_t *result);
# 31 "libraries\\NMSIS\\DSP\\Source\\FastMathFunctions\\riscv_sin_f32.c" 2
# 1 "libraries\\NMSIS\\DSP\\Include/riscv_common_tables.h" 1
# 34 "libraries\\NMSIS\\DSP\\Include/riscv_common_tables.h"
# 1 "libraries\\NMSIS\\DSP\\Include/dsp/fast_math_functions.h" 1
# 35 "libraries\\NMSIS\\DSP\\Include/riscv_common_tables.h" 2
# 46 "libraries\\NMSIS\\DSP\\Include/riscv_common_tables.h"
    extern const uint16_t riscvBitRevTable[1024];

    extern const uint64_t twiddleCoefF64_16[32];

    extern const uint64_t twiddleCoefF64_32[64];

    extern const uint64_t twiddleCoefF64_64[128];

    extern const uint64_t twiddleCoefF64_128[256];

    extern const uint64_t twiddleCoefF64_256[512];

    extern const uint64_t twiddleCoefF64_512[1024];

    extern const uint64_t twiddleCoefF64_1024[2048];

    extern const uint64_t twiddleCoefF64_2048[4096];

    extern const uint64_t twiddleCoefF64_4096[8192];

    extern const float32_t twiddleCoef_16[32];

    extern const float32_t twiddleCoef_32[64];

    extern const float32_t twiddleCoef_64[128];

    extern const float32_t twiddleCoef_128[256];

    extern const float32_t twiddleCoef_256[512];

    extern const float32_t twiddleCoef_512[1024];

    extern const float32_t twiddleCoef_1024[2048];

    extern const float32_t twiddleCoef_2048[4096];

    extern const float32_t twiddleCoef_4096[8192];




    extern const q31_t twiddleCoef_16_q31[24];

    extern const q31_t twiddleCoef_32_q31[48];

    extern const q31_t twiddleCoef_64_q31[96];

    extern const q31_t twiddleCoef_128_q31[192];

    extern const q31_t twiddleCoef_256_q31[384];

    extern const q31_t twiddleCoef_512_q31[768];

    extern const q31_t twiddleCoef_1024_q31[1536];

    extern const q31_t twiddleCoef_2048_q31[3072];

    extern const q31_t twiddleCoef_4096_q31[6144];

    extern const q15_t twiddleCoef_16_q15[24];

    extern const q15_t twiddleCoef_32_q15[48];

    extern const q15_t twiddleCoef_64_q15[96];

    extern const q15_t twiddleCoef_128_q15[192];

    extern const q15_t twiddleCoef_256_q15[384];

    extern const q15_t twiddleCoef_512_q15[768];

    extern const q15_t twiddleCoef_1024_q15[1536];

    extern const q15_t twiddleCoef_2048_q15[3072];

    extern const q15_t twiddleCoef_4096_q15[6144];


    extern const uint64_t twiddleCoefF64_rfft_32[32];

    extern const uint64_t twiddleCoefF64_rfft_64[64];

    extern const uint64_t twiddleCoefF64_rfft_128[128];

    extern const uint64_t twiddleCoefF64_rfft_256[256];

    extern const uint64_t twiddleCoefF64_rfft_512[512];

    extern const uint64_t twiddleCoefF64_rfft_1024[1024];

    extern const uint64_t twiddleCoefF64_rfft_2048[2048];

    extern const uint64_t twiddleCoefF64_rfft_4096[4096];

    extern const float32_t twiddleCoef_rfft_32[32];

    extern const float32_t twiddleCoef_rfft_64[64];

    extern const float32_t twiddleCoef_rfft_128[128];

    extern const float32_t twiddleCoef_rfft_256[256];

    extern const float32_t twiddleCoef_rfft_512[512];

    extern const float32_t twiddleCoef_rfft_1024[1024];

    extern const float32_t twiddleCoef_rfft_2048[2048];

    extern const float32_t twiddleCoef_rfft_4096[4096];




    extern const uint16_t riscvBitRevIndexTableF64_16[((uint16_t)12)];


    extern const uint16_t riscvBitRevIndexTableF64_32[((uint16_t)24)];


    extern const uint16_t riscvBitRevIndexTableF64_64[((uint16_t)56)];


    extern const uint16_t riscvBitRevIndexTableF64_128[((uint16_t)112)];


    extern const uint16_t riscvBitRevIndexTableF64_256[((uint16_t)240)];


    extern const uint16_t riscvBitRevIndexTableF64_512[((uint16_t)480)];


    extern const uint16_t riscvBitRevIndexTableF64_1024[((uint16_t)992)];


    extern const uint16_t riscvBitRevIndexTableF64_2048[((uint16_t)1984)];


    extern const uint16_t riscvBitRevIndexTableF64_4096[((uint16_t)4032)];



    extern const uint16_t riscvBitRevIndexTable16[((uint16_t)20)];


    extern const uint16_t riscvBitRevIndexTable32[((uint16_t)48)];


    extern const uint16_t riscvBitRevIndexTable64[((uint16_t)56)];


    extern const uint16_t riscvBitRevIndexTable128[((uint16_t)208)];


    extern const uint16_t riscvBitRevIndexTable256[((uint16_t)440)];


    extern const uint16_t riscvBitRevIndexTable512[((uint16_t)448)];


    extern const uint16_t riscvBitRevIndexTable1024[((uint16_t)1800)];


    extern const uint16_t riscvBitRevIndexTable2048[((uint16_t)3808)];


    extern const uint16_t riscvBitRevIndexTable4096[((uint16_t)4032)];





    extern const uint16_t riscvBitRevIndexTable_fixed_16[((uint16_t)12)];


    extern const uint16_t riscvBitRevIndexTable_fixed_32[((uint16_t)24)];


    extern const uint16_t riscvBitRevIndexTable_fixed_64[((uint16_t)56)];


    extern const uint16_t riscvBitRevIndexTable_fixed_128[((uint16_t)112)];


    extern const uint16_t riscvBitRevIndexTable_fixed_256[((uint16_t)240)];


    extern const uint16_t riscvBitRevIndexTable_fixed_512[((uint16_t)480)];


    extern const uint16_t riscvBitRevIndexTable_fixed_1024[((uint16_t)992)];


    extern const uint16_t riscvBitRevIndexTable_fixed_2048[((uint16_t)1984)];


    extern const uint16_t riscvBitRevIndexTable_fixed_4096[((uint16_t)4032)];

    extern const float32_t realCoefA[8192];
    extern const float32_t realCoefB[8192];

    extern const q31_t realCoefAQ31[8192];
    extern const q31_t realCoefBQ31[8192];

    extern const q15_t realCoefAQ15[8192];
    extern const q15_t realCoefBQ15[8192];

    extern const float32_t Weights_128[256];
    extern const float32_t cos_factors_128[128];

    extern const float32_t Weights_512[1024];
    extern const float32_t cos_factors_512[512];

    extern const float32_t Weights_2048[4096];
    extern const float32_t cos_factors_2048[2048];

    extern const float32_t Weights_8192[16384];
    extern const float32_t cos_factors_8192[8192];

    extern const q15_t WeightsQ15_128[256];
    extern const q15_t cos_factorsQ15_128[128];

    extern const q15_t WeightsQ15_512[1024];
    extern const q15_t cos_factorsQ15_512[512];

    extern const q15_t WeightsQ15_2048[4096];
    extern const q15_t cos_factorsQ15_2048[2048];

    extern const q15_t WeightsQ15_8192[16384];
    extern const q15_t cos_factorsQ15_8192[8192];

    extern const q31_t WeightsQ31_128[256];
    extern const q31_t cos_factorsQ31_128[128];

    extern const q31_t WeightsQ31_512[1024];
    extern const q31_t cos_factorsQ31_512[512];

    extern const q31_t WeightsQ31_2048[4096];
    extern const q31_t cos_factorsQ31_2048[2048];

    extern const q31_t WeightsQ31_8192[16384];
    extern const q31_t cos_factorsQ31_8192[8192];


    extern const q15_t riscvRecipTableQ15[64];

    extern const q31_t riscvRecipTableQ31[64];


    extern const float32_t sinTable_f32[512 + 1];

    extern const q31_t sinTable_q31[512 + 1];

    extern const q15_t sinTable_q15[512 + 1];



       extern const q31_t sqrt_initial_lut_q31[32];

       extern const q15_t sqrt_initial_lut_q15[16];
# 32 "libraries\\NMSIS\\DSP\\Source\\FastMathFunctions\\riscv_sin_f32.c" 2
# 72 "libraries\\NMSIS\\DSP\\Source\\FastMathFunctions\\riscv_sin_f32.c"
 float32_t riscv_sin_f32(
  float32_t x)
{
  float32_t sinVal, fract, in;
  uint16_t index;
  float32_t a, b;
  int32_t n;
  float32_t findex;



  in = x * 0.159154943092f;


  n = (int32_t) in;


  if (in < 0.0f)
  {
    n--;
  }


  in = in - (float32_t) n;


  findex = (float32_t)512 * in;
  index = (uint16_t)findex;


  if (index >= 512) {
    index = 0;
    findex -= (float32_t)512;
  }


  fract = findex - (float32_t) index;


  a = sinTable_f32[index];
  b = sinTable_f32[index+1];


  sinVal = (1.0f - fract) * a + fract * b;


  return (sinVal);
}
