From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Nov 2010 21:47:48 +0100
Subject: [Buildroot] [git commit master 1/1] boot/syslinux: allow build on
	x86_64
Message-ID: <20101129204830.56B3B8D43D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=87683d7e9c524800f8d90ecfbdc44818430e684f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.2.2
