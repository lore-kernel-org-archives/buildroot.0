From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:27 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Sergio Prado as contact for
 toradex_apalis_imx6_defconfig
Message-ID: <20190811120739.26539-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio added this defconfig a while ago, and is still active
contributing to Buildroot, so let's add him as the contact for this
defconfig, so that he receives build failure notifications and gets
Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Scott Fan <fancp2007@gmail.com>
---
Sergio, could you reply with an Acked-by, if you're fine with this?
Thanks!
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 61cc8155c0..62eeb1fa99 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2080,6 +2080,8 @@ F:	package/rtl8189fs/
 F:	package/xr819-xradio/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
+F:	board/toradex/apalis-imx6/
+F:	configs/toradex_apalis_imx6_defconfig
 F:	package/aoetools/
 F:	package/curlpp/
 F:	package/daq/
-- 
2.21.0
