From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 May 2020 22:59:21 +0200
Subject: [Buildroot] [git commit] configs/beelink_gs1: use Python 3.x
Message-ID: <20200515204314.420E8918D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba593585ade30de4ab16557ecd19b740c1722ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to U-Boot 2020.01 in commit
e210080d2ab4d77862c42d2b318e21fab461f127, it needs Python 3.x on the
host.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054357

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Cl??ment P??ron <peron.clem@gmail.com>
[yann.morin.1998 at free.fr: update with the new NEEDS_PYTHON semantics]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/beelink_gs1_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index 04c8b544ea..b461574a98 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beelink_gs1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
