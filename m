From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Sep 2017 07:28:08 -0300
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: Update imx6-sabresd config entry
In-Reply-To: <1506508088-14552-1-git-send-email-festevam@gmail.com>
References: <1506508088-14552-1-git-send-email-festevam@gmail.com>
Message-ID: <1506508088-14552-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the conversion to SPL the imx6sabresd defconfig targets have
been renamed,so update the entry accordingly.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
-- 
2.7.4
