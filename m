From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  8 Oct 2019 07:37:19 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp-apps: update license
 to BSD-2-Clause
Message-ID: <20191008043719.8301-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license file for this application is BSD-2-Clause and not
BSD-3-Clause as we currently state in the _LICENSE variable.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pysnmp-apps/python-pysnmp-apps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.mk b/package/python-pysnmp-apps/python-pysnmp-apps.mk
index ee494eba0f..70d63834cb 100644
--- a/package/python-pysnmp-apps/python-pysnmp-apps.mk
+++ b/package/python-pysnmp-apps/python-pysnmp-apps.mk
@@ -8,7 +8,7 @@ PYTHON_PYSNMP_APPS_VERSION = 0.5.3
 PYTHON_PYSNMP_APPS_SOURCE = pysnmp-apps-$(PYTHON_PYSNMP_APPS_VERSION).tar.gz
 PYTHON_PYSNMP_APPS_SITE = https://files.pythonhosted.org/packages/c2/1a/26f5f3732df2c7d34663a7f2fa6534b5b4ffae73a4a440b75864ec826ba6
 PYTHON_PYSNMP_APPS_SETUP_TYPE = setuptools
-PYTHON_PYSNMP_APPS_LICENSE = BSD-3-Clause
+PYTHON_PYSNMP_APPS_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_APPS_LICENSE_FILES = LICENSE.txt
 PYTHON_PYSNMP_APPS_DEPENDENCIES = python-pysnmp
 
-- 
2.20.1
