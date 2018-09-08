From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:11:04 +0200
Subject: [Buildroot] [git commit] libmpdclient: bump to version 2.15
Message-ID: <20180908131013.B15F7835C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b356d878618058979671a08ebc0e5715115a8771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmpdclient/libmpdclient.hash | 4 ++--
 package/libmpdclient/libmpdclient.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index eb32786419..61ee5be6a3 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,3 +1,3 @@
-# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.14.tar.xz.sig, sha256 locally computed
-sha256  0a84e2791bfe3077cf22ee1784c805d5bb550803dffe56a39aa3690a38061372  libmpdclient-2.14.tar.xz
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.15.tar.xz.sig, sha256 locally computed
+sha256  b4dbf6f9fd99e8e7c183cb3b7de75ee4ac14d92ca43e9a99bef09168b20246d1  libmpdclient-2.15.tar.xz
 sha256  9574c3b0a9c31723cc3d5f32af4655a015fff5ec6ec8115b7906cd7d9623cf32  COPYING
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index c04536eb88..b812e63cdf 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).14
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).15
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_INSTALL_STAGING = YES
