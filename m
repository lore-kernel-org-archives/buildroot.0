From: Simon Dawson <spdawson@gmail.com>
Date: Mon,  5 May 2014 18:22:35 +0100
Subject: [Buildroot] [PATCH] lcdproc: bump version to 0.5.7
Message-ID: <1399310555-9569-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/lcdproc/lcdproc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index dfd7f7f..2f19a3e 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCDPROC_VERSION = 0.5.6
+LCDPROC_VERSION = 0.5.7
 LCDPROC_SITE = http://downloads.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
 LCDPROC_LICENSE = GPLv2+
 LCDPROC_LICENSE_FILES = COPYING
-- 
1.9.1
