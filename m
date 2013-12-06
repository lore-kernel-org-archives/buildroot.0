From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  6 Dec 2013 12:25:32 +0100
Subject: [Buildroot] [PATCH v2 1/1] git: bump to version 1.8.5.1
Message-ID: <1386329133-9523-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
version v2:
- change of bumped version

 package/git/git.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 58455b1..cf16250 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION         = 1.8.4.1
+GIT_VERSION         = 1.8.5.1
 GIT_SITE            = http://git-core.googlecode.com/files/
 GIT_LICENSE         = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES   = COPYING LGPL-2.1
-- 
1.7.9.5
