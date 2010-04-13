From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:16 +0200
Subject: [Buildroot] [PATCH 04/35] u-boot: do not default to $(BOARD_NAME)
	for the board name
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cb17d76126f7178af32e36f8bab77ab34836c01e.1271170913.git.thomas.petazzoni@free-electrons.com>
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
index f84d181..70d9eb8 100644
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
1.6.3.3
