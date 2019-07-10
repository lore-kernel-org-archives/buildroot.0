From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Jul 2019 11:29:30 +0200
Subject: [Buildroot] [git commit] Update for 2019.02.4
Message-ID: <20190710093059.3E8C2814C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86c31e8b5a04c773cd49379fd674d20317400a04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop Makefile changes]
(cherry picked from commit 26bae8483231b23159c6b6c39e204c0eca76f0d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3854b7455e..586195cc20 100644
--- a/CHANGES
+++ b/CHANGES
@@ -139,6 +139,37 @@
 	#11761: Building custom kernel 5.1-rc3 or later breaks on objtool
 	#11816: Only selected coreutils binaries are installed
 
+2019.02.4, Released July 10th, 2019
+
+	Important / security related fixes.
+
+	arch: x86: Fix typo breaking 'core-avx2' variant, add Westmere
+	variant.
+
+	linux: Workaround -Werror related build failure on powerpc,
+	by forcing CONFIG_PPC_DISABLE_WERROR on.
+
+	support/testing: Emulate a machine with 256MB RAM to fix
+	issues with certain tests running out of memory.
+
+	test-pkg: Correct long option handling and clean output dir
+	after a successful build to save disk space.
+
+	Ensure custom <pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS are
+	passed before the standard exclusions so they are not ignored
+	by rsync when using override-srcdir.
+
+	Defconfigs: QEMU: use 'rootwait' kernel option to ensure root
+	partition is available before mounting.
+
+	Updated/fixed packages: barebox, bzip2, davfs2, dbus, dialog,
+	docker-cli, docker-engine, expat, faad2, ffmpeg, freeswitch,
+	gerbera, haveged, irssi, libcdadio, libgit2, libglib2,
+	libsecret, libvncserver, lmbench, logrotate, mariadb, meson,
+	mongoose, monit, mpd, openblas, php, postgresql, psplash,
+	python, python-django, python3, qt5base, samba4, taglib,
+	tvheadend, vlc, webkitgtk, xserver_xorg-server, znc
+
 2019.02.3, Released June 7th, 2019
 
 	Important / security related fixes.
