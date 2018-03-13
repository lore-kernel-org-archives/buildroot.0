From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:11:38 +0100
Subject: [Buildroot] [git commit] flashrom: bump to version 1.0
Message-ID: <20180313211610.9348682551@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09378b474f916c76ef6d09cfb1b7d7dde5c10fc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license file hash.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/flashrom.hash | 6 ++++--
 package/flashrom/flashrom.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 64b67b99cf..3a68e8acb7 100644
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
index f9ab6294a5..95ce86c52c 100644
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
