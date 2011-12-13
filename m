From: Shawn Ferris <shawn.ferris@gmail.com>
Date: Mon, 12 Dec 2011 23:14:13 -0700
Subject: [Buildroot] Bad symbols on plugins for connman
Message-ID: <1323756853.26968.6.camel@barkley.virtualsmf.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All - I'm new to build-root, so I hope this isn't obvious. (My
apologies if it is) Anyway, I just pulled a recent git (within the last
few days) and I'm trying to get connman working but I'm getting the
following errors running connmand with the --debug option. I get this
with and without the option 'enable compiling with debugging
information' set.

Any help will be much appreciated! Thanks..

Shawn

connmand[649]: src/plugin.c:__connman_plugin_init() 

/usr/sbin/connmand: symbol '__start___debug': can't resolve symbol

/usr/sbin/connmand: symbol '__stop___debug': can't resolve symbol
connmand[649]: Can't load /usr/lib/connman/plugins/wifi.so: (null)

/usr/sbin/connmand: symbol '__start___debug': can't resolve symbol

/usr/sbin/connmand: symbol '__stop___debug': can't resolve symbol
connmand[649]: Can't load /usr/lib/connman/plugins/bluetooth.so: (null)

/usr/sbin/connmand: symbol '__start___debug': can't resolve symbol

/usr/sbin/connmand: symbol '__stop___debug': can't resolve symbol
connmand[649]: Can't load /usr/lib/connman/plugins/ntpd.so: (null)

/usr/sbin/connmand: symbol '__start___debug': can't resolve symbol

/usr/sbin/connmand: symbol '__stop___debug': can't resolve symbol
connmand[649]: Can't load /usr/lib/connman/plugins/ethernet.so: (null)
