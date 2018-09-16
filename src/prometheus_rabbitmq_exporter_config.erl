-module(prometheus_rabbitmq_exporter_config).

-export([path/0,
         use_mgmt_auth/0,
         queue_messages_stat/0,
         exchange_messages_stat/0,
         memory_stat_enabled/0,
         connections_total_enabled/0]).

-define(DEFAULT_PATH, "/metrics").
-define(DEFAULT_USE_MGMT_AUTH, false).
-define(DEFAULT_QUEUE_MESSAGES_STAT, [messages_published_total,
                                      messages_confirmed_total,
                                      messages_delivered_total,
                                      messages_delivered_no_ack_total,
                                      messages_get_total,
                                      messages_get_no_ack_total,
                                      messages_deliver_get_total,
                                      messages_redelivered_total,
                                      messages_returned_total]).
-define(DEFAULT_EXCHANGE_MESSAGES_STAT, [messages_published_total,
                                         messages_published_in_total,
                                         messages_published_out_total,
                                         messages_confirmed_total,
                                         messages_delivered_total,
                                         messages_delivered_no_ack_total,
                                         messages_get_total,
                                         messages_get_no_ack_total,
                                         messages_deliver_get_total,
                                         messages_redelivered_total,
                                         messages_returned_total]).
-define(DEFAULT_MEMORY_STAT_ENABLED, false).
-define(DEFAULT_CONNECTIONS_TOTAL_ENABLED, false).

config() ->
  application:get_env(prometheus, rabbitmq_exporter, []).

path() ->
  Config = config(),
  proplists:get_value(path, Config, ?DEFAULT_PATH).

use_mgmt_auth() ->
  Config = config(),
  proplists:get_value(use_mgmt_auth, Config, ?DEFAULT_USE_MGMT_AUTH).

queue_messages_stat() ->
  Config = config(),
  proplists:get_value(queue_messages_stat, Config, ?DEFAULT_QUEUE_MESSAGES_STAT).

exchange_messages_stat() ->
  Config = config(),
  proplists:get_value(exchange_messages_stat, Config, ?DEFAULT_EXCHANGE_MESSAGES_STAT).

memory_stat_enabled() ->
  Config = config(),
  proplists:get_value(memory_stat_enabled, Config, ?DEFAULT_MEMORY_STAT_ENABLED).

connections_total_enabled() ->
  Config = config(),
  proplists:get_value(connections_total_enabled, Config, ?DEFAULT_CONNECTIONS_TOTAL_ENABLED).

