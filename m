From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 19:57:35 +0200
Subject: [Buildroot] [git commit branch/next] configs/nitrogen6sx: Linux
 needs host-openssl
Message-ID: <20200812144328.CBB1E85F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6429b236d1327503a683c9fc7b77c6b985083fcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The kernel configuration used for the nitrogen6x defconfig needs
host-openssl.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934095

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen6sx_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index f151d4dc08..d5bf87b086 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -40,3 +40,4 @@ BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-nitrogen6sx imx6sx-nitrogen6sx-m4"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
