From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed,  8 Jan 2020 18:58:52 +0100
Subject: [Buildroot] [PATCH] package/python-periphery: bump to version 2.0.1
Message-ID: <1578506332-11020-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See changelog https://github.com/vsergeev/python-periphery/blob/master/CHANGELOG.md

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/python-periphery/python-periphery.hash | 2 +-
 package/python-periphery/python-periphery.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
index 3164120..e9c3869 100644
--- a/package/python-periphery/python-periphery.hash
+++ b/package/python-periphery/python-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e43d7e9037e73a6a108c73ed53f2a942373ee9c8d3aaca0f53a39956bef1f3d6  python-periphery-2.0.0.tar.gz
+sha256 e6da8dcf8f639d1c3be3f19d27cbd472ef904db204c5453b250f87ab9bca2025  python-periphery-2.0.1.tar.gz
 sha256 bf032b9319cfd918368219450a9917529f131925e698cbab1b63f42b629ff505  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index d24d87a..97cb52e 100644
--- a/package/python-periphery/python-periphery.mk
+++ b/package/python-periphery/python-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PERIPHERY_VERSION = 2.0.0
+PYTHON_PERIPHERY_VERSION = 2.0.1
 PYTHON_PERIPHERY_SITE = $(call github,vsergeev,python-periphery,v$(PYTHON_PERIPHERY_VERSION))
 PYTHON_PERIPHERY_LICENSE = MIT
 PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
-- 
2.7.4
