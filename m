From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Jul 2009 21:09:56 +0200
Subject: [Buildroot] [git commit] libvorbis: bump version
Message-ID: <20090712195657.23EF277800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01674622186a8bd52f9410bb1120be2f82de733c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


bugfix release - Fixes playback of very short files.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libvorbis/libvorbis.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index a318291..e7399e0 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBVORBIS_VERSION = 1.2.2
+LIBVORBIS_VERSION = 1.2.3
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
 LIBVORBIS_AUTORECONF = NO
-- 
1.6.3.3
