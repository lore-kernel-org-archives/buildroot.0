From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 15 Jul 2019 21:35:11 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add hash for license file
Message-ID: <1563219311-10528-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 >>> uboot 2019.07 Collecting legal info
 ERROR: No hash found for Licenses/gpl-2.0.txt

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 boot/uboot/uboot.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index d83dc06..d2830ee 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0  u-boot-2019.07.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.7.4
