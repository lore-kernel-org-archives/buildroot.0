From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 19 Oct 2019 17:59:36 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-flask-cors: bump to version
 3.0.8
In-Reply-To: <20191019145937.30732-1-asafka7@gmail.com>
References: <20191019145937.30732-1-asafka7@gmail.com>
Message-ID: <20191019145937.30732-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-flask-cors/python-flask-cors.hash | 7 ++++---
 package/python-flask-cors/python-flask-cors.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 5a8256ef97..a893b7c890 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/flask-cors/json, sha256 locally computed
-md5	ddc12bdf8fa19a4ce1504ab9d0b0a8bc  Flask-Cors-3.0.3.tar.gz
-sha256	62ebc5ad80dc21ca0ea9f57466c2c74e24a62274af890b391790c260eb7b754b  Flask-Cors-3.0.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/flask-cors/json
+md5	551cc4c0305a171d28caa2b3bc838867  Flask-Cors-3.0.8.tar.gz
+sha256	72170423eb4612f0847318afff8c247b38bd516b7737adfc10d1c2cdbb382d16  Flask-Cors-3.0.8.tar.gz
+# Locally computed sha256 checksums
 sha256	6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index 6d5900b486..60454e27c4 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 3.0.3
+PYTHON_FLASK_CORS_VERSION = 3.0.8
 PYTHON_FLASK_CORS_SOURCE = Flask-Cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://pypi.python.org/packages/64/e8/e6bcf79dcad7b7c10f8c8c35d78b5710f2ddcd8ed38e607dd6a4853ab8a8
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/9e/11/ca8b95c5bf9644471601e425f0de8cbd09a506bb6c24842cb17a6cd1eea8
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
-- 
2.20.1
