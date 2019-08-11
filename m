From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:30 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: make Peter Seiderer the contact for
 all RPi defconfigs
Message-ID: <20190811120739.26539-9-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter is already listed in the DEVELOPERS file for board/raspberrypi/
and configs/raspberrypi3_defconfig, and in practice contributes
regularly to all RPi defconfigs. It makes sense to have him listed in
the DEVELOPERS file for all RPi defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
Peter, could you reply with an Acked-by, if you're fine with this?
Thanks!
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 51daa91d02..8c05366630 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1833,7 +1833,7 @@ F:	package/triggerhappy/
 
 N:	Peter Seiderer <ps.report@gmx.net>
 F:	board/raspberrypi/
-F:	configs/raspberrypi3_defconfig
+F:	configs/raspberrypi*_defconfig
 F:	package/assimp/
 F:	package/bcm2835/
 F:	package/ddrescue/
-- 
2.21.0
