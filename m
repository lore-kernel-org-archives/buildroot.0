From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Apr 2021 21:21:48 +0200
Subject: [Buildroot] [git commit] package/acl: bump to version 2.3.1
Message-ID: <20210409185753.605697FE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a28e511cd7cdfd5ecd597aa3b20d110a061daa06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acl/acl.hash | 2 +-
 package/acl/acl.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/acl/acl.hash b/package/acl/acl.hash
index 50c32d7734..32e904baf3 100644
--- a/package/acl/acl.hash
+++ b/package/acl/acl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7  acl-2.2.53.tar.gz
+sha256  c0234042e17f11306c23c038b08e5e070edb7be44bef6697fb8734dcff1c66b1  acl-2.3.1.tar.xz
 
 # Locally calculated
 sha256  a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  doc/COPYING
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 1591f4c87e..c898421dc5 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-ACL_VERSION = 2.2.53
+ACL_VERSION = 2.3.1
+ACL_SOURCE = acl-$(ACL_VERSION).tar.xz
 ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
