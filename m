From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 11:46:06 +0200
Subject: [Buildroot] [git commit] acl: clarify license info
Message-ID: <20140526094735.3D1B49CC7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1a3e0cb1be043bb8efe91a415615440f7ba94a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out by Thomas Petazzoni in his review.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acl/acl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index feb0a7b..35d2f9b 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -10,7 +10,7 @@ ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_INSTALL_STAGING = YES
 ACL_DEPENDENCIES = attr
 ACL_CONF_OPT = --enable-gettext=no
-ACL_LICENSE = GPLv2+, LGPLv2.1+
+ACL_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
 # While the configuration system uses autoconf, the Makefiles are
