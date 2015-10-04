From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:20 +0200
Subject: [Buildroot] [git commit] uboot: remove now-redundant ccache handling
Message-ID: <20151004162325.0D6C681D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbdf8317081c783f0ac416336e76b7bf7160823c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 8f321ac..7494078 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -74,7 +74,7 @@ endif
 UBOOT_ARCH = $(KERNEL_ARCH)
 
 UBOOT_MAKE_OPTS += \
-	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
 	ARCH=$(UBOOT_ARCH)
 
 # Helper function to fill the U-Boot config.h file.
