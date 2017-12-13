From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:33:04 +0100
Subject: [Buildroot] [PATCH 05/11] package/python-pyasn-modules: switch SITE
 to https
In-Reply-To: <20171213053310.17578-1-bernd.kuhls@t-online.de>
References: <20171213053310.17578-1-bernd.kuhls@t-online.de>
Message-ID: <20171213053310.17578-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pyasn-modules/python-pyasn-modules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasn-modules/python-pyasn-modules.mk b/package/python-pyasn-modules/python-pyasn-modules.mk
index 4e8f9b9a68..b5e853aa2a 100644
--- a/package/python-pyasn-modules/python-pyasn-modules.mk
+++ b/package/python-pyasn-modules/python-pyasn-modules.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASN_MODULES_VERSION = 0.0.8
 PYTHON_PYASN_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN_MODULES_VERSION).tar.gz
-PYTHON_PYASN_MODULES_SITE = http://pypi.python.org/packages/source/p/pyasn1-modules
+PYTHON_PYASN_MODULES_SITE = https://pypi.python.org/packages/source/p/pyasn1-modules
 PYTHON_PYASN_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN_MODULES_LICENSE_FILES = LICENSE.txt
 PYTHON_PYASN_MODULES_SETUP_TYPE = setuptools
-- 
2.11.0
