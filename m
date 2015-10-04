From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 13:28:49 +0100
Subject: [Buildroot] [PATCH v2 09/18] uboot: remove now-redundant ccache
	handling
In-Reply-To: <1443961738-12149-1-git-send-email-arnout@mind.be>
References: <1443961738-12149-1-git-send-email-arnout@mind.be>
Message-ID: <1443961738-12149-10-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
v2: No change
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.5.3
