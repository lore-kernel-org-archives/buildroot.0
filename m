From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 16:44:43 +0200
Subject: [Buildroot] [git commit] libdvdnav: change SITE
Message-ID: <20120501145311.87C7596C42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f01dbfdec4b880d658db4054a7e4527a61116548
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libdvdnav/libdvdnav.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libdvdnav/libdvdnav.mk b/package/multimedia/libdvdnav/libdvdnav.mk
index 7f68533..f69f238 100644
--- a/package/multimedia/libdvdnav/libdvdnav.mk
+++ b/package/multimedia/libdvdnav/libdvdnav.mk
@@ -6,7 +6,7 @@
 
 LIBDVDNAV_VERSION = 4.1.3
 LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
-LIBDVDNAV_SITE = http://www.mplayerhq.hu/MPlayer/releases/dvdnav
+LIBDVDNAV_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
 
