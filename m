From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  8 Sep 2014 20:30:33 +0200
Subject: [Buildroot] [PATCH 1/2] linenoise: bump version
Message-ID: <1410201034-11041-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/linenoise/linenoise.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 4cb1427..562b445 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = 27a3b4d5205a5fb3e2101128edd6653bd0c92189
+LINENOISE_VERSION = 828b9dacc52d4ad5a15c89be8fb8691d224f9a4f
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_INSTALL_STAGING = YES
-- 
1.9.1
