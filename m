From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:26 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Luca Ceresoli for more Zynq
 board
Message-ID: <20190811120739.26539-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca Ceresoli has de-facto been updating/maintaining the
zynq_microzed_defconfig and zynq_zc706_defconfig for the past few
years, so let's add him in the DEVELOPERS for those two defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
Luca, could you reply with an Acked-by if you're fine with this?
Thanks!
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 79fea3485d..61cc8155c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1372,7 +1372,9 @@ F:	board/olimex/a20_olinuxino/
 F:	board/zynq/
 F:	board/zynqmp/
 F:	configs/olimex_a20_olinuxino_*
+F:	configs/zynq_microzed_defconfig
 F:	configs/zynq_zed_defconfig
+F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/agentpp/
 F:	package/exim/
-- 
2.21.0
