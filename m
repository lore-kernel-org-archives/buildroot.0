From: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue, 20 Aug 2019 13:03:51 +0000
Subject: [Buildroot] [PATCH 1/3] package/pigpio: bump to version 71
Message-ID: <20190820130353.19236-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/pigpio/pigpio.hash | 2 +-
 package/pigpio/pigpio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pigpio/pigpio.hash b/package/pigpio/pigpio.hash
index 50384f9fb3..fe6401cda3 100644
--- a/package/pigpio/pigpio.hash
+++ b/package/pigpio/pigpio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	ec980f5e672e8e9395b801fecec3fbbbc5c04182b16ee72eb9ca25a453e38062  pigpio-68.tar.gz
+sha256	41698abdbc95b60a4f4dbcc2fe2a6e88f2bca4dc78d0c0b55a3a932fa95a9249  pigpio-71.tar.gz
 sha256	6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index ed83d83790..90a23f6678 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGPIO_VERSION = 68
+PIGPIO_VERSION = 71
 PIGPIO_SITE = $(call github,joan2937,pigpio,V$(PIGPIO_VERSION))
 PIGPIO_LICENSE = Unlicense
 PIGPIO_LICENSE_FILES = UNLICENCE
-- 
2.23.0
