From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jun 2017 15:15:07 +0200
Subject: [Buildroot] [git commit] Update for 2017.02.3
Message-ID: <20170602131925.EA79D827F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ba865a5001757c7c0e63f460c159441e3faceb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cae46d7b8d010392a91a5b5a87b57b72542df154)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/CHANGES b/CHANGES
index 1b764a2..cf4b22b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -204,6 +204,30 @@
 	#9846: musl libc not installed correctly in target folder
 	#9856: build libubox failed on ubuntu 17.04 64bit
 
+2017.02.3, Released June 2nd, 2017
+
+	Important / security related fixes.
+
+	Download: <pkg>-source-check fixed for packages from git.
+
+	External toolchain: musl dynamic linker symlink for mips-sf
+	corrected.
+
+	Updated/fixed packages: armadillo, audiofile, bash,
+	bluez_utils, cppcms, dbus, dhcp, dropbear, efibootmgr, efl,
+	elfutils, faketime, fbgrab, flashrom, ftop, gdb, git,
+	google-breakpad, gpsd, hans, kvm-unit-tests, kyua, libev,
+	libmicrohttpd, libminiupnpc, libtasn1, libubox, ltp-testsuite,
+	lua, madplay, mariadb, mono, mosquitto, mxml, ntp,
+	nvidia-driver, openblas, openvpn, oracle-mysql, picocom, popt,
+	postgresql, pulseview, qt5base, qwt, rabbitmq-c, redis,
+	rpcbind, rtmpdump, samba4, strongswan, sudo, vlc
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9796: source-check broken for Git downloads
+	#9871: fbgrab 1.3 won't build with BR2_REPRODUCIBLE set
+
 2017.02.2, Released May 1st, 2017
 
 	Important / security related fixes.
