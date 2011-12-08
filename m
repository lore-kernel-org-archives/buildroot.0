From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Dec 2011 23:09:24 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20111208221029.082188F71A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11eb9e7fbec3f458fa2146558d9ad162615d63be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index e5311f0..330ac6a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,29 @@
+2012.02, Not yet released:
+
+	Fixes all over the tree and new features.
+
+	Gentargets: scp and mercurial support.
+
+	defconfigs: qemu configs for x86-64 and sparc.
+
+	uClibc: remove 0.9.30, backport unshare() support.
+
+	Updated/fixed packages: barebox, bash, binutils, bison,
+	coreutils, dbus-glib, diffutils, dropbear, ebtables, flex,
+	fluxbox, gawk, grep, gst-dsp, htop, iproute2, iw, lame,
+	libgpg-error, libgtk2, libroxml, m4, module-init-tools,
+	mtd-utils, nano, nbd, netsnmp, ruby, u-boot, usbmount,
+	wpa_supplicant, xdm
+
+	New packages: connman, transmission
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#743:  Add Transmission bit torrent option to buildroot
+	#3403: libgpg-error: bump to version 1.10
+	#3409: libgpg-error: download from gnupg.org
+	#3421: nano: make tiny flag optional
+
 2011.11, Released November 30th, 2011:
 
 	Fixes all over the tree.
