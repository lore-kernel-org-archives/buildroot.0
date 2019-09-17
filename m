From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:48:55 +0200
Subject: [Buildroot] [git commit] package/python-periphery: bump to version
 1.1.2
Message-ID: <20190917204426.3D30D8EA68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44eeec471df8321308de75514d5f8254dc36027a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-periphery/python-periphery.hash | 2 +-
 package/python-periphery/python-periphery.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
index de988b337e..41dcc3fbde 100644
--- a/package/python-periphery/python-periphery.hash
+++ b/package/python-periphery/python-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a9a0a0ac02b8c3a954281777e92a15ec41abd311eb8732b50a2faaa9df62f1df  python-periphery-1.1.1.tar.gz
+sha256 fd06c9a1b3d84d52d46ffb2a31a978d8ffd6c769e1316527c8aebaa86b6872b9  python-periphery-1.1.2.tar.gz
 sha256 db1bea825e728d8bcdf6c220d79c74370a9fcb63a4f9153c2cece2b63e177aa4  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index 150ac1ca9a..fc0a28993a 100644
--- a/package/python-periphery/python-periphery.mk
+++ b/package/python-periphery/python-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PERIPHERY_VERSION = 1.1.1
+PYTHON_PERIPHERY_VERSION = 1.1.2
 PYTHON_PERIPHERY_SITE = $(call github,vsergeev,python-periphery,v$(PYTHON_PERIPHERY_VERSION))
 PYTHON_PERIPHERY_LICENSE = MIT
 PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
