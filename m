From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 22:09:27 +0200
Subject: [Buildroot] [git commit] acl: add license information
Message-ID: <20140525204125.BC1349CD68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6783c64d0fee12ff107ef9fbdf14f07b8901256b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing license info and file for package 'acl'

[Peter: change to '+' version of licenses]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acl/acl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 130ad10..feb0a7b 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -10,6 +10,8 @@ ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_INSTALL_STAGING = YES
 ACL_DEPENDENCIES = attr
 ACL_CONF_OPT = --enable-gettext=no
+ACL_LICENSE = GPLv2+, LGPLv2.1+
+ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
 # While the configuration system uses autoconf, the Makefiles are
 # hand-written and do not use automake. Therefore, we have to hack
