From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 23:07:09 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add Luca Ceresoli for more
 Zynq board
Message-ID: <20190812211734.8C5738E8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc75f57504bd2cae9445bed07b0e2de548c9514c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Luca Ceresoli has de-facto been updating/maintaining the
zynq_microzed_defconfig and zynq_zc706_defconfig for the past few
years, so let's add him in the DEVELOPERS for those two defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5b6005dc89..9c86547aca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1377,7 +1377,9 @@ F:	board/olimex/a20_olinuxino/
 F:	board/zynq/
 F:	board/zynqmp/
 F:	configs/olimex_a20_olinuxino_*
+F:	configs/zynq_microzed_defconfig
 F:	configs/zynq_zed_defconfig
+F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/agentpp/
 F:	package/exim/
