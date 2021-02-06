From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 10:59:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-flask-cors: bump to version
 3.0.10
Message-ID: <20210206095939.1789045-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/corydolphin/flask-cors/releases/tag/3.0.10

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-flask-cors/python-flask-cors.hash | 5 +++--
 package/python-flask-cors/python-flask-cors.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 15b7d41a32..94ec262db8 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/flask-cors/json
-sha256  6bcfc100288c5d1bcb1dbb854babd59beee622ffd321e444b05f24d6d58466b8  Flask-Cors-3.0.9.tar.gz
+# md5, sha256 from https://pypi.org/pypi/flask-cors/json
+md5  647ff0632b960ba063a077fb4063077e  Flask-Cors-3.0.10.tar.gz
+sha256  b60839393f3b84a0f3746f6cdca56c1ad7426aa738b70d6c61375857823181de  Flask-Cors-3.0.10.tar.gz
 # Locally computed sha256 checksums
 sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index a057cd458e..d600157263 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 3.0.9
+PYTHON_FLASK_CORS_VERSION = 3.0.10
 PYTHON_FLASK_CORS_SOURCE = Flask-Cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/99/fc/cd117ea122e28037a5ec60356a7ffae8b77af527713f7b5e4eb63089f669
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/cf/25/e3b2553d22ed542be807739556c69621ad2ab276ae8d5d2560f4ed20f652
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
-- 
2.29.2
