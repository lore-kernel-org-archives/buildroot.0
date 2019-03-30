From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Mar 2019 09:14:19 +0100
Subject: [Buildroot] [git commit] Update for 2019.02.1
Message-ID: <20190330081506.6B37C884E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18a10db0d5bb2b309c2661f3b81b31d0550505e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop Makefile changes]
(cherry picked from commit 863761ff3c6233e6e2ef836c4600590dc0d38197)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/CHANGES b/CHANGES
index e1fb36c215..ae6a3bb95c 100644
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
