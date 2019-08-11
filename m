From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:24 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Patrick Keroulas as contact for
 ts4800_defconfig
Message-ID: <20190811120739.26539-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick Keroulas added this defconfig back in 2016. Let's add him as a
contact for this defconfig, so that he gets notified on build failures
and Cc'ed on patches/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
---
Patrick, could you reply with a Acked-by if you're fine with being a
contact for this defconfig? Thanks!
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a2128e1ef..6042ec7068 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1759,6 +1759,10 @@ F:	package/google-breakpad/
 N:	Patrick Gerber <kpa_info@yahoo.fr>
 F:	package/yavta/
 
+N:	Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
+F:	board/technologic/ts4800/
+F:	configs/ts4800_defconfig
+
 N:	Paul Cercueil <paul@crapouillou.net>
 F:	package/libiio/
 F:	package/lightning/
-- 
2.21.0
