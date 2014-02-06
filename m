From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu,  6 Feb 2014 15:05:05 +0100
Subject: [Buildroot] [PATCH 1/1] git: bump to version 1.8.5.4
Message-ID: <1391695505-30721-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index e2df3a0..63862f2 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION         = 1.8.5.3
+GIT_VERSION         = 1.8.5.4
 GIT_SITE            = http://git-core.googlecode.com/files/
 GIT_LICENSE         = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES   = COPYING LGPL-2.1
-- 
1.7.9.5
