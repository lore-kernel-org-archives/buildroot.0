From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 20:10:05 +0200
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_neo2: kernel
 needs host-openssl to build
Message-ID: <20190513182350.5CFE0887ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28577a3ee2b60338c20e284e5209eeb3032fd726
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/210208559

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/friendlyarm_nanopi_neo2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
index 7287ebf969..e932ae3bb1 100644
--- a/configs/friendlyarm_nanopi_neo2_defconfig
+++ b/configs/friendlyarm_nanopi_neo2_defconfig
@@ -36,6 +36,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo2"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_GENERIC_ISSUE="Welcome to FriendlyARM Nanopi NEO2"
