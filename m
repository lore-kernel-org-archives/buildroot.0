From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Jun 2021 09:51:01 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/libdvdread: bump version to
 6.1.2
Message-ID: <20210606075103.699369-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://code.videolan.org/videolan/libdvdread/-/blob/master/NEWS

Removed md5 hash, reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdvdread/libdvdread.hash | 12 +++++-------
 package/libdvdread/libdvdread.mk   |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index 00066619ce..de9afcfa30 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,9 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.1/libdvdread-6.1.1.tar.bz2.md5
-md5 09c7423568fb679279fd2a2bc6b10b6e libdvdread-6.1.1.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.1/libdvdread-6.1.1.tar.bz2.sha1
-sha1 d2e5056de89fb5fed478c0af5a72e8b781d0c396 libdvdread-6.1.1.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.1/libdvdread-6.1.1.tar.bz2.sha256
-sha256 3e357309a17c5be3731385b9eabda6b7e3fa010f46022a06f104553bf8e21796 libdvdread-6.1.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.2/libdvdread-6.1.2.tar.bz2.sha1
+sha1  789d0780fbdcd7d6dadf0fda3d4a4b6198c16393  libdvdread-6.1.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.2/libdvdread-6.1.2.tar.bz2.sha256
+sha256  cc190f553758ced7571859e301f802cb4821f164d02bfacfd320c14a4e0da763  libdvdread-6.1.2.tar.bz2
 
 # Hash for license file:
-sha256	d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572	COPYING
+sha256  d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572  COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index aa91d3162a..9ddb6721c7 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 6.1.1
+LIBDVDREAD_VERSION = 6.1.2
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
 LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
-- 
2.29.2
