From: Peter Rosin <peda@lysator.liu.se>
Date: Wed, 25 Nov 2015 13:29:11 +0100
Subject: [Buildroot] [PATCH] sqlite: add license file
Message-ID: <1448454551-31095-1-git-send-email-peda@lysator.liu.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Rosin <peda@axentia.se>

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 package/sqlite/sqlite.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index d08e933..0758fe9 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -8,6 +8,7 @@ SQLITE_VERSION = 3090200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
+SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_INSTALL_STAGING = YES
 
 # Patching Makefile.am:
-- 
1.7.10.4
