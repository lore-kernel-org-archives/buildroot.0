From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 May 2019 11:57:25 +0200
Subject: [Buildroot] [git commit] configs/pine64_sopine: kernel needs
 host-openssl to build
Message-ID: <20190512095220.3D19D813C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90234890ccf616eb6fec416a9573d14cb95b12e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/210208624

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/pine64_sopine_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pine64_sopine_defconfig b/configs/pine64_sopine_defconfig
index 0e4ccbcb48..3007d5a643 100644
--- a/configs/pine64_sopine_defconfig
+++ b/configs/pine64_sopine_defconfig
@@ -36,6 +36,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-sopine-baseboard"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64 SOPINE"
