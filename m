From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:11 -0500
Subject: [Buildroot] [PATCH 14/58] python-flask-login: bump to version 0.4.0
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-15-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-flask-login/python-flask-login.hash | 6 +++---
 package/python-flask-login/python-flask-login.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-login/python-flask-login.hash b/package/python-flask-login/python-flask-login.hash
index c488a35..cd73b3f 100644
--- a/package/python-flask-login/python-flask-login.hash
+++ b/package/python-flask-login/python-flask-login.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/Flask-Login/0.3.2, sha256 locally computed:
-md5    d95c2275d3e1c755145910077366dc45                                 Flask-Login-0.3.2.tar.gz
-sha256 e72eff5c35e5a31db1aeca1db5d2501be702674ea88e8f223b5d2b11644beee6 Flask-Login-0.3.2.tar.gz
+# md5 from https://pypi.python.org/pypi/flask_login/json, sha256 locally computed
+md5 e050efaa2c4dbc2d97f480a70f4d44aa Flask-Login-0.4.0.tar.gz
+sha256 d25e356b14a59f52da0ab30c31c2ad285fa23a840f0f6971df7ed247c77082a7 Flask-Login-0.4.0.tar.gz
diff --git a/package/python-flask-login/python-flask-login.mk b/package/python-flask-login/python-flask-login.mk
index aa6d8e3..5037413 100644
--- a/package/python-flask-login/python-flask-login.mk
+++ b/package/python-flask-login/python-flask-login.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_LOGIN_VERSION = 0.3.2
+PYTHON_FLASK_LOGIN_VERSION = 0.4.0
 PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_LOGIN_VERSION).tar.gz
-PYTHON_FLASK_LOGIN_SITE = http://pypi.python.org/packages/source/F/Flask-Login
+PYTHON_FLASK_LOGIN_SITE = https://pypi.python.org/packages/70/96/20cae731ef27084dcb183f3a6e3073d0232f10c1fd7be76729bd7bd4b994
 PYTHON_FLASK_LOGIN_LICENSE = MIT
 PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
 PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools
-- 
2.9.3
