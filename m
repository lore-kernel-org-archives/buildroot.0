From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Aug 2018 21:56:52 +0200
Subject: [Buildroot] [PATCH v2,1/1] glorytun: bump to version 0.0.99-mud
Message-ID: <20180821195652.1349-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix incorrect patch's number/serie in title

 package/glorytun/glorytun.hash | 2 +-
 package/glorytun/glorytun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glorytun/glorytun.hash b/package/glorytun/glorytun.hash
index 891af2079e..59a5f09c0e 100644
--- a/package/glorytun/glorytun.hash
+++ b/package/glorytun/glorytun.hash
@@ -1,2 +1,2 @@
-sha256 76849b1568119cf0834749db56d4882966863d31351c21c1b22f373f0c97a498  glorytun-0.0.93-mud.tar.gz
+sha256 5e23afad4592d6af27ffd2cb3c826cf0ea1b5166a05ef1ae5c77fb4e465bb735  glorytun-0.0.99-mud.tar.gz
 sha256 bd418f8ef7d62f2c89e3aa1e5dc41c7d7a6212eb1cdb4d39a26a5bd333e1b4a3  LICENSE
diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
index 233e1feaa9..f6d87c2605 100644
--- a/package/glorytun/glorytun.mk
+++ b/package/glorytun/glorytun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLORYTUN_VERSION = 0.0.93-mud
+GLORYTUN_VERSION = 0.0.99-mud
 GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
 GLORYTUN_DEPENDENCIES = libsodium host-pkgconf
 GLORYTUN_LICENSE = BSD-2-clause
-- 
2.14.1
