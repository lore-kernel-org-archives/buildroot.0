From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 Feb 2020 20:00:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmpdclient: bump to version 2.18
Message-ID: <20200203190007.2277806-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmpdclient/libmpdclient.hash | 4 ++--
 package/libmpdclient/libmpdclient.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index f268e876e2..e4456f125c 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,3 +1,3 @@
-# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.16.tar.xz.sig, sha256 locally computed
-sha256  fa6bdab67c0e0490302b38f00c27b4959735c3ec8aef7a88327adb1407654464  libmpdclient-2.16.tar.xz
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.18.tar.xz.sig, sha256 locally computed
+sha256  4cb01e1f567e0169aca94875fb6e1200e7f5ce35b63a4df768ec1591fb1081fa  libmpdclient-2.18.tar.xz
 sha256  9574c3b0a9c31723cc3d5f32af4655a015fff5ec6ec8115b7906cd7d9623cf32  COPYING
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index dc206c7211..6e7c5a45a9 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).16
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).18
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_INSTALL_STAGING = YES
-- 
2.24.1
