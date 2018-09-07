From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  7 Sep 2018 21:36:47 +0300
Subject: [Buildroot] [PATCH 1/1] python-engineio: bump to version 2.2.0
Message-ID: <20180907183647.1166-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-engineio/python-engineio.hash | 9 +++++----
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index b2c0669bcc..484f6aaac3 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/python-engineio/json
-md5	9b0075dbbb25d7a302eba99dd9ba4af8  python-engineio-0.9.2.tar.gz
-# sha256 calculated by scanpypi
-sha256	c53282415ed9bc3cb4e7beafb2a1ce5c369af95dcf8f968061e5bc7572b60867  python-engineio-0.9.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/python-engineio/json
+md5	cf8868acedc242b30ad3d24060a8d8e1  python-engineio-2.2.0.tar.gz
+sha256	d35c50db73bf372f82975dc87f18f1cbfab7d5bed2dfc2553ae784579502a461  python-engineio-2.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 61d5da9aff..b222da38e9 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 0.9.2
-PYTHON_ENGINEIO_SITE = https://pypi.python.org/packages/c3/8f/0e066fc7a7029893b96b1d68a0cd5e75f6410f154fa4079b2be4991f5ae0
+PYTHON_ENGINEIO_VERSION = 2.2.0
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/07/09/682c70c33e727aac028fca7216bb0b6efcd276e67118d1df417f778a3af1
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.17.1
