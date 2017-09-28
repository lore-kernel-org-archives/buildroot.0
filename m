From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Sep 2017 22:06:40 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: Update imx6-sabresd config
	entry
Message-ID: <20170928200648.D6D7881143@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8e2f1e5e51e015c3f3bc7ce16f139e1a4c3b4cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the conversion to SPL the imx6sabresd defconfig targets have
been renamed,so update the entry accordingly.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 72aa338..cedf5a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -553,7 +553,7 @@ F:	package/supertuxkart/
 N:	Fabio Estevam <festevam@gmail.com>
 F:	board/warp7/
 F:	configs/freescale_imx*
-F:	configs/imx6q-sabresd*
+F:	configs/imx6-sabresd*
 F:	configs/imx6ulpico_defconfig
 F:	configs/mx6cubox_defconfig
 F:	configs/mx6sx_udoo_neo_defconfig
