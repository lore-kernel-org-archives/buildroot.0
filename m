From: Stewart Smith <stewart@linux.vnet.ibm.com>
Date: Tue, 10 Jan 2017 12:38:16 +1100
Subject: [Buildroot] [PATCH] kexec-lite: add KEXEC_LITE_LICENSE_FILES
Message-ID: <20170110013816.17805-1-stewart@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
 package/kexec-lite/kexec-lite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 2467306..b1b66fd 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -7,6 +7,7 @@
 KEXEC_LITE_VERSION = 86e45a47e8cc1f598ccfa9b873a23067f4ecc36f
 KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
 KEXEC_LITE_LICENSE = GPLv2+
+KEXEC_LITE_LICENSE_FILES = COPYING
 KEXEC_LITE_DEPENDENCIES = elfutils dtc
 
 define KEXEC_LITE_BUILD_CMDS
-- 
2.9.3
