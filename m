From: No One <justanotheraccount863494@yahoo.com>
Date: Wed, 22 Nov 2006 14:05:01 -0800 (PST)
Subject: [Buildroot] trylink causes build errors
Message-ID: <20061122220501.98305.qmail@web90307.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Picked up the latest via svn (16637), did a default configuration with make menuconfig, ran make and got the following errors:


make[1]: Entering directory `/home/will/box/buildroot/build_i686/busybox'
  LINK    busybox_unstripped
/home/will/box/buildroot/build_i686/busybox/scripts/trylink: 5: function: not found
/home/will/box/buildroot/build_i686/busybox/scripts/trylink: 11: Syntax error: "}" unexpected
make[1]: *** [busybox_unstripped] Error 2
make[1]: Leaving directory `/home/will/box/buildroot/build_i686/busybox'
make: *** [/home/will/box/buildroot/build_i686/busybox/busybox] Error 2
