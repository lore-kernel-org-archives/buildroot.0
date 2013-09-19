From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Sep 2013 19:21:43 -0300
Subject: [Buildroot] [PATCH] bc: needs host-flex
Message-ID: <1379629303-29046-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/49d/49d78f0528c6ecc2adfcfa17f4b09ec225c594be/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bc/bc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 3f1f7e7..293b80d 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -6,6 +6,7 @@
 
 BC_VERSION = 1.06
 BC_SITE = $(BR2_GNU_MIRROR)/bc/
+BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPLv2+ LGPLv2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
 
-- 
1.8.1.5
