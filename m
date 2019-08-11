From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:38 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Lothar Felten as contact for
 BeagleBone defconfigs
Message-ID: <20190811120739.26539-17-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lothar added the beaglebone and beaglebone_qt5 defconfigs, and has
been regularly maintaining them, so it makes sense to have him listed
as a contact for those two defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Lothar Felten <lothar.felten@gmail.com>
---
Lothar, could you reply with an Acked-by if you are fine with this?
Thanks!
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 36c25c9e87..bc7a408425 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1371,7 +1371,10 @@ F:	package/mongrel2/
 
 N:	Lothar Felten <lothar.felten@gmail.com>
 F:	board/bananapi/bananapi-m2-ultra/
+F:	board/beaglebone/
 F:	configs/bananapi_m2_ultra_defconfig
+F:	configs/beaglebone_defconfig
+F:	configs/beaglebone_qt5_defconfig
 F:	package/ti-sgx-demos/
 F:	package/ti-sgx-km/
 F:	package/ti-sgx-um/
-- 
2.21.0
