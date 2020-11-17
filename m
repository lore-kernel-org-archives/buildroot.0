From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 09:05:20 +0100
Subject: [Buildroot] [git commit] Update for 2020.02.8
Message-ID: <20201117075354.D657086B1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00e80cb1769047ad8c768d35003ae68fb4c3b0f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a4832641bcab4e3487a986ac31110fb2c006b2c0)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/CHANGES b/CHANGES
index 41d5ee7a7a..7393f4134c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -640,6 +640,26 @@
 	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
 	#12811: bootstrap stuck and no login prompt
 
+2020.02.8, released November 16th, 2020
+
+	Important / security related fixes.
+
+	Updated/fixed packages: angularjs, argp-standalone, asterisk,
+	bandwidthd, bitcoin, busybox, cryptsetup, darkhttpd, davfs2,
+	docker-cli, docker-containerd, docker-engine,
+	dovecot-pigeonhole, fastd, fbset, fbtft, freetype, gcc,
+	ghostscript, gnuradio, grpc, gst1-plugins-bad, jsoncpp,
+	keepalived, libass, libexif, libiqrf, libpam-tacplus, libraw,
+	linux-backports, linux-firmware, lzlib, netsnmp, nginx,
+	oniguruma, opencv3, openntpd, patchelf, php, postgresql,
+	python-pyqt5, qt5base, rauc, redis, samba4, slirp, systemd,
+	tcpdump, tmux, tor, webkitgtk, wireguard-linux-compat,
+	wireshark, wpewebkit, xen, xorriso, zeromq, zxing-cpp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11931: Bugs in support/scripts/apply-patches.sh
+
 2020.02.7, released October 12th, 2020
 
 	Important / security related fixes.
