From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Mar 2018 14:45:58 +0200
Subject: [Buildroot] [PATCH] flashrom: bump to version 1.0
Message-ID: <3163e1bd9870a59505c35d37913cb1d048411445.1520945158.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license file hash.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/flashrom/flashrom.hash | 6 ++++--
 package/flashrom/flashrom.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 64b67b99cf4f..3a68e8acb7a3 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,2 +1,4 @@
-# Locally computed
-sha256 cb3156b0f63eb192024b76c0814135930297aac41f80761a5d293de769783c45  flashrom-0.9.9.tar.bz2
+# Locally computed after checking pgp signature
+# https://download.flashrom.org/releases/flashrom-1.0.tar.bz2.asc
+sha256 3702fa215ba5fb5af8e54c852d239899cfa1389194c1e51cb2a170c4dc9dee64  flashrom-1.0.tar.bz2
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index f9ab6294a524..95ce86c52ca4 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 0.9.9
+FLASHROM_VERSION = 1.0
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = http://download.flashrom.org/releases
 FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi host-pkgconf
-- 
2.16.1
