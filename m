From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Jun 2018 15:11:51 +0300
Subject: [Buildroot] [PATCH] lighttpd: bump to version 1.4.49
Message-ID: <f97c0e3ca6357ba2fc23a255cdc6173577beb913.1528805511.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 813d1cd0e04c..c99e240c7bd0 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From http://www.lighttpd.net/
-sha256 0f8ad5aac7529d7b948b9d7e8cd0b4a9e177309d85d6bf6516e28e6e40d74f36  lighttpd-1.4.48.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.49.sha256sum
+sha256 aedf49d7127d9e4c0ea56618e9e945a17674dc46a37ac7990120f87dd939ce09  lighttpd-1.4.49.tar.xz
 # Locally calculated
 sha256 5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 592f5474349e..c565fed4ff47 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).48
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).49
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.17.1
