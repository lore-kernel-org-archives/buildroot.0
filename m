From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun,  8 Nov 2020 18:07:18 +0100
Subject: [Buildroot] [PATCH] package/python-pydal: bump to version 20200910.1
Message-ID: <20201108170718.1225726-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While bumping updating the sha256 computation method.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 161395ac52..224f32856f 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
-# sha256 from https://pypi.org/project/pyDAL/#files
-sha256  65bc77933eb9ac84874702629fcb167c18dc242a00cf7cc191899796761349e4  python-pydal-20200714.1.tar.gz
+# sha256 locally computed
+sha256  df54be164bcdab8ffc8db88cb72333cc4b27997ce58c302dd8ade36462d799ea  python-pydal-20200910.1.tar.gz
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 2ea3790a3d..2cac839a9e 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20200714.1
+PYTHON_PYDAL_VERSION = 20200910.1
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
