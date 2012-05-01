From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 16:44:35 +0200
Subject: [Buildroot] [git commit] libdvdread: change SITE
Message-ID: <20120501145311.7653D96C3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01c227553c1e77e29bbc185824bae9b614b52ad8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libdvdread/libdvdread.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libdvdread/libdvdread.mk b/package/multimedia/libdvdread/libdvdread.mk
index 5226414..3a9d5be 100644
--- a/package/multimedia/libdvdread/libdvdread.mk
+++ b/package/multimedia/libdvdread/libdvdread.mk
@@ -6,7 +6,7 @@
 
 LIBDVDREAD_VERSION = 4.1.3
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
-LIBDVDREAD_SITE = http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
+LIBDVDREAD_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
