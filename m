From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2020 15:04:48 +0200
Subject: [Buildroot] [PATCH 1/3] package/libdvdread: bump version to 6.1.1
Message-ID: <20200410130450.3320905-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://code.videolan.org/videolan/libdvdread/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdvdread/libdvdread.hash | 12 ++++++------
 package/libdvdread/libdvdread.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index c6b5807af9..00066619ce 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,9 +1,9 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/6.0.2/libdvdread-6.0.2.tar.bz2.md5
-md5 49990935174bf6b2fa501e789c578135 libdvdread-6.0.2.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdread/6.0.2/libdvdread-6.0.2.tar.bz2.sha1
-sha1 a3d4b85cbe52b11cff7587ed010fa38ce512fd95 libdvdread-6.0.2.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdread/6.0.2/libdvdread-6.0.2.tar.bz2.sha256
-sha256 f91401af213b219cdde24b46c50a57f29301feb7f965678f1d7ed4632cc6feb0 libdvdread-6.0.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.1/libdvdread-6.1.1.tar.bz2.md5
+md5 09c7423568fb679279fd2a2bc6b10b6e libdvdread-6.1.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.1/libdvdread-6.1.1.tar.bz2.sha1
+sha1 d2e5056de89fb5fed478c0af5a72e8b781d0c396 libdvdread-6.1.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.1.1/libdvdread-6.1.1.tar.bz2.sha256
+sha256 3e357309a17c5be3731385b9eabda6b7e3fa010f46022a06f104553bf8e21796 libdvdread-6.1.1.tar.bz2
 
 # Hash for license file:
 sha256	d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572	COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 7744fc42ac..9a8eb7cacd 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 6.0.2
+LIBDVDREAD_VERSION = 6.1.1
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
 LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
-- 
2.25.0
