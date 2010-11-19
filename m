From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 07:24:15 +0100
Subject: [Buildroot] [git commit master 1/1] sqlite: bump to version 3.7.3
Message-ID: <20101119080414.A644B8D303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5e1773527ef9215f58e9a160f8a8d0ace02d5be2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/sqlite/sqlite.mk |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index a62580e..3f3b2f7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: libglib2, module-init-tools,
-	mtd-utils, openssh, qt
+	mtd-utils, openssh, qt, sqlite
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 847e77c..5d29570 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,11 +4,10 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.6.23.1
+SQLITE_VERSION = 3.7.3
 SQLITE_SOURCE = sqlite-amalgamation-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
-SQLITE_LIBTOOL_PATCH = NO
 
 ifneq ($(BR2_LARGEFILE),y)
 # the sqlite configure script fails to define SQLITE_DISABLE_LFS when
-- 
1.7.2.2
