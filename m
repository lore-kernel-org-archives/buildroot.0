From: Grzegorz Blach <grzegorz@blach.pl>
Date: Sun,  8 Mar 2020 13:15:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/pigpio: Bump to version 74
Message-ID: <20200308121526.80350-1-grzegorz@blach.pl>
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
index f20b9bf6bb..e69f7b2d45 100644
--- a/package/pigpio/pigpio.hash
+++ b/package/pigpio/pigpio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	87ec2ec87cb6cb0f42af47868631e657217b5927cdfbea3ad0ecdc2ca885a2d1  pigpio-7301.tar.gz
+sha256	dd377d0109e20437b323d94523eda1dced6c63f6f347fa564182bc18a3e126aa  pigpio-74.tar.gz
 sha256	6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index aed5f2744d..42dd535403 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGPIO_VERSION = 7301
+PIGPIO_VERSION = 74
 PIGPIO_SITE = $(call github,joan2937,pigpio,v$(PIGPIO_VERSION))
 PIGPIO_LICENSE = Unlicense
 PIGPIO_LICENSE_FILES = UNLICENCE
-- 
2.25.1
