From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 Dec 2010 11:30:20 +0100
Subject: [Buildroot] [git commit master 1/1] libvorbis: bump version
Message-ID: <20101231103105.B66418E1BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=acc6188d5c4dca5117c9aa2f274833b892b68656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Derived from patch by Martin Banky.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libvorbis/libvorbis.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index 9a060d9..0570ea6 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBVORBIS_VERSION = 1.2.3
+LIBVORBIS_VERSION = 1.3.2
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
 LIBVORBIS_AUTORECONF = NO
-- 
1.7.2.2
