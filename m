From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Tue, 13 Jun 2017 13:18:21 +0530
Subject: [Buildroot] [PATCH 2/5] board: engicam: Rename defconfig
	engicam_imx6qdl_icore_mmc_defconfig
In-Reply-To: <1497340104-25108-1-git-send-email-jteki@openedev.com>
References: <1497340104-25108-1-git-send-email-jteki@openedev.com>
Message-ID: <1497340104-25108-3-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Since the board have support for nand, better to explicitly
name it with mmc.

engicam_imx6qdl_icore_defconfig => engicam_imx6qdl_icore_mmc_defconfig

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 DEVELOPERS                                                              | 2 +-
 board/engicam/readme.txt                                                | 2 +-
 ...icam_imx6qdl_icore_defconfig => engicam_imx6qdl_icore_mmc_defconfig} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename configs/{engicam_imx6qdl_icore_defconfig => engicam_imx6qdl_icore_mmc_defconfig} (100%)

diff --git a/DEVELOPERS b/DEVELOPERS
index cb498ee..1a8720b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -829,7 +829,7 @@ F:	package/keepalived/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/engicam/
-F:	configs/engicam_imx6qdl_icore_defconfig
+F:	configs/engicam_imx6qdl_icore_mmc_defconfig
 
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
diff --git a/board/engicam/readme.txt b/board/engicam/readme.txt
index d02c3af..0ef108d 100644
--- a/board/engicam/readme.txt
+++ b/board/engicam/readme.txt
@@ -17,7 +17,7 @@ First, configure Buildroot for the Engicam i.MX SOM's:
 
 - for i.CoreM6 Quad/Dual:
 
-  make engicam_imx6qdl_icore_defconfig
+  make engicam_imx6qdl_icore_mmc_defconfig
 
 Build all components:
 
diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_mmc_defconfig
similarity index 100%
rename from configs/engicam_imx6qdl_icore_defconfig
rename to configs/engicam_imx6qdl_icore_mmc_defconfig
-- 
2.7.4
