From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 20:55:26 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Update for 2017.02.7
Message-ID: <20171028190913.D424B80F7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05a2e38af23ecdb04f54da97f5ce2b1f7f41b842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 18 ++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 56f1c32..093f8f0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
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
diff --git a/Makefile b/Makefile
index 7a369b3..ae36c66 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02.6
+export BR2_VERSION := 2017.02.7
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1506285000
+BR2_VERSION_EPOCH = 1509216000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
