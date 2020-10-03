From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Oct 2020 10:16:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/civetweb: bump to version 1.13
Message-ID: <20201003081643.2969711-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/civetweb/civetweb/releases/tag/v1.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/civetweb/civetweb.hash | 2 +-
 package/civetweb/civetweb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index ae3c3c9510..cf9d676832 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8cab1e2ad8fb3e2e81fed0b2321a5afbd7269a644c44ed4c3607e0a212c6d9e1  civetweb-1.12.tar.gz
+sha256  a7ccc76c2f1b5f4e8d855eb328ed542f8fe3b882a6da868781799a98f4acdedc  civetweb-1.13.tar.gz
 sha256  291622dfbbf4fb35829726fbe97177b7227c0d4d6392b350660af73af4f86df8  LICENSE.md
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 1b45974c30..448f979b41 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIVETWEB_VERSION = 1.12
+CIVETWEB_VERSION = 1.13
 CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
-- 
2.28.0
