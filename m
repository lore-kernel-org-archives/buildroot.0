From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:37 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Theo Debrouwere as contact for
 beagleboardx15_defconfig
Message-ID: <20190811120739.26539-16-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Theo added this defconfig in 2016, and is listed as the contact for
the pugixml package, so it probably makes sense to have him listed as
a contact for the beagleboardx15_defconfig as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
---
Theo, could you reply with your Acked-by if you're fine with this?
Thanks!
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 35e8d871bc..36c25c9e87 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2227,6 +2227,8 @@ N:	Sven Oliver Moll <svolli@svolli.de>
 F:	package/most/
 
 N:	Theo Debrouwere <t.debrouwere@televic.com>
+F:	board/beagleboardx15/
+F:	configs/beagleboardx15_defconfig
 F:	package/pugixml/
 
 N:	Thierry Bultel <tbultel@free.fr>
-- 
2.21.0
