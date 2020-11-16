From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 23:46:25 +0100
Subject: [Buildroot] [git commit branch/next] Update for 2020.08.2
Message-ID: <20201117203830.1DAA87FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e71de910359e20796a50407338b240c9c6397c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5a90d87d331aa440cd024c7269a0673d94792896)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/CHANGES b/CHANGES
index 9957622c34..41d5ee7a7a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -106,6 +106,34 @@
 	#13236: Can't compile linux 5.4.8 (with gcc 10 on host)
 	#13286: The system hangs in vmware workstation on the line..
 
+2020.08.2, released November 16th, 2020
+
+	Important / security related fixes.
+
+	Toolchain-wrapper: Pass -fno-tree-loop-distribute-patterns to
+	fix kernel build on microblaze with gcc 10.x when
+	optimizations are enabled.
+
+	Updated/fixed packages: apparmor, argp-standalone, asterisk,
+	bandwidthd, binutils, bitcoin, busybox, collectd, cryptsetup,
+	cups-filters, darkhttpd, davfs2, docker-cli,
+	docker-containerd, docker-engine, dovecot-pigeonhole,
+	dvb-apps, elf2flt, fastd, fbset, fbtft, freetype, gcc,
+	ghostscript, grpc, gst1-plugins-bad, jsoncpp,
+	kernel-module-imx-gpu-viv, keepalived, kmscube, libass,
+	libexif, libiqrf, libnetfilter_conntrack, libpam-tacplus,
+	libraw, linux-backports, linux-firmware, lzlib, mp4v2,
+	netsnmp, nginx, numactl, oniguruma, opencv3, openntpd,
+	patchelf, php, pistache, postgresql, python-pyqt5, qemu,
+	qt5base, rauc, redis, samba4, slirp, systemd, tcpdump,
+	tinyproxy, tmux, tor, waf, webkitgtk, wine,
+	wireguard-linux-compat, wireshark, wpewebkit, xen, xorriso,
+	xvisor, zeromq, zxing-cpp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11931: Bugs in support/scripts/apply-patches.sh
+
 2020.08.1, released October 12th, 2020
 
 	Important / security related fixes.
