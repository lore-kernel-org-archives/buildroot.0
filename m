From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  2 Jun 2015 18:32:56 +0200
Subject: [Buildroot] [PATCH 2/5] linenoise: bump to version 1.0
In-Reply-To: <1433262779-20797-1-git-send-email-francois.perrad@gadz.org>
References: <1433262779-20797-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1433262779-20797-2-git-send-email-francois.perrad@gadz.org>
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
index 7321564..64a7b7c 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = cf1bdf5f89e10b504a0bec3efc8a8587eadecd2c
+LINENOISE_VERSION = 1.0
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_LICENSE_FILES = LICENSE
-- 
2.1.4
