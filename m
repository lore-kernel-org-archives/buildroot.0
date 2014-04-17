From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 17 Apr 2014 20:25:32 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.0.4
Message-ID: <1397759132-9068-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/zeromq/zeromq.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index d40bed5..833c1d3 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.0.1
+ZEROMQ_VERSION = 4.0.4
 ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
-- 
1.7.9.5
