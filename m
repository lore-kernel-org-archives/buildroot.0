From: Vincent Stehle <vincent.stehle@laposte.net>
Date: Sun, 26 Apr 2015 21:56:12 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add hash for 2012.07
Message-ID: <1430078172-8136-1-git-send-email-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Stehl? <vincent.stehle@laposte.net>

To repair the build of pandaboard_defconfig.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---
 boot/uboot/uboot.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 9cc96f6..9def045 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally computed:
+sha256	e08e20a6979bfca6eebb9a2b0e42aa4416af3d796332fd63a3470495a089d496  u-boot-2012.07.tar.bz2
 sha256	0a1a70df586655f527befa6f12e184e96ed61b126e5a567382321b17200f5d60  u-boot-2015.04.tar.bz2
-- 
2.1.4
