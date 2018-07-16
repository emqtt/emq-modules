
EMQ Modules(Obsolete)
=====================

Presence Module
---------------

Presence Module which publishes online/offline messages when client connected or disconnected.

```
## Enable the module, Values: on | off
module.presence = on

module.presence.qos = 0
```

Subscription Module
--------------------

```
## Enable Subscription, Values: on | off
module.subscription = on

## Subscribe the Topics automatically when client connected
module.subscription.1.topic = $client/%c
## Qos of the subscription: 0 | 1 | 2
module.subscription.1.qos = 1

## module.subscription.2.topic = $user/%u
## module.subscription.2.qos = 1
```

Rewrite Module
---------------

```
## Enable Rewrite, Values: on | off
module.rewrite = on

%% {rewrite, Topic, Re, Dest}
module.rewrite.rule.1 = "rewrite x/# ^x/y/(.+)$ z/y/$1"

module.rewrite.rule.2 = "rewrite y/+/z/# ^y/(.+)/z/(.+)$ y/z/$2"
```

License
-------

Apache License Version 2.0

Author
------

EMQ X Team.

