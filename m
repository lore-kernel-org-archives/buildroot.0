From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 15 May 2013 20:48:41 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20130515191807.AA3B69A1B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a517092fa3205af65935bb1c7b395b54778ee68f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3009071..e2f3f3b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,13 +6,14 @@
 
 	Defconfigs: Add Telit EVK-PRO3, AT91SAM9260-EK Nand flash.
 
-	Updated/fixed packages: busybox, cairo, classpath, curlftpfs,
-	czmq, dbus, f2fs-tools, fan-ctrl, filemq, gst-plugin-bad,
-	gutenprint, hplip, json-c, libatomic_ops, libcurl, libdrm,
-	libnspr, libnss, libsha1, libsigsegv, libxcb, linknx,
-	linux-pam, lttng-modules, lttng-tools, matchbox-lib, mcookie,
-	mesa3d, neon, pixman, pulseaudio, python-nfc, qt5imageformats,
-	quota, openssl, sconeserver, strace, sylpheed, wvstreams,
+	Updated/fixed packages: aircrack-ng, busybox, cairo,
+	classpath, curlftpfs, czmq, dbus, f2fs-tools, fan-ctrl,
+	filemq, gst-plugin-bad, gutenprint, hplip, json-c,
+	libatomic_ops, libcurl, libdrm, libglib2, libnspr, libnss,
+	libsha1, libsigsegv, libxcb, linknx, linux-pam, lttng-modules,
+	lttng-tools, matchbox-lib, mcookie, mesa3d, neon, pixman,
+	pulseaudio, python-nfc, qt5imageformats, quota, openssl,
+	sconeserver, strace, sylpheed, wvstreams,
 	xapp_{appres,bdftopcf,beforelight,bitmap,edires,fonttosfnt},
 	xapp_{fslsfonts,fstobdf,iceauth,ico,listres,luit,mkfontdir},
 	xapp_{mkfontscale,oclock,rgb,rstart,scripts,sessreg,setxkbmap},
@@ -51,6 +52,8 @@
 	xproto_{xf86bigfont,xf86dga,xf86dri,xf86vidmode,xinerama,x}proto,
 	xserver_xorg-server, xutil_{makedepend,util-macros}
 
+	Readded Packages: xapp_xinit
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#5054: amd64: cannot find init - due to missing /lib64 folder
