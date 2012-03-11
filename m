From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 23:05:42 +0100
Subject: [Buildroot] [git commit] mpd: autoreconf no longer needed
Message-ID: <20120311222556.D276F90D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e18ec75f8bf04ed2abcf6f8a09a872fde047d5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure.ac patch got dropped with the 0.16.3 version bump.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/mpd.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 89cf7b2..e3b5331 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -6,7 +6,6 @@
 
 MPD_VERSION = 0.16.7
 MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
-MPD_AUTORECONF = YES
 MPD_DEPENDENCIES = host-pkg-config libglib2
 
 # Some options need an explicit --disable or --enable
