From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  7 Jun 2013 09:54:12 +0200
Subject: [Buildroot] [PATCH 3/4] Convert headers to lower case when relevant
In-Reply-To: <1370591655-19855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1370591655-19855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1370591655-19855-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 boot/at91dataflashboot/at91dataflashboot.mk |    2 +-
 boot/barebox/barebox.mk                     |    2 +-
 boot/lpc32xxcdl/lpc32xxcdl.mk               |    2 +-
 boot/uboot/uboot.mk                         |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 10f54a1..d224a4f 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# DataFlashBoot
+# at91dataflashboot
 #
 #############################################################
 
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 5ec47f6..113110e 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# Barebox
+# barebox
 #
 #############################################################
 
diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
index c4e8d2d..6e49a42 100644
--- a/boot/lpc32xxcdl/lpc32xxcdl.mk
+++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# LPC32XX CDL
+# lpc32xxcdl
 #
 #############################################################
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1b708d5..f8e4aa9 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -1,6 +1,6 @@
 #############################################################
 #
-# U-Boot
+# uboot
 #
 #############################################################
 
-- 
1.7.9.5
