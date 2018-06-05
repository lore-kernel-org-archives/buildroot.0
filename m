From: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Date: Tue,  5 Jun 2018 10:02:50 -0400
Subject: [Buildroot] [PATCH] Defconfig arcturus_ucls1012a_defconfig: bump
 UBOOT_CUSTOM_REPO_VERSION
Message-ID: <20180605140250.5943-1-oleks@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new u-boot custom repo version should fix the arcturus_ucls1012a_defconfig
fails to build on master. See the build log at:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/71726827

Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>
---
 configs/arcturus_ucls1012a_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
index 9d1da8c2cc..7fb980479a 100644
--- a/configs/arcturus_ucls1012a_defconfig
+++ b/configs/arcturus_ucls1012a_defconfig
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ArcturusNetworks/uCLS1012A-uboot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v0.2.1811"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v0.2.1823"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_QSPI128"
 
 # Tools
-- 
2.11.0
