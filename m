From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 28 May 2013 12:55:42 +0200
Subject: [Buildroot] [PATCH 1/1] acl: bump to version 2.2.52
Message-ID: <1369738542-31407-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/acl/acl.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index e7a654c..f2b2828 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ACL_VERSION = 2.2.51
+ACL_VERSION = 2.2.52
 ACL_SOURCE = acl-$(ACL_VERSION).src.tar.gz
 ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_INSTALL_STAGING = YES
-- 
1.7.9.5
