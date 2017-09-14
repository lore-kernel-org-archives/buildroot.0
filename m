From: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Thu, 14 Sep 2017 16:00:27 +0100
Subject: [Buildroot] [PATCH 1/1] rpi-userland: bump to latest version
Message-ID: <20170914150027.30475-1-mahyar.koshkouei@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 1728ae8712..f1bb5e678c 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 476cde13d0d4bbf44ffc4d1d545847464d5c270bb72e4d940e43e5972c4de9da rpi-userland-29835184aa70c13d77a11d721e934a7298bdf46a.tar.gz
+sha256 8ed745ea28ef9d5e6d2e5534acabe1ea1a6c6be9bab7f683527ce5da5a3f77cb rpi-userland-a7976021a89451de0d008aa48f16c4e88872899b.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 90077a19f5..a798795bae 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 29835184aa70c13d77a11d721e934a7298bdf46a
+RPI_USERLAND_VERSION = a7976021a89451de0d008aa48f16c4e88872899b
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.14.1
