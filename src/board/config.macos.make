CONFIG_ENV_CFLAGS   += \
    -Os -Wall \
    --coverage \
    -DIOTX_NET_INIT_WITH_PK_EXT \
    -DCM_VIA_CLOUD_CONN \
    -DCM_VIA_CLOUD_CONN_MQTT

ifneq (Darwin,$(strip $(shell uname)))
CONFIG_ENV_CFLAGS   += -rdynamic
CONFIG_ENV_CFLAGS   += -Werror
else
CONFIG_src/tools/linkkit_tsl_convert :=
endif

LDFLAGS             += -lpthread -lrt

OVERRIDE_STRIP      := strip

