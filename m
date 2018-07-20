From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jul 2018 10:39:36 +0200
Subject: [Buildroot] [git commit] Update for 2018.05.1
Message-ID: <20180720083845.7AF098917B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3134d94ed1f68dec95d39e4a8638fed67f893cc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ef26ffddded912570ca3893271e2900aa8b27866)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/CHANGES b/CHANGES
index 44484ee80e..ef5aec274c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2018.05.1, Released July 20th, 2018
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
+	Toolchain: ARC tools updated to arc-2018.03.
+
+	pkg-stats: Fix python 3.x compatibility.
+
+	dl-wrapper: Fix support for URIs containing '+', fix
+	no-check-hash for inferred site method.
+
+	Defconfigs: Raspberrypi3: Bump rootfs size, Minnowboard-max:
+	Support ethernet on Turbot variant.
+
+	Updated/fixed packages: audit, bind, btrfs-progs, cifs-utils,
+	clamav, collectd, coreutils, docker-containerd, dos2unix,
+	edid-decode, file, gcc, gdb, gnupg, gnupg2, heimdal, hidapi,
+	imagemagick, libcurl, libgcrypt, libglib2, liblogging,
+	libostree, libressl, libsoup, libv4l, libvncserver, libvorbis,
+	libwebsockets, libxslt, lm-sensors, mariadb, mpg123, ncurses,
+	network-manager, nodejs, patchelf, perl, php-amqp, pinentry,
+	pixiewps, qpdf, qt53d, qt5base, qt5charts, qt5script, redis,
+	systemd, triggerhappy, uboot, wireguard, wireless-regdb,
+	wireshark
+
 2018.05, Released June 1st, 2018
 
 	Minor fixes.
