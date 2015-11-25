From: Peter Rosin <peda@lysator.liu.se>
Date: Wed, 25 Nov 2015 13:45:34 +0100
Subject: [Buildroot] [PATCH] macchanger: add license file
Message-ID: <1448455534-766-1-git-send-email-peda@lysator.liu.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Rosin <peda@axentia.se>

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 package/macchanger/macchanger.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/macchanger/macchanger.mk b/package/macchanger/macchanger.mk
index 5ded0b8..a74337a 100644
--- a/package/macchanger/macchanger.mk
+++ b/package/macchanger/macchanger.mk
@@ -7,5 +7,6 @@
 MACCHANGER_VERSION = 1.6.0
 MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger
 MACCHANGER_LICENSE = GPLv2+
+MACCHANGER_LICENSE_FILES = src/mac.h
 
 $(eval $(autotools-package))
-- 
1.7.10.4
