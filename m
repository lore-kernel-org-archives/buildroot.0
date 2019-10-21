From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:10:10 +0200
Subject: [Buildroot] [git commit] package/python-flask-sqlalchemy: bump to
 version 2.4.1
Message-ID: <20191021170447.6822A8363F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08a794b5b4b8ece4e0bc5992d98ce40c1fcb5add
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License is provided with the tarball, so there's no need to
use PKG-INFO.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash | 9 +++++----
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk   | 8 ++++----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
index ad7f0e1a45..f1fe9775f5 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/Flask-SQLAlchemy/json, sha256 locally computed
-md5    01e943d6a8b492c2bc6031c024cd10be  Flask-SQLAlchemy-2.4.0.tar.gz
-sha256 0c9609b0d72871c540a7945ea559c8fdf5455192d2db67219509aed680a3d45a  Flask-SQLAlchemy-2.4.0.tar.gz
-sha256 5de187ec76e2d9dfc829fccad94ac0e5e810ddeccf8c8b50784918e4f12f14c4  PKG-INFO
+# md5, sha256 from https://pypi.org/pypi/flask-sqlalchemy/json
+md5	1f5781cf3e1a2b1aabda47a5b20d2073  Flask-SQLAlchemy-2.4.1.tar.gz
+sha256	6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d  Flask-SQLAlchemy-2.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256	489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
index 570fced04a..c6d0094b41 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SQLALCHEMY_VERSION = 2.4.0
+PYTHON_FLASK_SQLALCHEMY_VERSION = 2.4.1
 PYTHON_FLASK_SQLALCHEMY_SOURCE = Flask-SQLAlchemy-$(PYTHON_FLASK_SQLALCHEMY_VERSION).tar.gz
-PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/9b/62/80a56f9d223f0b89cdcf7d592455375f8c9d73866f337fa85f39f45fe0c5
+PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/52/7a/35bacbedafdc652d5198b80eb22eacccae0c97a49740a45da828b05cc37b
 PYTHON_FLASK_SQLALCHEMY_SETUP_TYPE = setuptools
-PYTHON_FLASK_SQLALCHEMY_LICENSE = BSD-3c
-PYTHON_FLASK_SQLALCHEMY_LICENSE_FILES = PKG-INFO
+PYTHON_FLASK_SQLALCHEMY_LICENSE = BSD-3-Clause
+PYTHON_FLASK_SQLALCHEMY_LICENSE_FILES = LICENSE.rst
 
 $(eval $(python-package))
