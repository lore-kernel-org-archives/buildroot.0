From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 06:51:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20070708135116.94C63A6A0B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 06:51:15 -0700 (Sun, 08 Jul 2007)
New Revision: 19037

Log:
- update defaults


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.config


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.config
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.config	2007-07-08 13:20:46 UTC (rev 19036)
+++ trunk/buildroot/target/device/x86/i386/linux26.config	2007-07-08 13:51:15 UTC (rev 19037)
@@ -47,6 +47,8 @@
 # CONFIG_RELAY is not set
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE=""
+INITRAMFS_ROOT_UID=0
+INITRAMFS_ROOT_GID=0
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_SYSCTL=y
 CONFIG_EMBEDDED=y
