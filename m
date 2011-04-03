From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 3 Apr 2011 20:12:28 +0200
Subject: [Buildroot] [git commit /heads/master] qemu_x86_defconfig: run
	getty on ttyS0
Message-ID: <20110403185531.43D6281E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c10b2291e8a65d45bef8988147ed45effa5b3fda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_x86_defconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 2e7d813..04314c2 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -2,6 +2,9 @@
 BR2_i386=y
 BR2_x86_pentiumpro=y
 
+# system
+BR2_TARGET_GENERIC_GETTY=y
+
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
1.7.3.4
