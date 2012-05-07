From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 May 2012 21:39:01 +0200
Subject: [Buildroot] [git commit] libdvdnav: requires pkg-config
Message-ID: <20120507194542.EA42C96C5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=311d542b2e992c328ddacd1b91dd0aab09c38f5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/ababd836c7e7c3e63b3c7825244a56e30462c56d/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libdvdnav/libdvdnav.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index f69f238..1c38904 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -10,7 +10,7 @@ LIBDVDNAV_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
 
-LIBDVDNAV_DEPENDENCIES = libdvdread
+LIBDVDNAV_DEPENDENCIES = libdvdread host-pkg-config
 
 # By default libdvdnav tries to find dvdread-config in $PATH. Because
 # of cross compilation, we prefer using pkg-config.
