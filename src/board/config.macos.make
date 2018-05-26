CONFIG_ENV_CFLAGS   += \
    -Os -Wall \
    -g3 --coverage \
    -DCONFIG_HTTP_AUTH_TIMEOUT=500 \
    -DCONFIG_MID_HTTP_TIMEOUT=500 \
    -DCONFIG_GUIDER_AUTH_TIMEOUT=500 \
    -DIOTX_NET_INIT_WITH_PK_EXT \
    -DCM_VIA_CLOUD_CONN \
    -DCM_VIA_CLOUD_CONN_MQTT

ifneq (Darwin,$(strip $(shell uname)))
CONFIG_ENV_CFLAGS   += -rdynamic
CONFIG_ENV_CFLAGS   += -Werror
else
CONFIG_src/platform :=
CONFIG_samples      :=
CONFIG_src/tests    :=
CONFIG_src/tools/linkkit_tsl_convert :=
endif

LDFLAGS             += -lpthread

OVERRIDE_STRIP      := strip

