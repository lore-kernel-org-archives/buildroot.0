From: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue, 30 Jun 2020 11:56:02 +0200
Subject: [Buildroot] [PATCH] package/pigpio: Bump to version 77
Message-ID: <20200630095604.133122-1-grzegorz@blach.pl>
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
index b29e71c139..4c8205ea4c 100644
--- a/package/pigpio/pigpio.hash
+++ b/package/pigpio/pigpio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  871677cf94152e1caf43088047c3b3eec6b325e568b2e3017d60af2463e5ebd6  pigpio-76.tar.gz
+sha256  fe0cd66c0277a71fbbde1adff196a570870dad1de8dfe51f7e35f5b8d545206f  pigpio-77.tar.gz
 sha256  6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index 4b7abf7c20..9075274de1 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGPIO_VERSION = 76
+PIGPIO_VERSION = 77
 PIGPIO_SITE = $(call github,joan2937,pigpio,v$(PIGPIO_VERSION))
 PIGPIO_LICENSE = Unlicense
 PIGPIO_LICENSE_FILES = UNLICENCE
-- 
2.18.4
