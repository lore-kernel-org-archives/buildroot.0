From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jan 2015 13:17:29 +0100
Subject: [Buildroot] [PATCH 2/6] package/libva-intel-driver: bump version to
	1.5.0
In-Reply-To: <1420373853-20008-1-git-send-email-bernd.kuhls@t-online.de>
References: <1420373853-20008-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1420373853-20008-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-intel-driver/libva-intel-driver.hash |    4 ++--
 package/libva-intel-driver/libva-intel-driver.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index cf64423..837a40e 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,2 @@
-# http://lists.freedesktop.org/archives/libva/2014-October/002779.html
-sha1	441cc9c0b51eb90ede79609111d0944b4f2ff682	libva-intel-driver-1.4.1.tar.bz2
+# http://lists.freedesktop.org/archives/libva/2014-December/002982.html
+sha1	9f8dc82879d1cf6cbbe7ef49b5d659ccdf45acd7	libva-intel-driver-1.5.0.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 175c085..0d1a0a7 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.4.1
+LIBVA_INTEL_DRIVER_VERSION = 1.5.0
 LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
-- 
1.7.10.4
