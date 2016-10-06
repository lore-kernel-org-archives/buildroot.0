From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:31 +0200
Subject: [Buildroot] [PATCH 04/21] package/python-pysnmp-mibs: bump version
	to 0.1.6
In-Reply-To: <20161006192948.27956-1-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
Message-ID: <20161006192948.27956-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pysnmp-mibs/python-pysnmp-mibs.hash | 5 +++--
 package/python-pysnmp-mibs/python-pysnmp-mibs.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
index 3253896..8deb2e5 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  a499ef45d942f42ab9e922c7da93efa084a7ec490ba6cad576b64a7d573ec043  pysnmp-mibs-0.1.4.tar.gz
+# md5 from https://pypi.python.org/pypi/pysnmp-mibs/json, sha256 locally computed
+md5	01845c4595d87d3c3485c0449616cbda  pysnmp-mibs-0.1.6.tar.gz
+sha256	00fa321ca598e8a14c0ad98702bf10fb5e9d57b7d06bb99dc818fea07683720c  pysnmp-mibs-0.1.6.tar.gz
diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
index 21b9673..a0db763 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_MIBS_VERSION = 0.1.4
+PYTHON_PYSNMP_MIBS_VERSION = 0.1.6
 PYTHON_PYSNMP_MIBS_SOURCE = pysnmp-mibs-$(PYTHON_PYSNMP_MIBS_VERSION).tar.gz
-PYTHON_PYSNMP_MIBS_SITE = https://pypi.python.org/packages/source/p/pysnmp-mibs
+PYTHON_PYSNMP_MIBS_SITE = https://pypi.python.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
 PYTHON_PYSNMP_MIBS_SETUP_TYPE = setuptools
 PYTHON_PYSNMP_MIBS_LICENSE = BSD-3c
-PYTHON_PYSNMP_MIBS_LICENSE_FILES = LICENSE
+PYTHON_PYSNMP_MIBS_LICENSE_FILES = LICENSE.txt
 
 PYTHON_PYSNMP_MIBS_DEPENDENCIES = python-pysnmp
 
-- 
2.9.3
