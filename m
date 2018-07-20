From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jul 2018 00:33:47 +0200
Subject: [Buildroot] [git commit] Update for 2018.02.4
Message-ID: <20180720223133.063248A2EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d91fdfeeae76dd7c80f13eec2eed884af238b1aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e4eaf7311dfffff7fd753f24ce2d01a6f5188292)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/CHANGES b/CHANGES
index ef5aec274c..07fd033a30 100644
--- a/CHANGES
+++ b/CHANGES
@@ -226,6 +226,31 @@
 	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
 		enabled
 
+2018.02.4, Released July 21th, 2018
+
+	Important / security related fixes.
+
+	U-Boot: Ensure host version of ncurses is picked up and not
+	host-ncurses built by buildroot, as that otherwise causes
+	widechar/non-widechar conflicts and corrupted menuconfig
+	menus.
+
+	Linux: Enable CONFIG_PERF_EVENTS when perf is enabled.
+
+	Defconfigs: Raspberrypi3: Bump rootfs size, Minnowboard-max:
+	Support ethernet on Turbot variant.
+
+	Updated/fixed packages: bind, clamav, collectd, dos2unix,
+	edid-decode, gcc, gdb, heimdal, hidapi, imx-gpu-viv, libcurl,
+	libglib2, liblogging, libostree, libsoup, libv4l, lm-sensors,
+	ncurses, network-manager, patchelf, pinentry, procps-ng, qpdf,
+	qt5, qt53d, qt5base, qt5charts, qt5script, qt5serialport,
+	systemd, wireguard, wireless-regdb
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11101: host-patchelf Endian Issue with relative RPATH
+
 2018.02.3, Released June 18th, 2018
 
 	Important / security related fixes.
