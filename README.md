# logflooder

Simple log flooder for tests

# Script env options

* KUBERNETES_NAMESPACE - Specify namespace. If not specified, it will be **default**

* TIMEZONE - Specify timezone. By default script uses **UTC**

* DELAY - Delay between 2 messages. By default - **10** seconds 

* RND - Random timeout for random time. By default - **5** seconds

* LOG_TYPE - Log type. May be *plain/json*. By default - **plain**

* LOG_STRING - Message for logging. Random scring will be used on empty variable.

* DECORATE - Use decorators for Plain **LOG_TYPE**. Enabled by default. Acceptable values - 0 / 1

