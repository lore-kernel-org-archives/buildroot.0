From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 09:22:51 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add myself for a number of
 unmaintained boards
Message-ID: <20180331072251.32255-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These boards I own and currently have no entries in DEVELOPERS, so add them.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ef6589e37d..74477e9b9b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1396,8 +1396,20 @@ N:	Pedro Aguilar <paguilar@paguilar.org>
 F:	package/libunistring/
 
 N:	Peter Korsgaard <peter@korsgaard.com>
+F:	board/minnowboard/
+F:	board/nexbox/a95x/
+F:	board/openblocks/a6/
 F:	board/orangepi/
+F:	board/pandaboard/
+F:	board/roseapplepi/
+F:	configs/minnowboard_max-graphical_defconfig
+F:	configs/minnowboard_max_defconfig
+F:	configs/nexbox_a95x_defconfig
+F:	configs/openblocks_a6_defconfig
 F:	configs/orangepi_pc_defconfig
+F:	configs/pandaboard_defconfig
+F:	configs/roseapplepi_defconfig
+F:	configs/sheevaplug_defconfig
 F:	package/docker-compose/
 F:	package/dump1090/
 F:	package/flickcurl/
-- 
2.11.0
