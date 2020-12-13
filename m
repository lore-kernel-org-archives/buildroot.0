From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Dec 2020 22:11:17 +0100
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: drop ti-sgx-libgbm
Message-ID: <20201213211117.300869-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 814bfc5ec1ab49188d1c8cb7f0d8d857b92d6a03 forgot to drop
ti-sgx-libgbm from DEVELOPERS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 73a27a3dd7..e77bcabe02 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1507,7 +1507,6 @@ F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/beaglebone_defconfig
 F:	configs/beaglebone_qt5_defconfig
 F:	package/ti-sgx-demos/
-F:	package/ti-sgx-libgbm/
 F:	package/ti-sgx-km/
 F:	package/ti-sgx-um/
 
-- 
2.29.2
