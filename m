From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Apr 2021 11:41:55 +0200
Subject: [Buildroot] [git commit] package/python-sqlalchemy: add CPE
 variables
Message-ID: <20210405092115.10A3E8D2F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=558bb6c8c1439b4de914c683a863f1de46913a4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:sqlalchemy:sqlalchemy is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asqlalchemy%3Asqlalchemy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
