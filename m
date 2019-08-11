From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:33 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Yann E. Morin as contact for
 nanopi_neo_defconfig
Message-ID: <20190811120739.26539-12-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann originally contributed this defconfig, and updated it regularly
afterwards, so let's list him as contact for this defconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
Yann, could you reply with an Acked-by, if you're fine with this?
Thanks!
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8fbb8abad3..4cfb67e3a7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2382,6 +2382,8 @@ N:	Wojciech Nizi?ski <niziak@spox.org>
 F:	package/fwup/
 
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
+F:	board/friendlyarm/nanopi-neo/
+F:	configs/nanopi_neo_defconfig
 F:	fs/squashfs/
 F:	package/asterisk/
 F:	package/cegui06/
-- 
2.21.0
