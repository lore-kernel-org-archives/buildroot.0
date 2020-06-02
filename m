From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:18:49 +0200
Subject: [Buildroot] [git commit] package/python-periphery: bump to version
 2.1.0
Message-ID: <20200602211933.35C0082AF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96972e73eda01c657d762612b8190161302568bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See changelog https://github.com/vsergeev/python-periphery/blob/master/CHANGELOG.md

Update the license hash for a change in copyright years:
-Copyright (c) 2015-2019 vsergeev / Ivan (Vanya) A. Sergeev
+Copyright (c) 2015-2020 vsergeev / Ivan (Vanya) A. Sergeev

Also switch to the new 2 spaces convention for the hash file

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-periphery/python-periphery.hash | 4 ++--
 package/python-periphery/python-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
index e9c3869eb7..13636d17ad 100644
--- a/package/python-periphery/python-periphery.hash
+++ b/package/python-periphery/python-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e6da8dcf8f639d1c3be3f19d27cbd472ef904db204c5453b250f87ab9bca2025  python-periphery-2.0.1.tar.gz
-sha256 bf032b9319cfd918368219450a9917529f131925e698cbab1b63f42b629ff505  LICENSE
+sha256  2c2482d026afc974ba5a966cd2c3a724ecf55e253223a9ea80fc98f77a3ca414  python-periphery-2.1.0.tar.gz
+sha256  4a2ed465d05c7ec58bb5a8cd7d2475a2d423bb73cb9bc3e3565500c222d03dc8  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index 97cb52e58b..c322ded3b5 100644
--- a/package/python-periphery/python-periphery.mk
+++ b/package/python-periphery/python-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PERIPHERY_VERSION = 2.0.1
+PYTHON_PERIPHERY_VERSION = 2.1.0
 PYTHON_PERIPHERY_SITE = $(call github,vsergeev,python-periphery,v$(PYTHON_PERIPHERY_VERSION))
 PYTHON_PERIPHERY_LICENSE = MIT
 PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
