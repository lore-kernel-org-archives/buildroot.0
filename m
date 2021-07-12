From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Jul 2021 10:16:08 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 boot/arm-trusted-firmware: fix coding-style
Message-ID: <20210712075038.72BE493752@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82c06315e5014a5d79fcb83d2f29e2f7af8018f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix coding style issue introduced in cf176128ec4a (boot/arm-trusted-firmware:
add SSP option)

Fixes: cf176128ec4ad60c29c8828cab1887f69edb9473

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 11fffded3c575839504d19d14803840901985b67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index d2535b2f17..26c12670dc 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -177,9 +177,9 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP
 	bool "Build with SSP"
+	default y
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on !BR2_SSP_NONE
-	default y
 	help
 	  Say 'y' here if you want to build ATF with SSP.
 
