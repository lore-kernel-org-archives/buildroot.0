From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:19:12 +0100
Subject: [Buildroot] [git commit] package/pigpio: bump to version 72
Message-ID: <20191205221051.BD3DF803DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cbf51278ea6e7eb9e28ffa3f64935a33ae92487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pigpio/pigpio.hash | 2 +-
 package/pigpio/pigpio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pigpio/pigpio.hash b/package/pigpio/pigpio.hash
index fe6401cda3..51a6706a95 100644
--- a/package/pigpio/pigpio.hash
+++ b/package/pigpio/pigpio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	41698abdbc95b60a4f4dbcc2fe2a6e88f2bca4dc78d0c0b55a3a932fa95a9249  pigpio-71.tar.gz
+sha256	2fc7963af418ea7f1b5b0277ebd88d2a5f60452c5929fdc6b7fb4ab4914231ca  pigpio-72.tar.gz
 sha256	6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index 1cf8f50afc..62cbedc01b 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGPIO_VERSION = 71
+PIGPIO_VERSION = 72
 PIGPIO_SITE = $(call github,joan2937,pigpio,V$(PIGPIO_VERSION))
 PIGPIO_LICENSE = Unlicense
 PIGPIO_LICENSE_FILES = UNLICENCE
