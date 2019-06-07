From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Jun 2019 10:36:23 +0200
Subject: [Buildroot] [git commit] Update for 2019.02.3
Message-ID: <20190607083835.4149A8B7AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c700c8ba7cf3baf72ee99d0f929579cc2c79c808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop Makefile changes]
(cherry picked from commit 3e8b918b871f484b3ef57832aa41982e368d74c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/CHANGES b/CHANGES
index 35a094b70f..0ab5749aca 100644
--- a/CHANGES
+++ b/CHANGES
@@ -114,6 +114,38 @@
 	#11761: Building custom kernel 5.1-rc3 or later breaks on objtool
 	#11816: Only selected coreutils binaries are installed
 
+2019.02.3, Released June 7th, 2019
+
+	Important / security related fixes.
+
+	Infra: pkg-config: Use a dedicated timestamp file rather than
+	.config as that gets touched by linux-4.19+, causing repeated
+	builds.
+
+	check-bin-arch: Also ignore /usr/lib/grub to support merged
+	/usr setups, similar to how /lib/grub is ignored.
+
+	gnuconfig/config.sub: Add C-SKY architecture support.
+
+	Updated/fixed packages: assimp, atftp, atop, botan, busybox,
+	ca-certificates, chocolate-doom, cjson, coreutils, cracklib,
+	ddrescue, dhcp, docker-cli, docker-containerd, docker-engine,
+	dosfstools, dovecot, dovecot-pigeonhole, dropbear, exim,
+	ffmpeg, flare-engine, gcc, gdb, gerbera, glibmm, go, gpsd,
+	gst-ffmpeg, gst1-plugins-bad, gst1-plugins-base, imagemagick,
+	intel-microcode, jasper, kf5-kcoreaddons, kismet, libcurl,
+	libglib2, libnss, libopenssl, libsigrok, libssh2, libupnp18,
+	linuxptp, luajit, lynx, matchbox-panel, mender,
+	netcat-openbsd, netsurf, nfs-utils, opus, orc, owfs,
+	pcsc-lite, php, popt, postgresql, python, python-cython,
+	python-django, python-ply, qt5enginio, rpm, runc, samba4,
+	sqlite, subversion, supertux, systemd, tslib, uclibc,
+	v4l2loopback, webkitgtk, woff2
+
+	#11816: Only selected coreutils binaries are installed
+	#11841: grub-efi.cfg not used when building EFI disk image
+	#11911: systemd v240 memory leak in systemd-journald
+
 2019.02.2, Released April 29th, 2019
 
 	Important / security related fixes.
