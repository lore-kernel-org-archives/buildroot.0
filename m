From: Grzegorz Blach <grzegorz@blach.pl>
Date: Wed,  6 May 2020 17:52:36 +0200
Subject: [Buildroot] [PATCH] package/pigpio: bump to version 76
Message-ID: <20200506155240.434954-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/pigpio/pigpio.hash | 4 ++--
 package/pigpio/pigpio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pigpio/pigpio.hash b/package/pigpio/pigpio.hash
index 5b87acf082..b29e71c139 100644
--- a/package/pigpio/pigpio.hash
+++ b/package/pigpio/pigpio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	dfec8d06075a9336433d96a8e2f86810f3332d616cf0d6253d98ad78094aa15a  pigpio-75.tar.gz
-sha256	6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
+sha256  871677cf94152e1caf43088047c3b3eec6b325e568b2e3017d60af2463e5ebd6  pigpio-76.tar.gz
+sha256  6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index 89d8deb9ea..4b7abf7c20 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGPIO_VERSION = 75
+PIGPIO_VERSION = 76
 PIGPIO_SITE = $(call github,joan2937,pigpio,v$(PIGPIO_VERSION))
 PIGPIO_LICENSE = Unlicense
 PIGPIO_LICENSE_FILES = UNLICENCE
-- 
2.26.2
