From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sun, 14 Mar 2021 17:03:27 +0100
Subject: [Buildroot] [PATCH] package/python-periphery: bump to version 2.3.0
Message-ID: <20210314160327.5747-1-texier.pj2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See changelog https://github.com/vsergeev/python-periphery/blob/master/CHANGELOG.md

Update the license hash for a change in copyright years:
-Copyright (c) 2015-2020 vsergeev / Ivan (Vanya) A. Sergeev
+Copyright (c) 2015-2021 vsergeev / Ivan (Vanya) A. Sergeev

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 package/python-periphery/python-periphery.hash | 4 ++--
 package/python-periphery/python-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
index 13636d17ad..24e104d3ad 100644
--- a/package/python-periphery/python-periphery.hash
+++ b/package/python-periphery/python-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c2482d026afc974ba5a966cd2c3a724ecf55e253223a9ea80fc98f77a3ca414  python-periphery-2.1.0.tar.gz
-sha256  4a2ed465d05c7ec58bb5a8cd7d2475a2d423bb73cb9bc3e3565500c222d03dc8  LICENSE
+sha256  385716bdbd11fcf2c5728548c3d42f12ebc0974faa64fa1a98b89b4a44dc004c  python-periphery-2.3.0.tar.gz
+sha256  76fe342043adfe8d9453c4979aa165476875137e15b0ddea1f4c3f3fa9808361  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index c322ded3b5..2c533fa2c2 100644
--- a/package/python-periphery/python-periphery.mk
+++ b/package/python-periphery/python-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PERIPHERY_VERSION = 2.1.0
+PYTHON_PERIPHERY_VERSION = 2.3.0
 PYTHON_PERIPHERY_SITE = $(call github,vsergeev,python-periphery,v$(PYTHON_PERIPHERY_VERSION))
 PYTHON_PERIPHERY_LICENSE = MIT
 PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
-- 
2.17.1
