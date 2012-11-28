From: Charles Manning <cdhmanning@gmail.com>
Date: Wed, 28 Nov 2012 13:12:03 +1300
Subject: [Buildroot] Improving config navigation for mtd tools
Message-ID: <CAE21AQqPOGLxFVdCjaFpPo1x2kXCSo3+VbwvYk=THKfRbk+-UQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All

The mtd utilities are part flash utilities and part file system
utilities. This makes it a bit cryptic to put them under "Filesystem
utilities".

I suggest this can be resolved by remaining the heading to "Filesystem
and flash utilities"


--- a/package/Config.in
+++ b/package/Config.in
@@ -177,7 +177,7 @@ source "package/xterm/Config.in"
 source "package/xvkbd/Config.in"
 endmenu

-menu "Filesystem utilities"
+menu "Filesystem and flash utilities"
 source "package/cifs-utils/Config.in"
 source "package/cramfs/Config.in"
 source "package/dosfstools/Config.in"


Regards

Charles
