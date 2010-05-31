From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:07:50 +0200
Subject: [Buildroot] [PATCH 04/46] u-boot: do not default to $(BOARD_NAME)
	for the board name
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <28aa25bb6254f9ceb61f3315e9fd7a18cf4de0ab.1275343447.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index ca47e18..b07e67c 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -6,7 +6,6 @@ menuconfig BR2_TARGET_UBOOT
 if BR2_TARGET_UBOOT
 config BR2_TARGET_UBOOT_BOARDNAME
 	string "board name"
-	default "$(BOARD_NAME)"
 	help
 	  One of U-Boot supported boards to be built.
 	  This will be suffixed with _config to meet U-Boot standard naming.
-- 
1.7.0.4
