From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 21:21:02 +0100
Subject: [Buildroot] [git commit] package/python-periphery: bump to version
 2.0.1
Message-ID: <20200112201134.693858B72F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b957c369b8a895866b48fff8c84bbb7be8418f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See changelog https://github.com/vsergeev/python-periphery/blob/master/CHANGELOG.md

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-periphery/python-periphery.hash | 2 +-
 package/python-periphery/python-periphery.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
index 31641203e5..e9c3869eb7 100644
--- a/package/python-periphery/python-periphery.hash
+++ b/package/python-periphery/python-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e43d7e9037e73a6a108c73ed53f2a942373ee9c8d3aaca0f53a39956bef1f3d6  python-periphery-2.0.0.tar.gz
+sha256 e6da8dcf8f639d1c3be3f19d27cbd472ef904db204c5453b250f87ab9bca2025  python-periphery-2.0.1.tar.gz
 sha256 bf032b9319cfd918368219450a9917529f131925e698cbab1b63f42b629ff505  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index d24d87ab6a..97cb52e58b 100644
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
