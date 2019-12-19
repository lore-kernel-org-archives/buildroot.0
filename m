From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Dec 2019 23:10:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/duktape: bump to version 2.5.0
Message-ID: <20191219221037.1285195-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/duktape/duktape.hash | 2 +-
 package/duktape/duktape.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/duktape/duktape.hash b/package/duktape/duktape.hash
index c5c4682696..b50ae7329c 100644
--- a/package/duktape/duktape.hash
+++ b/package/duktape/duktape.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	4b022e040f10d6ead4fd3d0c865ca97d1679fc39307d4d3fa4a7f463ee4b9658	duktape-2.4.0.tar.gz
+sha256	810e1dab50dfd3040cac4bb18b96d749a5fdebfd898a7bfe74512044c1a89880	duktape-2.5.0.tar.gz
 sha256	5b42d02dbd084fd6d7e61d93f52e02b596f25400e54e0f86d5780045e5b754c8	LICENSE.txt
diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index 30efaf5fa1..0047571883 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUKTAPE_VERSION = 2.4.0
+DUKTAPE_VERSION = 2.5.0
 DUKTAPE_SITE = $(call github,svaarala,duktape-releases,v$(DUKTAPE_VERSION))
 DUKTAPE_LICENSE = MIT
 DUKTAPE_LICENSE_FILES = LICENSE.txt
-- 
2.24.0
