From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Jul 2011 14:00:19 +0200
Subject: [Buildroot] [git commit] uboot: fix custom patch dir typo
Message-ID: <20110719120041.151C78A694@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e5decb1905708573e4741e786db7bbb8e1f93561
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Noticed by robinmholt on IRC.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/uboot.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1425579..776bdef 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -56,7 +56,7 @@ define UBOOT_APPLY_CUSTOM_PATCHES
 		uboot-$(UBOOT_VERSION)-\*.patch
 endef
 
-UBOOT_POST_PATCH_HOOKS += U_BOOT_APPLY_CUSTOM_PATCHES
+UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
 define UBOOT_CONFIGURE_CMDS
-- 
1.7.3.4
