From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:17:18 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: drop ti-sgx-libgbm
Message-ID: <20201213210157.E97CB83E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b46f050475079d6ce76ee08735b9245c6f317c61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 814bfc5ec1ab49188d1c8cb7f0d8d857b92d6a03 forgot to drop
ti-sgx-libgbm from DEVELOPERS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f33f88df43..a2c7f7f34a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1504,7 +1504,6 @@ F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/beaglebone_defconfig
 F:	configs/beaglebone_qt5_defconfig
 F:	package/ti-sgx-demos/
-F:	package/ti-sgx-libgbm/
 F:	package/ti-sgx-km/
 F:	package/ti-sgx-um/
 
