From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun, 28 Nov 2010 17:30:12 -0600
Subject: [Buildroot] [PATCH 1/1] allow build of syslinux on x86_64
Message-ID: <4001ec02470ab7771b8d4f0b6ddee9e1cc6961ef.1290986952.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 boot/syslinux/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index c65bc1f..5650f91 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_SYSLINUX
 	bool "syslinux"
-	depends on BR2_i386
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  The syslinux bootloader for x86 systems.
 	  This includes: syslinux, pxelinux, extlinux.
-- 
1.7.3.2
