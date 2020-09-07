From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  7 Sep 2020 23:00:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/jo: bump to version 1.4
Message-ID: <20200907210041.297280-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jo/jo.hash | 4 ++--
 package/jo/jo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jo/jo.hash b/package/jo/jo.hash
index 8190a15e2f..8f1cc8fcd9 100644
--- a/package/jo/jo.hash
+++ b/package/jo/jo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 de25c95671a3b392c6bcaba0b15d48eb8e2435508008c29477982d2d2f5ade64  jo-1.3.tar.gz
-sha256 41d8b23dc6e76731f4920b9ce42d0d4a248d243a510319e2441d174a115f35cf  COPYING
+sha256  24c64d2eb863900947f58f32b502c95fec8f086105fd31151b91f54b7b5256a2  jo-1.4.tar.gz
+sha256  41d8b23dc6e76731f4920b9ce42d0d4a248d243a510319e2441d174a115f35cf  COPYING
diff --git a/package/jo/jo.mk b/package/jo/jo.mk
index 5eb013245e..24b499f345 100644
--- a/package/jo/jo.mk
+++ b/package/jo/jo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JO_VERSION = 1.3
+JO_VERSION = 1.4
 JO_SITE = https://github.com/jpmens/jo/releases/download/$(JO_VERSION)
 JO_LICENSE = MIT (json.[ch]), GPL-2.0+ (rest)
 JO_LICENSE_FILES = COPYING
-- 
2.28.0
