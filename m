From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Sep 2015 12:34:38 +0200
Subject: [Buildroot] [PATCH 4/5] package/libva-intel-driver: bump to version
	1.6.1
In-Reply-To: <1442658879-5494-1-git-send-email-bernd.kuhls@t-online.de>
References: <1442658879-5494-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1442658879-5494-4-git-send-email-bernd.kuhls@t-online.de>
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
index 57010bc..0c57fab 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2015-July/003405.html, checked locally
-sha1	8d9da76883429a155511ee0e71a737aea07ad217	libva-intel-driver-1.6.0.tar.bz2
+# From http://lists.freedesktop.org/archives/libva/2015-September/003521.html
+sha1	ee2ef304b0cca8323bf4840a3af50278f8806944	libva-intel-driver-1.6.1.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index a61f55e..e199286 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.6.0
+LIBVA_INTEL_DRIVER_VERSION = 1.6.1
 LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
-- 
2.1.4
