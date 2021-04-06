From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Apr 2021 22:40:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/acl: bump to version 2.3.1
Message-ID: <20210406204006.1339987-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acl/acl.hash | 2 +-
 package/acl/acl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/acl/acl.hash b/package/acl/acl.hash
index 50c32d7734..2bca73d186 100644
--- a/package/acl/acl.hash
+++ b/package/acl/acl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7  acl-2.2.53.tar.gz
+sha256  760c61c68901b37fdd5eefeeaf4c0c7a26bdfdd8ac747a1edff1ce0e243c11af  acl-2.3.1.tar.gz
 
 # Locally calculated
 sha256  a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  doc/COPYING
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 8dce274150..bc33a4b71f 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACL_VERSION = 2.2.53
+ACL_VERSION = 2.3.1
 ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
-- 
2.30.2
