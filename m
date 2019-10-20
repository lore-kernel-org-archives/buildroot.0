From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Oct 2019 11:33:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/libdvdread: bump version to 6.0.2
Message-ID: <20191020093333.31368-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://code.videolan.org/videolan/libdvdread/blob/master/NEWS

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdvdread/libdvdread.hash | 8 ++++++--
 package/libdvdread/libdvdread.mk   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index e21d6002dc..c6b5807af9 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,5 +1,9 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/6.0.1/libdvdread-6.0.1.tar.bz2.sha256
-sha256	28ce4f0063883ca4d37dfd40a2f6685503d679bca7d88d58e04ee8112382d5bd	libdvdread-6.0.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.0.2/libdvdread-6.0.2.tar.bz2.md5
+md5 49990935174bf6b2fa501e789c578135 libdvdread-6.0.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.0.2/libdvdread-6.0.2.tar.bz2.sha1
+sha1 a3d4b85cbe52b11cff7587ed010fa38ce512fd95 libdvdread-6.0.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.0.2/libdvdread-6.0.2.tar.bz2.sha256
+sha256 f91401af213b219cdde24b46c50a57f29301feb7f965678f1d7ed4632cc6feb0 libdvdread-6.0.2.tar.bz2
 
 # Hash for license file:
 sha256	d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572	COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 10255a1616..7744fc42ac 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 6.0.1
+LIBDVDREAD_VERSION = 6.0.2
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
 LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
-- 
2.20.1
