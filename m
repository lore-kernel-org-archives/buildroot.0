From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Mar 2018 21:22:31 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: Add some i.MX boards to my name
Message-ID: <20180305202251.DAE7181F6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cffa8163cd5b275eb962cf435507c1a8bc512a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I would like to help maintaining the following defconfigs:

imx23evk_defconfig
imx6-sabreauto_defconfig
imx7dpico_defconfig
mx25pdk_defconfig
mx51evk_defconfig
mx53loco_defconfig

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index dbd90e5b8c..7fcfaadfb0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -603,11 +603,16 @@ F:	package/supertuxkart/
 N:	Fabio Estevam <festevam@gmail.com>
 F:	board/warp7/
 F:	configs/freescale_imx*
-F:	configs/imx6-sabresd*
+F:	configs/imx23evk_defconfig
+F:	configs/imx6-sabre*
 F:	configs/imx6slevk_defconfig
 F:	configs/imx6sx-sdb_defconfig
 F:	configs/imx6ulevk_defconfig
 F:	configs/imx6ulpico_defconfig
+F:	configs/imx7dpico_defconfig
+F:	configs/mx25pdk_defconfig
+F:	configs/mx51evk_defconfig
+F:	configs/mx53loco_defconfig
 F:	configs/mx6cubox_defconfig
 F:	configs/mx6sx_udoo_neo_defconfig
 F:	configs/mx6udoo_defconfig
