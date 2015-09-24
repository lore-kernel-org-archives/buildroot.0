From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Sep 2015 23:51:44 +0200
Subject: [Buildroot] [git commit] imx53loco: fix dangling create-boot-sd.sh
	symlink
Message-ID: <20150924215452.DDFC3819F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61402c944261650edf1eba77ffc699afd5bd2696
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/imx53loco/create-boot-sd.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/board/freescale/imx53loco/create-boot-sd.sh b/board/freescale/imx53loco/create-boot-sd.sh
index b1ce208..d45d639 120000
--- a/board/freescale/imx53loco/create-boot-sd.sh
+++ b/board/freescale/imx53loco/create-boot-sd.sh
@@ -1 +1 @@
-../imx6sabre/create-boot-sd.sh
\ No newline at end of file
+../create-boot-sd.sh
\ No newline at end of file
