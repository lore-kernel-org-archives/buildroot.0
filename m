From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 13:36:45 +0200
Subject: [Buildroot] [git commit] configs/olpc_xo175: needs host-openssl for
 kernel build
Message-ID: <20200424112221.805698FEB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cb550067baa0997a55d59781db3c42f51d76c77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/517918177

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/olpc_xo175_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olpc_xo175_defconfig b/configs/olpc_xo175_defconfig
index 4317e72a78..6e31ecf92c 100644
--- a/configs/olpc_xo175_defconfig
+++ b/configs/olpc_xo175_defconfig
@@ -11,6 +11,7 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1.75/linux.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olpc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8=y
 BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9=y
