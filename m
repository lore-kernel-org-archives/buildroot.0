From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 21:23:15 +0200
Subject: [Buildroot] [git commit] Update for 2017.02.7
Message-ID: <20171028191911.D32358109C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b0dd65de86080008a96a1d655026297d532cbf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 05a2e38af23ecdb04f54da97f5ce2b1f7f41b842)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/CHANGES b/CHANGES
index 23e5fa0..5782fd6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -533,6 +533,24 @@
 	#9846: musl libc not installed correctly in target folder
 	#9856: build libubox failed on ubuntu 17.04 64bit
 
+2017.02.7, Released October 28th, 2017
+
+	Important / security related fixes.
+
+	Webkitgtk bumped to the 2.18.x series, fixing a large number
+	of security issues.
+
+	Defconfigs: wandboard: Correct rootfs offset
+
+	Toolchain: Linaro toolchains updated to 2017.08 release,
+	fixing a number of issues. Musl: fix for CVE-2017-15650.
+
+	Updated/fixed packages: busybox, bzip2, dnsmasq, git, go,
+	hostapd, irssi, iucode-tool, lame, libcurl, libffi, libnspr,
+	libnss, nodejs, openssh, openvpn, qemu, qt, redis, sdl2,
+	webkitgtk, wget, wpa_supplicant, xen, xlib_libXfont,
+	xlib_libXfont2, xserver_xorg-server
+
 2017.02.6, Released September 24th, 2017
 
 	Important / security related fixes.
