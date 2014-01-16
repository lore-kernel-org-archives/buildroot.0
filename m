From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 16 Jan 2014 09:10:22 +0100
Subject: [Buildroot] [PATCH 1/1] git: bump to version 1.8.5.3
Message-ID: <1389859822-31210-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/git/git.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 3e198a6..e2df3a0 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION         = 1.8.5.2
+GIT_VERSION         = 1.8.5.3
 GIT_SITE            = http://git-core.googlecode.com/files/
 GIT_LICENSE         = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES   = COPYING LGPL-2.1
-- 
1.7.9.5
