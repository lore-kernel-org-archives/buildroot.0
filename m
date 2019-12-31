From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 16:10:55 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add Lothar Felten as contact
 for BeagleBone defconfigs
Message-ID: <20191231150327.D3E3B8E950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28ba11eacb2056168e29cd168606507c15fffd6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lothar added the beaglebone and beaglebone_qt5 defconfigs, and has
been regularly maintaining them, so it makes sense to have him listed
as a contact for those two defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 770ec3c314..27bedad48c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1431,7 +1431,10 @@ F:	package/mongrel2/
 
 N:	Lothar Felten <lothar.felten@gmail.com>
 F:	board/bananapi/bananapi-m2-ultra/
+F:	board/beaglebone/
 F:	configs/bananapi_m2_ultra_defconfig
+F:	configs/beaglebone_defconfig
+F:	configs/beaglebone_qt5_defconfig
 F:	package/ti-sgx-demos/
 F:	package/ti-sgx-libgbm/
 F:	package/ti-sgx-km/
