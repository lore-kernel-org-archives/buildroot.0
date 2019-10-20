From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 20 Oct 2019 22:01:41 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-flask: bump version to 1.1.1
Message-ID: <20191020190142.18672-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE was renamed to LICENSE.rst with little rephrasing.
In addition, statements about the documentation licensing were
moved from LICENSE to docs/license.rst so this file was added
to _LICENSE_FILES (plus hash).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-flask/python-flask.hash | 10 ++++++----
 package/python-flask/python-flask.mk   |  6 +++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 4b34ea82a0..24f68c6605 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,4 +1,6 @@
-# md5 from https://pypi.python.org/pypi/Flask/json, sha256 locally computed
-md5	824f0f20aae1f44c9c7dc4054adb7969  Flask-1.0.2.tar.gz
-sha256	2271c0070dbcb5275fad4a82e29f23ab92682dc45f9dfbc22c02ba9b9322ce48  Flask-1.0.2.tar.gz
-sha256	ce2117037008b9a8949f5a9ee1c7755f10844964d8ae4e138cded06f4e89de5f  LICENSE
+# md5, sha256 from https://pypi.org/pypi/flask/json
+md5	0e3ed44ece1c489ed835d1b7047e349c  Flask-1.1.1.tar.gz
+sha256	13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52  Flask-1.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
+sha256	0ef3ae025f4a398761079f0d687ff3d66f4fef3a32ac2607318e909c0cba9150  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 344eba5edb..0cd1a18018 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 1.0.2
+PYTHON_FLASK_VERSION = 1.1.1
 PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4b/12/c1fbf4971fda0e4de05565694c9f0c92646223cff53f15b6eb248a310a62
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/2e/80/3726a729de758513fd3dbc64e93098eb009c49305a97c6751de55b20b694
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3-Clause
-PYTHON_FLASK_LICENSE_FILES = LICENSE
+PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
 
 $(eval $(python-package))
-- 
2.20.1
