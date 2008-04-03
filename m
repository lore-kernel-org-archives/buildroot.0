From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 Apr 2008 14:06:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080403210632.B8B153C379@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-03 14:06:27 -0700 (Thu, 03 Apr 2008)
New Revision: 21628

Log:
defconfig: remove busybox config setting

Remove BR2_PACKAGE_BUSYBOX_CONFIG so the default config for the
selected version gets used. Got broken by r21257.


Modified:
   trunk/buildroot/.defconfig


Changeset:
Modified: trunk/buildroot/.defconfig
===================================================================
--- trunk/buildroot/.defconfig	2008-04-03 17:13:46 UTC (rev 21627)
+++ trunk/buildroot/.defconfig	2008-04-03 21:06:27 UTC (rev 21628)
@@ -258,7 +258,6 @@
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
 BR2_BUSYBOX_VERSION="1.9.0"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.9.0.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
