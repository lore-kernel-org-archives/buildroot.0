From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:51:40 +0200
Subject: [Buildroot] [git commit] package/openjdk: remove mips support
Message-ID: <20190417064726.5D2A381E10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa47e2bebd6e9b3402f1ec05ca6fa08be0c394c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mips-port project has been abandoned for some time:

  https://mail.openjdk.java.net/pipermail/mips-port/2018-August/000082.html

Fixes:

  http://autobuild.buildroot.net/results/1059026c9b5f503684fe1589cd43d25a8484290b/

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 1363587ed5..de0efcc86b 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_m68k
-	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_sh
 	default y if BR2_sparc || BR2_sparc64
