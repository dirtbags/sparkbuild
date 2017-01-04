This is a script to build a TP-Link MR3020 image for Cyber Spark.

You do this:

    ./build.sh

And then you install `openwrt.bin` as a firmware upgrade in the TP-Link web UI
at `192.168.0.1`.

When it comes up it's going to be `192.168.1.1`,
which is a different subnet than the TP-Link firmware uses.

OpenWRT has no root password by default,
which means ssh won't work.
Before doing anything else, telnet in to set a password:

    telnet 192.168.1.1

