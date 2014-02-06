From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  6 Feb 2014 08:17:56 +0200
Subject: [Buildroot] [PATCH] kexec: bump to 2.0.5
Message-ID: <c1975468b376a79f74134a4c49b4b0a5fd43caa5.1391667476.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/kexec/kexec.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 6ddf43510248..b16787c8a796 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.4
+KEXEC_VERSION = 2.0.5
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 
-- 
1.8.5.3
