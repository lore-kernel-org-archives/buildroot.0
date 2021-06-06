From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Jun 2021 09:51:02 +0200
Subject: [Buildroot] [PATCH/next 2/3] package/libdvdnav: bump version to
 6.1.1
In-Reply-To: <20210606075103.699369-1-bernd.kuhls@t-online.de>
References: <20210606075103.699369-1-bernd.kuhls@t-online.de>
Message-ID: <20210606075103.699369-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://code.videolan.org/videolan/libdvdnav/-/blob/master/ChangeLog

Removed md5 hash, reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdvdnav/libdvdnav.hash | 12 +++++-------
 package/libdvdnav/libdvdnav.mk   |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.hash b/package/libdvdnav/libdvdnav.hash
index 04706b0bb9..61d64b8ee3 100644
--- a/package/libdvdnav/libdvdnav.hash
+++ b/package/libdvdnav/libdvdnav.hash
@@ -1,9 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.0/libdvdnav-6.1.0.tar.bz2.md5
-md5 8817ac12c13644df6ba2091c2dcaeed3 libdvdnav-6.1.0.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.0/libdvdnav-6.1.0.tar.bz2.sha1
-sha1 b0597e9d11393e17b57f784c0dcba33a499e80b0 libdvdnav-6.1.0.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.0/libdvdnav-6.1.0.tar.bz2.sha256
-sha256 f697b15ea9f75e9f36bdf6ec3726308169f154e2b1e99865d0bbe823720cee5b libdvdnav-6.1.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.1/libdvdnav-6.1.1.tar.bz2.sha1
+sha1  7ac76aa95d046db715763da23b7053b65cbc7540  libdvdnav-6.1.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.1/libdvdnav-6.1.1.tar.bz2.sha256
+sha256  c191a7475947d323ff7680cf92c0fb1be8237701885f37656c64d04e98d18d48  libdvdnav-6.1.1.tar.bz2
 
 # Hash for license file:
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index c5bebd4926..e34c0710bc 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDNAV_VERSION = 6.1.0
+LIBDVDNAV_VERSION = 6.1.1
 LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
 LIBDVDNAV_SITE = http://www.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
 LIBDVDNAV_INSTALL_STAGING = YES
-- 
2.29.2
