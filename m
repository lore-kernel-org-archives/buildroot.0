From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 16:27:27 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] Update for 2019.02.8
Message-ID: <20200112151748.A1D8A7FE3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24f25c8d23bd85d57b6e9c776f2c7716f2ddd4af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 23 +++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index f952453790..a4d732bd2a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
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
diff --git a/Makefile b/Makefile
index dfa62870c7..93d30ff145 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02.8
+export BR2_VERSION := 2019.02.9
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1575746000
+BR2_VERSION_EPOCH = 1578842000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
