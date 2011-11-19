From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Nov 2011 19:56:50 +0100
Subject: [Buildroot] [git commit] u-boot: fix CUSTOM_PATCH_DIR documentation
Message-ID: <20111119185926.C7D2C8F5FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=376a535fb38ebc35b05a98cbb184d37c381ba124
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're using uboot-<version>-*.patch, and not u-boot-<version>-*.patch

Reported-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index daccd8b..506f354 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -61,7 +61,7 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	help
 	  If your board requires custom patches, add the path to the
 	  directory containing the patches here. The patches must be
-	  named u-boot-<version>-<something>.patch.
+	  named uboot-<version>-<something>.patch.
 
 	  Most users may leave this empty
 
