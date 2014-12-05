From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  5 Dec 2014 22:04:30 +0100
Subject: [Buildroot] [PATCH] libv4l: bump to version 1.6.2
Message-ID: <1417813470-11576-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/libv4l/libv4l.hash | 3 +--
 package/libv4l/libv4l.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 80e677a..609cfbc 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha1	e0b74818e6f4a4b8974e152f4c00bec6c62265e5  v4l-utils-1.6.0.tar.bz2
-sha256	6054d3120c67a1524993e699b3b02036c817bb000b742c332682163966dc7605  v4l-utils-1.6.0.tar.bz2
+sha256 d3d6eb1f0204fb11f3d318bfca35d5f73cc077f88fac7665a47856a16496be7d  v4l-utils-1.6.2.tar.bz2
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 63dd5d2..94c7031 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.6.0
+LIBV4L_VERSION = 1.6.2
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
-- 
2.1.2
