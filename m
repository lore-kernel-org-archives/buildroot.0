From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:10:28 +0200
Subject: [Buildroot] [git commit] nitrogen6x: bump kernel version to 3.10.17
Message-ID: <20140715211145.194119CE7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8bbfe759e4606c60854651db97a52fd8659cdb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/boundarydevices/nitrogen6x/6x_bootscript |  Bin 1653 -> 3207 bytes
 configs/nitrogen6x_defconfig                   |    5 ++++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/6x_bootscript b/board/boundarydevices/nitrogen6x/6x_bootscript
index dc9eea4..05442a6 100644
Binary files a/board/boundarydevices/nitrogen6x/6x_bootscript and b/board/boundarydevices/nitrogen6x/6x_bootscript differ
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 0c026db..da2a7e8 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -21,6 +21,9 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/5809938/linux-imx6-5809938.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/efd65e6/linux-imx6-efd65e6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-nitrogen6x"
