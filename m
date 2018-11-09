From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:28:28 +0100
Subject: [Buildroot] [git commit] package/libmpdclient: bump to version 2.16
Message-ID: <20181109212605.1EC6E821E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b80b609f95a7f4fd02d210307667bcdfbb8d568
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmpdclient/libmpdclient.hash | 4 ++--
 package/libmpdclient/libmpdclient.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index 61ee5be6a3..f268e876e2 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,3 +1,3 @@
-# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.15.tar.xz.sig, sha256 locally computed
-sha256  b4dbf6f9fd99e8e7c183cb3b7de75ee4ac14d92ca43e9a99bef09168b20246d1  libmpdclient-2.15.tar.xz
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.16.tar.xz.sig, sha256 locally computed
+sha256  fa6bdab67c0e0490302b38f00c27b4959735c3ec8aef7a88327adb1407654464  libmpdclient-2.16.tar.xz
 sha256  9574c3b0a9c31723cc3d5f32af4655a015fff5ec6ec8115b7906cd7d9623cf32  COPYING
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index b812e63cdf..dc206c7211 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).15
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).16
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_INSTALL_STAGING = YES
