From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 15:36:24 +0200
Subject: [Buildroot] [git commit branch/next] CHANGES: update with resolved
	issues
Message-ID: <20150808105653.D111F7F992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cf7a561c91121cc1220a1c6820bc723abec0508
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 830f525..ce16e2e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -199,6 +199,32 @@
 	Deprecated packages: webkitgtk, libgail, eglibc support in
 	glibc package.
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#4291: Segmentation fault with all binaries that use threads
+               when compiled with gcc 4.6
+	#6944: building toolchain for sh4 fails
+	#7592: Buildroot GCC: -lto requires plugin support in ranlib
+	#7628: Python SSL does not get built for Raspberry Pi
+	#7682: Missing dependencies for NFS
+	#7742: dhcp lacks important features when BR2_ENABLE_DEBUG
+	#7754: make: *** [/..../buildroot-2014.11/output/build/host-gcc-initial-4.8.3/.stamp_built] Error 2
+	#7946: libglib2-2.42.2 fails to build for sparc-buildroot-linux-gnu
+	#7956: glibc 2.20 and 2.21 fail to build for sh64-buildroot-linux-gnu
+	#7971: python-flask, python-werkzeug. No module named zlib
+	#7981: Target file system skeleton permissions hazard
+	#8006: rpcdebug in nfs-utils built for the host
+	#8036: alsa-lib headers problem that prevents to compile alsa
+               dependent projects
+	#8081: systemd init system: /tmp is not mode 1777
+	#8121: php opcache extension doesn't get installed
+	#8151: x86-64 make fails with ncurses 5.9
+	#8156: pkg-kconfig infra broken for *-update-{config, defconfig}
+	#8161: default /bin/sh symlink to busybox is full path and not relative
+	#8171: glamor missing
+	#8191: Request update support for the cubieboard series
+	#8201: Important security upgrades for node.js
+
 2015.05, Released May 31st, 2015
 
 	Minor fixes.
