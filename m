From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 11 Oct 2013 18:32:38 +0200
Subject: [Buildroot] [PATCH 1/1] apr: bump to version 1.4.8
Message-ID: <1381509158-5571-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/apr/apr.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 6394882..4da42c5 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.4.6
+APR_VERSION = 1.4.8
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
 APR_LICENSE_FILES = LICENSE
-- 
1.7.9.5
