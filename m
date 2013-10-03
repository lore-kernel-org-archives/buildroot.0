From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu,  3 Oct 2013 18:32:18 +0200
Subject: [Buildroot] [PATCH 1/1] empty: bump to version 0.6.19b
Message-ID: <1380817938-25881-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/empty/empty.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 4294777..3339ff6 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMPTY_VERSION = 0.6.18b
+EMPTY_VERSION = 0.6.19b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 EMPTY_LICENSE = BSD-3c
-- 
1.7.9.5
