From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 14:36:52 +0200
Subject: [Buildroot] [git commit] mpd: bump to version 0.17.4
Message-ID: <20130412130252.B8DC69B5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21cbd13c3d194b6883585a1e7cabcdeaa5cedd5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/mpd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 5fbc8f6..e098c3d 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-MPD_VERSION = 0.17.3
-MPD_SITE = http://downloads.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
+MPD_VERSION = 0.17.4
+MPD_SITE = http://www.musicpd.org/download/mpd/stable
 MPD_DEPENDENCIES = host-pkgconf libglib2
 MPD_LICENSE = GPLv2
 MPD_LICENSE_FILES = COPYING
