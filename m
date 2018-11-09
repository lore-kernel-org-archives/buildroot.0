From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Nov 2018 22:48:50 +0100
Subject: [Buildroot] [git commit] CHANGES: add additional resolved issues
 since 2018.08
Message-ID: <20181109214657.12AC68229B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8a216920fb295a2fd8429814b5edccd2d1da7bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/CHANGES b/CHANGES
index 053519856a..992e2c5d51 100644
--- a/CHANGES
+++ b/CHANGES
@@ -79,9 +79,24 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#11116: Buildroot should set PYTHON_EGG_CACHE instead of writing ..
+	#11156: In python3 module 'socket' has no attribute 'AF_BLUETOOTH'
+	#11166: Erlang bad argument on valid uint64 when crosscompiled on..
+	#11206: zlib: fails to build with Linaro toolchain, BR2_RELRO_FULL..
 	#11241: ACPID shouldn't depend on BR2_x86_64 || BR2_i386
+	#11251: Util scanpypi failes when package change - to _ in tar file
+	#11266: qt5base-5.11.1 does not compile with musl, complains about..
+	#11286: python-rpi-gpio only should depend on BR2_arm || BR2_aarch64
+	#11321: Latest master fails to build readline with RELRO FULL
+	#11326: sysvinit fails to build in latest GIT master
+	#11331: Internal application no longer builds with latest GIT master
+	#11336: nfs-utils fails to build in latest GIT master
+	#11351: build root-2018-08, linaro aarch64 compile error
 	#11376: mdmon binary missing
+	#11391: Valgind availability on ARM
 	#11396: uboot environment image checksum invalid if target is big endian
+	#11421: GCC error message for ARM Cortex-A9/ARM.V7
+	#11451: Can't find libmpfr.so.4 when using external toolchain on ubuntu..
 	#11481: Docs: Is external.desc required?
 
 2018.08.2, Released October 25th, 2018
