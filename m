From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Apr 2021 22:45:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/acl: add ACL_CPE_ID_VENDOR
Message-ID: <20210406204501.1340302-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:acl_projectt:acl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aacl_project%3Aacl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acl/acl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index bc33a4b71f..5a6acddbc2 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -8,6 +8,7 @@ ACL_VERSION = 2.3.1
 ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
+ACL_CPE_ID_VENDOR = acl_project
 
 ACL_DEPENDENCIES = attr
 HOST_ACL_DEPENDENCIES = host-attr
-- 
2.30.2
