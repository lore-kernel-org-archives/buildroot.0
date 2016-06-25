From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Jun 2016 10:51:26 +0200
Subject: [Buildroot] [PATCH 2/2] package/libva-intel-driver: bump version to
	1.7.1
In-Reply-To: <1466844686-12576-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466844686-12576-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1466844686-12576-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-intel-driver/libva-intel-driver.hash | 4 ++--
 package/libva-intel-driver/libva-intel-driver.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 9d77aed..a480c2c 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/libva/2016-March/003886.html
-sha1	6766ff2e8134e09e9204ec9ccd3b8d550890d5d2	libva-intel-driver-1.7.0.tar.bz2
+# From https://lists.freedesktop.org/archives/libva/2016-June/004035.html
+sha1	eb3660197ce4781af4db4d97b0d7965900e7b06e	libva-intel-driver-1.7.1.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index e930ade..dadd67b 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.7.0
+LIBVA_INTEL_DRIVER_VERSION = 1.7.1
 LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
-- 
2.8.1
