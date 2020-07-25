From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sat, 25 Jul 2020 22:00:07 +0200
Subject: [Buildroot] [PATCH] package/python-pydal: bump to version 20200714.1
Message-ID: <20200725200007.201535-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this patch bumps python-pydal to version 20200714.1

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pydal/python-pydal.hash | 2 +-
 package/python-pydal/python-pydal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 1823050713..4eaeccbf46 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # sha256 from https://pypi.org/project/pyDAL/#files
-sha256 ae0de85bbecfef886db8f8888c9b6de794ba2615867a75d5daa463701152baa4  python-pydal-20200531.1.tar.gz
+sha256 65bc77933eb9ac84874702629fcb167c18dc242a00cf7cc191899796761349e4  python-pydal-20200714.1.tar.gz
 sha256 1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 0836b1d00a..2ea3790a3d 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20200531.1
+PYTHON_PYDAL_VERSION = 20200714.1
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
