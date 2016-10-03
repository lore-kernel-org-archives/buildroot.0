From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:47 +0200
Subject: [Buildroot] [PATCH 27/28] package/python-pysnmp-apps: bump version
	to 0.4.1
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-27-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pysnmp-apps/python-pysnmp-apps.hash | 5 +++--
 package/python-pysnmp-apps/python-pysnmp-apps.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.hash b/package/python-pysnmp-apps/python-pysnmp-apps.hash
index cb57c8d..2b865cb 100644
--- a/package/python-pysnmp-apps/python-pysnmp-apps.hash
+++ b/package/python-pysnmp-apps/python-pysnmp-apps.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  e073732ed34777bdeb018dcd8b3fa51bc85956da80b92da401a4436ee72350e0  pysnmp-apps-0.3.3.tar.gz
+# md5 from https://pypi.python.org/pypi/pysnmp-apps/json, sha256 locally computed
+md5	7fc08e2d81a77d558b38be5e49ff833e  pysnmp-apps-0.4.1.tar.gz
+sha256	57accb8c2fcb255b4da85af07ef9cd6a266dc5143b2834419ec8a39a879edeb7  pysnmp-apps-0.4.1.tar.gz
diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.mk b/package/python-pysnmp-apps/python-pysnmp-apps.mk
index d6e9db2..a055442 100644
--- a/package/python-pysnmp-apps/python-pysnmp-apps.mk
+++ b/package/python-pysnmp-apps/python-pysnmp-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_APPS_VERSION = 0.3.3
+PYTHON_PYSNMP_APPS_VERSION = 0.4.1
 PYTHON_PYSNMP_APPS_SOURCE = pysnmp-apps-$(PYTHON_PYSNMP_APPS_VERSION).tar.gz
 PYTHON_PYSNMP_APPS_SITE = https://pypi.python.org/packages/source/p/pysnmp-apps
 PYTHON_PYSNMP_APPS_SETUP_TYPE = setuptools
-- 
2.9.3
