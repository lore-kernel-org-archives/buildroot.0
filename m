From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Apr 2021 15:03:35 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/acl: add
 ACL_CPE_ID_VENDOR
Message-ID: <20210424124717.23C9685789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aaf958cb640e7955f86811a7cd72fa56a79b3c9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:acl_project:acl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aacl_project%3Aacl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 678edb144b640549696e89051dd4261d5c8b92ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acl/acl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 8dce274150..1591f4c87e 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -8,6 +8,7 @@ ACL_VERSION = 2.2.53
 ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
+ACL_CPE_ID_VENDOR = acl_project
 
 ACL_DEPENDENCIES = attr
 HOST_ACL_DEPENDENCIES = host-attr
