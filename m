From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 23:52:57 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] Update for 2019.02.1
Message-ID: <20190329224926.3558388120@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=863761ff3c6233e6e2ef836c4600590dc0d38197
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 26 ++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 365d2bbe4e..7b16afa5fb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,29 @@
+2019.02.1, Released March 29th, 2019
+
+	Important / security related fixes.
+
+	pkg-generic: Only tweak .la files needing it to ensure they
+	are not included in subsequent package file lists.
+
+	test-pkg: Generate a basic package config if none is
+	specified.
+
+	Updated/fixed packages: asterisk, avahi, bash, beecrypt,
+	binutils, busybox, clamav, cups, efl, eigen, fetchmail, file,
+	flashrom, fltk, gerbera, git, glibc, gnuradio, go,
+	gst-plugins-bad, intel-gmmlib, jq, kexec, kf5-modemmanager-qt,
+	leveldb, libcurl, libdrm, libftdi1, libglib2, libiio, libpcap,
+	libseccomp, libssh2, log4cplus, lvm2, mariadb, mender,
+	mongodb, mosquitto, musl, nodejs, ntp, openjpeg, owfs, php,
+	pure-ftpd, putty, python-aiojobs, qt5webkit, rdesktop, samba4,
+	sunxi-tools, supertux, swupdate, tpm2-abrmd, tpm2-tss,
+	wavemon, wireshark, vsftpd, xapp_xdm, xen,
+	xdriver_xf86-video-fbdev, xlib_libXdmcp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11716: Typo on website, saying latest release is 2018.2.11
+
 2019.02, released March 4th, 2019
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index 5098acee0e..5438c3e733 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02
+export BR2_VERSION := 2019.02.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1551735000
+BR2_VERSION_EPOCH = 1553900000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
