PROJECT = emqx_modules
PROJECT_DESCRIPTION = EMQ X Modules
PROJECT_VERSION = 2.4.3

BUILD_DEPS = emqx cuttlefish
dep_emqx = git git@github.com:emqx/emqx-enterprise
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

NO_AUTOPATCH = cuttlefish

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

TEST_DEPS = emqttc
dep_emqttc = git https://github.com/emqtt/emqttc.git master

TEST_ERLC_OPTS += +debug_info
TEST_ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

include erlang.mk

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqx_modules.conf -i priv/emqx_modules.schema -d data
