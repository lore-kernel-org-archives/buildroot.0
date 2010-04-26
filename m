From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Apr 2010 23:01:14 +0200
Subject: [Buildroot] [git commit master] samba: bump version
Message-ID: <20100426210141.CA07F202FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ba9ed1370808f94f8d24d4a16467db620d159af1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1561

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    3 ++-
 package/samba/samba.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3f18ec6..2e4cdeb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -17,7 +17,7 @@
 	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, matchbox,
 	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, pciutils,
 	php, pixman, portage, pppd, pthread-stubs, python, qt, radvd,
-	setserial, squashfs, tslib, usb_modeswith, wget,
+	samba, setserial, squashfs, tslib, usb_modeswith, wget,
 	xdriver_xf86-video-intel, xkeyboard-config, xlib_libX11,
 	xlib_libXaw, xlib_libXfont, xlib_libXfontcache, xlib_libXxf86misc,
 	xlib_libpciaccess, xproto_dri2proto, xproto_eviext,
@@ -62,6 +62,7 @@
 	#1513: Enable powerpc e300c2, e300c3 and e500mc optimization
 	#1537: dev entries not created anymore
 	#1555: Fix default uclibc-0.9.31 configuration
+	#1561: [SECURITY] Update samba to 3.3.12
 	#1567: openssl0.9.8n fails to compile
 	#1591: portmap fails to compile
 
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 9ff2bb1..4115363 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -3,7 +3,7 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.3.8
+SAMBA_VERSION:=3.3.12
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 SAMBA_SITE:=http://samba.org/samba/ftp/stable/
 
-- 
1.6.3.3
