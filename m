From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri,  7 Jun 2013 16:27:30 -0700
Subject: [Buildroot] [PATCH 1/1] linenoise: fix git hash tag
Message-ID: <1370647651-13370-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove initial g from hash tag to fix downloads from github.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/linenoise/linenoise.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 01bfa0c..b2e8a0b 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = g27a3b4d
+LINENOISE_VERSION = 27a3b4d
 LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/$(LINENOISE_VERSION)
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_INSTALL_STAGING = YES
-- 
1.7.9.5
