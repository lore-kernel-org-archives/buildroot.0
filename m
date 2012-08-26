From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 26 Aug 2012 18:31:49 -0400
Subject: [Buildroot] [PATCH] sqlite: add license info
Message-ID: <1346020310-3067-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/sqlite/sqlite.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 9e63b52..7b5b4aa 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -7,6 +7,7 @@
 SQLITE_VERSION = 3071300
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
+SQLITE_LICENSE = Public domain
 SQLITE_INSTALL_STAGING = YES
 
 ifneq ($(BR2_LARGEFILE),y)
-- 
1.7.9.5
