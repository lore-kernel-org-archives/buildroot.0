From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Nov 2017 21:55:43 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20171106204940.70FAD81012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64bbd34893bdc3f57ce65720e1bf6e6b02551d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Openssl is now a virtual package and new defconfigs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/CHANGES b/CHANGES
index 603ab93..d8153de 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,9 @@
 
 	Fixes all over the tree and new features.
 
+	Openssl is now a virtual package, which may be provided by
+	OpenSSL (now renamed to libopenssl) or LibreSSL.
+
 	libssh2: there is now an explicit choice of the backend to use
 	(mbedtls, gnutls or openssl). Previously, the choice was implicit
 	based on the TLS library that was selected. Now, it is possible to
@@ -12,6 +15,12 @@
 	bit bigger than before. To remove unneeded MIBS, you should use a
 	post-build script.
 
+	New defconfigs: Atmel SAM45D27, Bananapi M1 and M2 Plus,
+	Engicam i.CoreM6 Qt5 configuration, i.MX6 sabreauto (mainline
+	kernel/u-boot), i.MX6Q sabresd Qt5 configuration, i.MX7d-pico,
+	QEMU ppc64le, Raspberry pi3 Qt5 webengine configuration,
+	Technologic TS-7680.
+
 	New packages: asterisk, azmq, bcg729, boinc, dahdi-linux,
 	dahdi-tools, freeswitch-mod-bcg729, fscryptctl, libb64,
 	libpri, libss7, lua-basexx, lua-compat53, lua-cqueues,
