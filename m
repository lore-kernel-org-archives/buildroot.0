From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 10:28:15 +0100
Subject: [Buildroot] [git commit] boot/uboot: add an upstream URL to
 Config.in
Message-ID: <20191229091905.BD02F8E616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ee8c2a64e3da244e693d995987d64983683f9d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the issue where an incorrect URL is displayed
on the package stats web page.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 15cae8045a..42f2090787 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -3,6 +3,8 @@ config BR2_TARGET_UBOOT
 	help
 	  Build "Das U-Boot" Boot Monitor
 
+	  https://www.denx.de/wiki/U-Boot
+
 if BR2_TARGET_UBOOT
 choice
 	prompt "Build system"
