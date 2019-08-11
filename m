From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:23 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Julien Grossholtz as contact
 for ts7680_defconfig
Message-ID: <20190811120739.26539-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien originally added this defconfig in 2017, so let's add him as a
contact for it, so that he receives build failure notifications and is
Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Grossholtz <julien.grossholtz@gmail.com>
---
Julien, could you please reply with your Acked-by if you are fine with
this? Thanks!
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8995065c5f..8a2128e1ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1289,6 +1289,8 @@ N:	Julien Floret <julien.floret@6wind.com>
 F:	package/lldpd/
 
 N:	Julien Grossholtz <julien.grossholtz@openest.io>
+F:	board/technologic/ts7680/
+F:	configs/ts7680_defconfig
 F:	package/paho-mqtt-c
 
 N:	Julien Olivain <juju@cotds.org>
-- 
2.21.0
