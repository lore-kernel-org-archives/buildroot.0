From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 19:03:47 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] DEVELOPERS: Add some i.MX
 boards to my name
Message-ID: <20180330193202.0AD9F83EC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1230b03632f09bcda6c1d3d07a2633a38566dd91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

I would like to help maintaining the following defconfigs:

imx23evk_defconfig
imx6-sabreauto_defconfig
imx7dpico_defconfig
mx25pdk_defconfig
mx51evk_defconfig
mx53loco_defconfig

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8cffa8163cd5b275eb962cf435507c1a8bc512a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 41e1b54d99..de78c51d08 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -600,11 +600,16 @@ F:	package/supertuxkart/
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
