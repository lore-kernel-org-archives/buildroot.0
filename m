From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:11:04 -0700
Subject: [Buildroot] [PATCH 07/27] package/libdvdread: bump to version 6.0.1
Message-ID: <20190908161104.26143-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update URL in Config.in

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/libdvdread/Config.in       | 2 +-
 package/libdvdread/libdvdread.hash | 4 ++--
 package/libdvdread/libdvdread.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
index 91bec83a40..3579054158 100644
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBDVDREAD
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
 
-	  http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
+	  https://www.videolan.org/developers/libdvdnav.html
diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index 44a3f98468..9f73de7836 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,5 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/6.0.0/libdvdread-6.0.0.tar.bz2.sha256
-sha256	b33b1953b4860545b75f6efc06e01d9849e2ea4f797652263b0b4af6dd10f935	libdvdread-6.0.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.0.1/libdvdread-6.0.1.tar.bz2.sha256
+sha256 28ce4f0063883ca4d37dfd40a2f6685503d679bca7d88d58e04ee8112382d5bd libdvdread-6.0.1.tar.bz2
 
 # Hash for license file:
 sha256	d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572	COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index f41a188f8e..10255a1616 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 6.0.0
+LIBDVDREAD_VERSION = 6.0.1
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
 LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
-- 
2.20.1
