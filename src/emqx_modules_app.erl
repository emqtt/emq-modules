%%--------------------------------------------------------------------
%% Copyright (c) 2013-2018 EMQ Enterprise, Inc. (http://emqtt.io)
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

-module(emqx_modules_app).

-author("Feng Lee <feng@emqtt.io>").

-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) ->
    lists:foreach(
      fun({Mod, Env}) ->
        ok = Mod:load(Env),
        io:format("Load ~s module successfully.~n", [Mod])
      end, modules()),
    emqx_modules_sup:start_link().

stop(_State) ->
    lists:foreach(fun({Mod, Env}) -> Mod:unload(Env) end, modules()).

modules() ->
    {ok, Modules} = application:get_env(emqx_modules, modules), Modules.

