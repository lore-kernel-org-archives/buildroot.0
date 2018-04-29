From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 15:31:43 +0200
Subject: [Buildroot] [PATCH 1/1] libdvdread: bump to version 6.0.0
Message-ID: <20180429133143.16343-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdvdread/libdvdread.hash | 7 +++++--
 package/libdvdread/libdvdread.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index bef93fc015..44a3f98468 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,2 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/5.0.0/libdvdread-5.0.3.tar.bz2.sha256
-sha256	321cdf2dbdc83c96572bc583cd27d8c660ddb540ff16672ecb28607d018ed82b	libdvdread-5.0.3.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.0.0/libdvdread-6.0.0.tar.bz2.sha256
+sha256	b33b1953b4860545b75f6efc06e01d9849e2ea4f797652263b0b4af6dd10f935	libdvdread-6.0.0.tar.bz2
+
+# Hash for license file:
+sha256	d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572	COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 0e335e5c67..f41a188f8e 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 5.0.3
+LIBDVDREAD_VERSION = 6.0.0
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
 LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
-- 
2.14.1
