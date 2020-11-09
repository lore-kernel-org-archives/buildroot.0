From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 17:02:56 +0100
Subject: [Buildroot] [git commit] package/guile: renumber patch
Message-ID: <20201109155530.CDE11877EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbf2ad443e7988cdb1bed5a153df747de9d2d7ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...makeinfo.patch => 0003-Makefile.am-fix-build-without-makeinfo.patch} | 0
 package/guile/guile.mk                                                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/guile/0004-Makefile.am-fix-build-without-makeinfo.patch b/package/guile/0003-Makefile.am-fix-build-without-makeinfo.patch
similarity index 100%
rename from package/guile/0004-Makefile.am-fix-build-without-makeinfo.patch
rename to package/guile/0003-Makefile.am-fix-build-without-makeinfo.patch
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index f1623008c8..5e901bb10f 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -9,7 +9,7 @@ GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
 # For 0002-calculate-csqrt_manually.patch and
-# 0004-Makefile.am-fix-build-without-makeinfo.patch
+# 0003-Makefile.am-fix-build-without-makeinfo.patch
 GUILE_AUTORECONF = YES
 GUILE_LICENSE = LGPL-3.0+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
