From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 06:52:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp-apps: fix
	LICENSE_FILES
Message-ID: <20161006045237.31482-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/4dd/4dd3a5c0654179a43b2efba54b5ac3094592d0d3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pysnmp-apps/python-pysnmp-apps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.mk b/package/python-pysnmp-apps/python-pysnmp-apps.mk
index a055442..2c831df 100644
--- a/package/python-pysnmp-apps/python-pysnmp-apps.mk
+++ b/package/python-pysnmp-apps/python-pysnmp-apps.mk
@@ -9,7 +9,7 @@ PYTHON_PYSNMP_APPS_SOURCE = pysnmp-apps-$(PYTHON_PYSNMP_APPS_VERSION).tar.gz
 PYTHON_PYSNMP_APPS_SITE = https://pypi.python.org/packages/source/p/pysnmp-apps
 PYTHON_PYSNMP_APPS_SETUP_TYPE = setuptools
 PYTHON_PYSNMP_APPS_LICENSE = BSD-3c
-PYTHON_PYSNMP_APPS_LICENSE_FILES = LICENSE
+PYTHON_PYSNMP_APPS_LICENSE_FILES = LICENSE.txt
 
 PYTHON_PYSNMP_APPS_DEPENDENCIES = python-pysnmp
 
-- 
2.9.3
