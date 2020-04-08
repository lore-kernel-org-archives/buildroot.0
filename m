From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  8 Apr 2020 22:48:28 +0200
Subject: [Buildroot] [PATCH v1 5/5] package/python-flask-login: bump version
 to 0.5.0
In-Reply-To: <20200408204828.998-1-ps.report@gmx.net>
References: <20200408204828.998-1-ps.report@gmx.net>
Message-ID: <20200408204828.998-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-flask-login/python-flask-login.hash | 10 +++++-----
 package/python-flask-login/python-flask-login.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-flask-login/python-flask-login.hash b/package/python-flask-login/python-flask-login.hash
index 75dbe30c7a..9ff1f82a09 100644
--- a/package/python-flask-login/python-flask-login.hash
+++ b/package/python-flask-login/python-flask-login.hash
@@ -1,6 +1,6 @@
-# from https://pypi.python.org/pypi/flask_login/json
-md5 25b34c74bd509792f291c16e184225df Flask-Login-0.4.1.tar.gz
-sha256 c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec Flask-Login-0.4.1.tar.gz
+# From https://pypi.org/project/Flask-Login/#copy-hash-modal-8bb2ac58-b80a-4793-84d4-4f32b92976d9
+md5  a2d94aa6ae935345ebc68eb3cbb5fccd  Flask-Login-0.5.0.tar.gz
+sha256  6d33aef15b5bcead780acc339464aae8a6e28f13c90d8b1cf9de8b549d1c0b4b  Flask-Login-0.5.0.tar.gz
 
-# Locally computed
-sha256 7a9dfb9c5da204ed1370f3b62c13e2992a12da1da707f47e156897eeb4344e5b LICENSE
+# License files
+sha256  7a9dfb9c5da204ed1370f3b62c13e2992a12da1da707f47e156897eeb4344e5b  LICENSE
diff --git a/package/python-flask-login/python-flask-login.mk b/package/python-flask-login/python-flask-login.mk
index f81a4cdffe..efb63b262b 100644
--- a/package/python-flask-login/python-flask-login.mk
+++ b/package/python-flask-login/python-flask-login.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_LOGIN_VERSION = 0.4.1
+PYTHON_FLASK_LOGIN_VERSION = 0.5.0
 PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_LOGIN_VERSION).tar.gz
-PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/c1/ff/bd9a4d2d81bf0c07d9e53e8cd3d675c56553719bbefd372df69bf1b3c1e4
+PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/f9/01/f6c0a3a654ca125cf9cd273314c03a8bc6a47bf861765c8c1d375e15a28d
 PYTHON_FLASK_LOGIN_LICENSE = MIT
 PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
 PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools
-- 
2.26.0
