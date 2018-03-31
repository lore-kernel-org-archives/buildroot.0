From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:56:46 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add myself for a number of
 unmaintained boards
Message-ID: <20180331185756.96A3484B62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf6b55268fdd78a441f99b9b0ca45b81939f8334
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These boards I own and currently have no entries in DEVELOPERS, so add them.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ac7a47fc7a..ee66cdd6c1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1399,8 +1399,20 @@ N:	Pedro Aguilar <paguilar@paguilar.org>
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
