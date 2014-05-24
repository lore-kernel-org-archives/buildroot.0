From: Heiko Abraham <abrahamh@web.de>
Date: Sat, 24 May 2014 15:16:52 +0200
Subject: [Buildroot] [PATCH] acl: add license information
Message-ID: <1400937412-9808-1-git-send-email-abrahamh@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing license info and file for package 'acl'
---
 package/acl/acl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 130ad10..684eb20 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -10,6 +10,8 @@ ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_INSTALL_STAGING = YES
 ACL_DEPENDENCIES = attr
 ACL_CONF_OPT = --enable-gettext=no
+ACL_LICENSE = GPLv2, LGPLv2.1
+ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
 # While the configuration system uses autoconf, the Makefiles are
 # hand-written and do not use automake. Therefore, we have to hack
-- 
1.8.5.2 (Apple Git-48)
