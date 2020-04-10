From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2020 15:04:49 +0200
Subject: [Buildroot] [PATCH 2/3] package/libdvdnav: bump version to 6.1.0
In-Reply-To: <20200410130450.3320905-1-bernd.kuhls@t-online.de>
References: <20200410130450.3320905-1-bernd.kuhls@t-online.de>
Message-ID: <20200410130450.3320905-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://code.videolan.org/videolan/libdvdnav/-/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdvdnav/libdvdnav.hash | 12 ++++++------
 package/libdvdnav/libdvdnav.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.hash b/package/libdvdnav/libdvdnav.hash
index 8de6debfeb..04706b0bb9 100644
--- a/package/libdvdnav/libdvdnav.hash
+++ b/package/libdvdnav/libdvdnav.hash
@@ -1,9 +1,9 @@
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.0.1/libdvdnav-6.0.1.tar.bz2.md5
-md5 3a28d2cc7e25c1cbcb06443f3114f0b1 libdvdnav-6.0.1.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.0.1/libdvdnav-6.0.1.tar.bz2.sha1
-sha1 258b82156e13803f2b0dbaec74e15475b4341d2f libdvdnav-6.0.1.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.0.1/libdvdnav-6.0.1.tar.bz2.sha256
-sha256 e566a396f1950017088bfd760395b0565db44234195ada5413366c9d23926733 libdvdnav-6.0.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.0/libdvdnav-6.1.0.tar.bz2.md5
+md5 8817ac12c13644df6ba2091c2dcaeed3 libdvdnav-6.1.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.0/libdvdnav-6.1.0.tar.bz2.sha1
+sha1 b0597e9d11393e17b57f784c0dcba33a499e80b0 libdvdnav-6.1.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.0/libdvdnav-6.1.0.tar.bz2.sha256
+sha256 f697b15ea9f75e9f36bdf6ec3726308169f154e2b1e99865d0bbe823720cee5b libdvdnav-6.1.0.tar.bz2
 
 # Hash for license file:
 sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 450f8f687d..d4c3b0c200 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDNAV_VERSION = 6.0.1
+LIBDVDNAV_VERSION = 6.1.0
 LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
 LIBDVDNAV_SITE = http://www.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
 LIBDVDNAV_INSTALL_STAGING = YES
-- 
2.25.0
