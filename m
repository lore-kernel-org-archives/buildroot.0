From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Apr 2018 18:37:41 +0200
Subject: [Buildroot] [git commit] Update for 2017.02.11
Message-ID: <20180412164240.2FA8B884A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f00d03a68117a16faacac0b2227a2a83985e37b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8a0e4e865add1079e7cf8336def4f7aab00b2e0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/CHANGES b/CHANGES
index 09cf7c3f85..29a4937a9d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -907,6 +907,26 @@
 	#9846: musl libc not installed correctly in target folder
 	#9856: build libubox failed on ubuntu 17.04 64bit
 
+2017.02.11, Released April 11th, 2018
+
+	Important / security related fixes.
+
+	dependencies: Blacklist tar 1.30+ and build our own host-tar
+	if needed as tar 1.30+ changed the --numeric-owner output for
+	long path names. Build host-tar before other host-dependencies
+	as they need it to extract their source tarballs.
+
+	Updated/fixed packages: apache, busybox, clamav, dhcp,
+	dnsmasq, dovecot, exim, imagemagick, irssi, jq, libcurl,
+	libpjsip, librsvg, libtasn1, libvorbis, libxml2, lz4, mariadb,
+	mbedtls, mosquitto, ntp, openblas, opencv3, openssl, patch,
+	postgresql, python-webpy, qt53d, qt5tools, quagga, rsync,
+	samba4, sngrep, tremor, wavpack, wireshark, xerces, xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10856: openblas on qemu_x86_64_defconfig fails with "sgemm_..
+
 2017.02.10, Released January 31st, 2018
 
 	Important / security related fixes.
