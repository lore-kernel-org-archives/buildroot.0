From: Roo <roo.watt@gmail.com>
Date: Thu, 18 Feb 2010 13:28:03 +1100
Subject: [Buildroot] [PATCH] 2010.02-rc1 at91sam9260pf_defconfig
Message-ID: <815f0bd71002171828u4ac0f44dgc0df709ef7278a3d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am new to buildroot, so if I should have done anything differently
please let me know. I promise not to take in personally. :)

Cameron.

--- buildroot-2010.02-rc1.orig/configs/at91sam9260pf_defconfig
2010-02-10 02:54:30.000000000 +1100
+++ buildroot-2010.02-rc1/configs/at91sam9260pf_defconfig
2010-02-18 13:21:38.000000000 +1100
@@ -58,7 +58,7 @@
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="/usr/local/install/downloads"
+BR2_DL_DIR="$(TOPDIR)/dl"

 #
 # Mirrors and Download locations
