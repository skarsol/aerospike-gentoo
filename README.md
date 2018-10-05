Assorted ebuilds used to install Aerospike on Gentoo.

This is a first rough pass just to get things installed. Dependencies may be missing or broken!

The php client requires the system_path.patch due to a breaking change in the C client that happened before some other required changes. Presumably the next version of the PHP client (>7.2.0) will no longer need it.