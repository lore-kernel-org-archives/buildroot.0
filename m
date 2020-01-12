From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 21:39:09 +0100
Subject: [Buildroot] [git commit] Update for 2019.02.9
Message-ID: <20200112202911.58CDC8B747@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4e7390fae8d1842728e26af1b5e6fa1326d3596
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 24f25c8d23bd85d57b6e9c776f2c7716f2ddd4af)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/CHANGES b/CHANGES
index b4d6faa38a..5150272a55 100644
--- a/CHANGES
+++ b/CHANGES
@@ -695,6 +695,29 @@
 	#11761: Building custom kernel 5.1-rc3 or later breaks on objtool
 	#11816: Only selected coreutils binaries are installed
 
+2019.02.9, released January 12th, 2020
+
+	Important / security related fixes.
+
+	pkg-python infrastructure: Ensure correct compiler and linker
+	flags are used for compiled code
+
+	utils/scanpypi: Remind users to update DEVELOPERS
+
+	Updated/fixed packages: busybox, cc-tool, cpio, cups, dante,
+	dillo, docker-cli, docker-containerd, docker-engine, easy-rsa,
+	ecryptfs-utils, efl, git, glibc, gnupg2, gst1-plugins-bad,
+	kf5-kcoreaddons, libarchive, libgit2, libkrb5, librsvg,
+	libssh, libtomcrypt, libuio, lirc-tools, lvm2,
+	matchbox-desktop, nodejs, ntp, opencv3, openpowerlink,
+	python-django, python-ecdsa, python-pyasn-modules,
+	python-pyqt5, python-subprocess32, python3, qpdf, runc, rygel,
+	samba4, sdl2, wavpack, xserver_xorg-server, zip
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12121: PyQt5.QtSerialPort and other modules not being built
+
 2019.02.8, released December 7th, 2019
 
 	Important / security related fixes.
