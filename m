From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:43:51 +0100
Subject: [Buildroot] [git commit] package/python-periphery: bump to version
 2.0.0
Message-ID: <20191104203653.9D7638E612@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ae6604f6ec1455abfda2a7f2384670f43276f65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file hash has changed because the copyright years were
updated in the LICENSE file:

-Copyright (c) 2015-2016 vsergeev / Ivan (Vanya) A. Sergeev
+Copyright (c) 2015-2019 vsergeev / Ivan (Vanya) A. Sergeev

See full changelog https://github.com/vsergeev/python-periphery/blob/master/CHANGELOG.md

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-periphery/python-periphery.hash | 4 ++--
 package/python-periphery/python-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
index 41dcc3fbde..31641203e5 100644
--- a/package/python-periphery/python-periphery.hash
+++ b/package/python-periphery/python-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 fd06c9a1b3d84d52d46ffb2a31a978d8ffd6c769e1316527c8aebaa86b6872b9  python-periphery-1.1.2.tar.gz
-sha256 db1bea825e728d8bcdf6c220d79c74370a9fcb63a4f9153c2cece2b63e177aa4  LICENSE
+sha256 e43d7e9037e73a6a108c73ed53f2a942373ee9c8d3aaca0f53a39956bef1f3d6  python-periphery-2.0.0.tar.gz
+sha256 bf032b9319cfd918368219450a9917529f131925e698cbab1b63f42b629ff505  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index fc0a28993a..d24d87ab6a 100644
--- a/package/python-periphery/python-periphery.mk
+++ b/package/python-periphery/python-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PERIPHERY_VERSION = 1.1.2
+PYTHON_PERIPHERY_VERSION = 2.0.0
 PYTHON_PERIPHERY_SITE = $(call github,vsergeev,python-periphery,v$(PYTHON_PERIPHERY_VERSION))
 PYTHON_PERIPHERY_LICENSE = MIT
 PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
