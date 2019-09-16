From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 16 Sep 2019 09:19:55 +0200
Subject: [Buildroot] [PATCH 1/1] python-flask-login: bump to version 0.4.1
Message-ID: <20190916071955.26259-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/python-flask-login/python-flask-login.hash | 6 +++---
 package/python-flask-login/python-flask-login.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-login/python-flask-login.hash b/package/python-flask-login/python-flask-login.hash
index cd73b3ff6c..909c3079cc 100644
--- a/package/python-flask-login/python-flask-login.hash
+++ b/package/python-flask-login/python-flask-login.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/flask_login/json, sha256 locally computed
-md5 e050efaa2c4dbc2d97f480a70f4d44aa Flask-Login-0.4.0.tar.gz
-sha256 d25e356b14a59f52da0ab30c31c2ad285fa23a840f0f6971df7ed247c77082a7 Flask-Login-0.4.0.tar.gz
+# from https://pypi.python.org/pypi/flask_login/json
+md5 25b34c74bd509792f291c16e184225df Flask-Login-0.4.1.tar.gz
+sha256 c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec Flask-Login-0.4.1.tar.gz
diff --git a/package/python-flask-login/python-flask-login.mk b/package/python-flask-login/python-flask-login.mk
index 50374130db..f81a4cdffe 100644
--- a/package/python-flask-login/python-flask-login.mk
+++ b/package/python-flask-login/python-flask-login.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_LOGIN_VERSION = 0.4.0
+PYTHON_FLASK_LOGIN_VERSION = 0.4.1
 PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_LOGIN_VERSION).tar.gz
-PYTHON_FLASK_LOGIN_SITE = https://pypi.python.org/packages/70/96/20cae731ef27084dcb183f3a6e3073d0232f10c1fd7be76729bd7bd4b994
+PYTHON_FLASK_LOGIN_SITE = https://files.pythonhosted.org/packages/c1/ff/bd9a4d2d81bf0c07d9e53e8cd3d675c56553719bbefd372df69bf1b3c1e4
 PYTHON_FLASK_LOGIN_LICENSE = MIT
 PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
 PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools
-- 
2.21.0
