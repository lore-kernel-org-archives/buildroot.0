From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Dec 2013 21:29:03 +0100
Subject: [Buildroot] [PATCH 1/4] configs: bump kernel for
	raspberrypi_defconfig
In-Reply-To: <cover.1388003226.git.yann.morin.1998@free.fr>
References: <cover.1388003226.git.yann.morin.1998@free.fr>
Message-ID: <4fdd04014796bf6b5f3f7254af7945956d9f8617.1388003226.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump to the latest /stable/ linux 3.10.y for the Raspberry Pi defconfig.

Brings in quite a few bug-fixes (now based on 3.10.25), and a few
(minor) improvements (add DAC support).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/raspberrypi_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.1.2
