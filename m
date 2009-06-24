From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Jun 2009 15:41:28 +0200
Subject: [Buildroot] [git commit] lib{ogg,vorbis}: bump version
Message-ID: <20090625112839.951D0777FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85df29b9fcefa016c9ad3fba6cfc195008072f77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libogg/libogg.mk       |    2 +-
 package/multimedia/libvorbis/libvorbis.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/libogg/libogg.mk b/package/multimedia/libogg/libogg.mk
index c76c932..6c88da1 100644
--- a/package/multimedia/libogg/libogg.mk
+++ b/package/multimedia/libogg/libogg.mk
@@ -3,7 +3,7 @@
 # libogg
 #
 #############################################################
-LIBOGG_VERSION = 1.1.3
+LIBOGG_VERSION = 1.1.4
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.gz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_AUTORECONF = NO
diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index bda141e..a318291 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBVORBIS_VERSION = 1.2.0
+LIBVORBIS_VERSION = 1.2.2
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
 LIBVORBIS_AUTORECONF = NO
-- 
1.6.0.6
