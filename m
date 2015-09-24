From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu, 24 Sep 2015 17:36:37 +0200
Subject: [Buildroot] [PATCH] imx53loco: fix dangling create-boot-sd.sh
	symlink
Message-ID: <1443108997-119170-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 board/freescale/imx53loco/create-boot-sd.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/imx53loco/create-boot-sd.sh b/board/freescale/imx53loco/create-boot-sd.sh
index b1ce208..d45d639 120000
--- a/board/freescale/imx53loco/create-boot-sd.sh
+++ b/board/freescale/imx53loco/create-boot-sd.sh
@@ -1 +1 @@
-../imx6sabre/create-boot-sd.sh
\ No newline at end of file
+../create-boot-sd.sh
\ No newline at end of file
-- 
2.1.4
