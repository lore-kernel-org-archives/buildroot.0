From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 11:31:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: add CPE variables
Message-ID: <20210405093150.3530909-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:sqlalchemy:sqlalchemy is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asqlalchemy%3Asqlalchemy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 3886e49765..d6829853fc 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -10,5 +10,7 @@ PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/14/0e/487f7fc1e
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
+PYTHON_SQLALCHEMY_CPE_ID_VENDOR = sqlalchemy
+PYTHON_SQLALCHEMY_CPE_ID_PRODUCT = sqlalchemy
 
 $(eval $(python-package))
-- 
2.30.2
