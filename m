From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 23:09:09 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: make Peter Seiderer the
 contact for all RPi defconfigs
Message-ID: <20190812211734.AABBB8E8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adcb1bc56e7d5c99454a7098ee4d1d3d6dddacb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Peter is already listed in the DEVELOPERS file for board/raspberrypi/
and configs/raspberrypi3_defconfig, and in practice contributes
regularly to all RPi defconfigs. It makes sense to have him listed in
the DEVELOPERS file for all RPi defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Acked-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7e8e742247..93c4f22d8c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1830,7 +1830,7 @@ F:	package/triggerhappy/
 
 N:	Peter Seiderer <ps.report@gmx.net>
 F:	board/raspberrypi/
-F:	configs/raspberrypi3_defconfig
+F:	configs/raspberrypi*_defconfig
 F:	package/assimp/
 F:	package/bcm2835/
 F:	package/ddrescue/
