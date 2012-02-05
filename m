From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 Feb 2012 22:14:54 +0100
Subject: [Buildroot] [git commit] libvorbis: bump version
Message-ID: <20120205211525.DAEC7909C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b236b937df3507d4d7abd1fc58dae523df5a59e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libvorbis/libvorbis.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index dfe7bce..6844414 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -4,12 +4,10 @@
 #
 #############################################################
 
-LIBVORBIS_VERSION = 1.3.2
+LIBVORBIS_VERSION = 1.3.3
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
-LIBVORBIS_AUTORECONF = NO
 LIBVORBIS_INSTALL_STAGING = YES
-LIBVORBIS_INSTALL_TARGET = YES
 
 LIBVORBIS_CONF_OPT = --disable-oggtest
 
