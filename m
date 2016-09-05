From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Sep 2016 12:02:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/libva-intel-driver: bump version to
	1.7.2
In-Reply-To: <20160905100219.12838-1-bernd.kuhls@t-online.de>
References: <20160905100219.12838-1-bernd.kuhls@t-online.de>
Message-ID: <20160905100219.12838-2-bernd.kuhls@t-online.de>
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
index a480c2c..24c2170 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/libva/2016-June/004035.html
-sha1	eb3660197ce4781af4db4d97b0d7965900e7b06e	libva-intel-driver-1.7.1.tar.bz2
+# From https://lists.freedesktop.org/archives/libva/2016-September/004380.html
+sha1 9373afadd6ec0d6d983cf5bb2001d91c22b39719  libva-intel-driver-1.7.2.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index dadd67b..c388de1 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.7.1
+LIBVA_INTEL_DRIVER_VERSION = 1.7.2
 LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
-- 
2.9.3
