From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 10 Jun 2014 08:30:05 +0200
Subject: [Buildroot] [PATCH] kexec: bump to 2.0.7
Message-ID: <1402381805-7760-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/kexec/kexec.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index e88254c..9787038 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.6
+KEXEC_VERSION = 2.0.7
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 
-- 
1.8.1.2
