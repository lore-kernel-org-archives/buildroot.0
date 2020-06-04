From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jun 2020 11:10:45 +0200
Subject: [Buildroot] [git commit] Update for 2020.02.3
Message-ID: <20200604091346.6FF6C837A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7f14106c7457412e52fac0b57eb1ac33ffa74e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d42f3adaae24a6aa3abc2de4f39fa8023f971d31)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3cda0af8df..e4557ea3d8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -166,6 +166,33 @@
 	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
 	#12811: bootstrap stuck and no login prompt
 
+2020.02.3, released June 3rd, 2020
+
+	Important / security related fixes.
+
+	Fix various build issues of host packages on hosts using GCC
+	10.
+
+	Updated/fixed packages: arm-trusted-firmware, audit, bind,
+	binutils, bison, clamav, crda, dovecot, dtc, efl, elf2flt,
+	erlang, fakeroot, ffmpeg, fmc, fmlib, freerdp, gcc, git,
+	glib-networking, gnupg, leveldb, libexif, libssh2,
+	libusb-compat, linux-headers, lrzip, ltrace, mariadb, mesa3d,
+	mp4v2, openldap, openocd, perl, php, prosody,
+	python-pycryptodomex, python-pyqt5, qemu, rpi-firmware, rustc,
+	speexdsp, sysrepo, systemd, tremor, vboot-utils, wireshark,
+	xen
+
+	Removed packages: python-pycrypto
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12361: Init system (systemd) kills login on Raspberry Pi Zero
+	#12656: bison fails to relocate with relocate-sdk.sh
+	#12671: leveldb won't detect that snappy is present (static..
+	#12691: host-rust build fails
+	#12831: RPI-firmware package: DTB-overlay dependency
+
 2020.02.2, released May 12th, 2020
 
 	Important / security related fixes.
