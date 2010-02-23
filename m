From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Feb 2010 21:59:24 +0100
Subject: [Buildroot] [git commit master] CHANGES: add changes from
	misc-fixes5 branch
Message-ID: <20100223210229.5142377692@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=89fd72086685765f748bf4ccd06c444fb0efd310
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index dae674d..2e737fe 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,9 +2,15 @@
 
 	Fixes all over the tree and new features.
 
+	New packages: intltool
+
 	Updated/fixed packages: ace_of_penguins, alsa-lib, alsa-utils, argus,
-	at, e2fsprogs, gst-plugins-good, libpcap, rsync, rubix, tcl,
-	xproto_trapproto
+	at, automake, ccache, dosfstools, e2fsprogs, flex, gob2, gmpc,
+	gst-plugins-good, imagemagick, iw, kexec, libeXosip, libgtk2,
+	libpcap, libpng, libsoup, libxcb, libxml-parser-perl, libxml2,
+	libxslt, lvm2, matchbox, mplayer, rsync, rubix, shared-mime-info,
+	tcl, webkit, xapp_mkfontscale, xfont_encodings, xfont_font-util,
+	xlib_libfontenc, xproto_trapproto, zlib
 
 	Removed package: xboard
 
-- 
1.6.3.3
