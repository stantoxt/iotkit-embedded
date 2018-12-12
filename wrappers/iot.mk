LIBA_TARGET := libiot_hal.a
CFLAGS      := $(filter-out -ansi,$(CFLAGS))

HDR_REFS    += external_libs/mbedtls src/infra

LIB_SRCS_PATTERN    += os/$(CONFIG_VENDOR)/*.c
ifneq (,$(filter -DSUPPORT_TLS,$(CFLAGS)))
LIB_SRCS_PATTERN    += tls/*.c
endif
ifneq (,$(filter -DSUPPORT_ITLS,$(CFLAGS)))
LIB_SRCS_PATTERN    += tls/*.c
endif

LIB_SRCS_PATTERN    += algo/*.c