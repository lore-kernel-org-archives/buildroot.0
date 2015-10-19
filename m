From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 22:33:36 +0200
Subject: [Buildroot] [git commit] nitrogen6*_defconfig: switch to zImage
Message-ID: <20151019203344.7B1CA7FCBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4ca7850adf89ad7412cd07fe640dcec3ee68b25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As now using zImage/bootz in the 6x_bootscript.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/nitrogen6sx_defconfig |    2 +-
 configs/nitrogen6x_defconfig  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 70006d5..3cdf41b 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -31,7 +31,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Last version of branch boundary-imx_3.14.28_1.0.0_ga
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/3417c66/linux-imx6-3417c66.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-nitrogen6sx"
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 51c5161..cffbc25 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -31,7 +31,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Last version of branch boundary-imx_3.14.28_1.0.0_ga
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/3417c66/linux-imx6-3417c66.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6q-nitrogen6_max imx6q-sabrelite"
