From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2014 22:05:59 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi: remove packages not
	strictly required
Message-ID: <20140210210706.1507A9C488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66245d03cc7d539c30eacdd1b2eef2ae5314b68a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rpi-userland and libcoffi are not strictly required to boot up the
Raspberry Pi, so remove them from the defconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi_defconfig |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index b334b0a..2d1cc34 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -7,8 +7,6 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
-BR2_PACKAGE_RPI_USERLAND=y
-BR2_PACKAGE_LIBCOFI=y
 
 # Lock to 3.10 headers as the RPi kernel is based off the 3.10 branch
 BR2_KERNEL_HEADERS_VERSION=y
