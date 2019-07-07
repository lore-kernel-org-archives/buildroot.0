From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 22:33:03 +0200
Subject: [Buildroot] [git commit] Update for 2019.05.1
Message-ID: <20190707203746.C4DFA81513@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0225c2776cb476e134bf1ffb6fd5ff511a62f6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop Makefile changes]
(cherry picked from commit 5b4e32cae812225fa909d755d7e09588ce0b92da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/CHANGES b/CHANGES
index 0ab5749aca..3854b7455e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,28 @@
+2019.05.1, Released July 7th, 2019
+
+	Important / security related fixes.
+
+	arch: x86: Fix typo breaking 'core-avx2' variant
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
+	Defconfigs: QEMU: use 'rootwait' kernel option to ensure root
+	partition is available before mounting.
+
+	Updated/fixed packages: barebox, busybox, bzip2, davfs2,
+	dialog, docker-cli, docker-engine, exim, expat, faad2,
+	haveged, irssi, libcamera, libcdaudio, libcurl, libglib2,
+	libressl, libsecret, lmbench, meson, monit, php, postgresql,
+	psplash, python-django, qt5base, tvheadend, webkitgtk,
+	xserver_xorg-server, znc
+
 2019.05, released June 2nd, 2019
 
 	Various fixes.
