From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Jul 2015 21:54:55 +0200
Subject: [Buildroot] [PATCH 3/4] package/libva-intel-driver: bump version to
	1.6.0
In-Reply-To: <1435780496-31814-1-git-send-email-bernd.kuhls@t-online.de>
References: <1435780496-31814-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1435780496-31814-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream hash is in sha1 format, like before. It is wrongly announced
as md5 in the release mail, so I added a note to the hash file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-intel-driver/libva-intel-driver.hash |    4 ++--
 package/libva-intel-driver/libva-intel-driver.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index b03bb1d..8d4a0d6 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2015-March/003250.html
-sha1	98b670517cbd2d0e5e2ef3f171b805815dff9057	libva-intel-driver-1.5.1.tar.bz2
+# From http://lists.freedesktop.org/archives/libva/2015-July/003405.html, checked locally
+sha1	8d9da76883429a155511ee0e71a737aea07ad217	libva-intel-driver-1.6.0.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 8469314..a61f55e 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.5.1
+LIBVA_INTEL_DRIVER_VERSION = 1.6.0
 LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
-- 
1.7.10.4
