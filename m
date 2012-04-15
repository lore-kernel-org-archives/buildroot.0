From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Apr 2012 09:12:54 +0200
Subject: [Buildroot] [git commit] mpd: bump to version 0.16.8
Message-ID: <20120415081618.15B1596AB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b163ca39320e54192102218ee137b13b7828695e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/mpd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index e3b5331..095bad6 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-MPD_VERSION = 0.16.7
-MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
+MPD_VERSION = 0.16.8
+MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
 MPD_DEPENDENCIES = host-pkg-config libglib2
 
 # Some options need an explicit --disable or --enable
