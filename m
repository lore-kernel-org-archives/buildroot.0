From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Apr 2020 08:39:08 +0200
Subject: [Buildroot] [git commit] Update for 2019.11.3
Message-ID: <20200411063447.5EF2F8E2F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed4f7ddf49c0d328da8c08bbc4e8ad689a198a0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7d3fc9d795f757f3191750491555495626e3bfdb)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5285806551..d7c1e7df20 100644
--- a/CHANGES
+++ b/CHANGES
@@ -154,6 +154,31 @@
 	#12536: Linux-Headers extracting failure
 	#12546: Ninja 1.10 build Error
 
+2019.11.3, released April 10th, 2020
+
+	Important / security related fixes.
+
+	core: Fix compatibility with make 4.3+. Also fixup /lib
+	references in libtool .la files, similar to how it is done for
+	/usr/*.
+
+	toolchain: Fix kernel headers validation check for external
+	toolchains.
+
+	fs/initramfs: fix show-info so it also shows the usual
+	rootfs-related variables.
+
+	Updated/fixed packages: barebox-aux, bluez5_utils, busybox,
+	civetweb, cog, collectd, ffmpeg, gcc, gnutls, gssdp, gvfs, haproxy,
+	hiredis, hostapd, kmscube, libical, libopenssl, libsndfile,
+	linux-tools, llvm, monit, ntp, php, pure-ftpd, radvd, redis,
+	samba4, screen, sysdig, syslinux, syslog-ng, tor, uacme,
+	util-linux, vala, vlc, wpa_supplicant, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12746: "sysdig" package description points to http://sysdig.org, ..
+
 2019.11.2, released March 16th, 2020
 
 	Important / security related fixes.
