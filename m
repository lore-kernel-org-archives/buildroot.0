From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 09:43:58 +0200
Subject: [Buildroot] [git commit] package/mpd: bump to version 0.18.14
Message-ID: <20140913075325.782679D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c41cfb49bdc0fbf9f46cdda04859f10c3864c534
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e01aca3..cf766c1 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.18
-MPD_VERSION = $(MPD_VERSION_MAJOR).13
+MPD_VERSION = $(MPD_VERSION_MAJOR).14
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf libglib2
