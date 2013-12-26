From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 10:52:21 +0100
Subject: [Buildroot] [git commit] configs: bump kernel for
	raspberrypi_defconfig
Message-ID: <20131226095410.B97119C1E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17283ce8268ae6d71e4c78138dac8871eb26c755
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest /stable/ linux 3.10.y for the Raspberry Pi defconfig.

Brings in quite a few bug-fixes (now based on 3.10.25), and a few
(minor) improvements (add DAC support).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi_defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 4df0f4b..6a17165 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -12,12 +12,12 @@ BR2_PACKAGE_LIBCOFI=y
 
 # Lock to 3.10 headers as the RPi kernel is based off the 3.10 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.22"
+BR2_DEFAULT_KERNEL_VERSION="3.10.25"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5ebf1db80e2c03e92d570605b53f91a06112574f"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="75d03120bc36b1cc3166973b8edc11f033ab7c0d"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
