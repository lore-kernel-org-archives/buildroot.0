From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 28 Sep 2018 17:37:45 +0300
Subject: [Buildroot] [PATCH 1/1] python-engineio: bump to version 2.3.0
Message-ID: <20180928143745.30085-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 484f6aaac3..37c34dff16 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	cf8868acedc242b30ad3d24060a8d8e1  python-engineio-2.2.0.tar.gz
-sha256	d35c50db73bf372f82975dc87f18f1cbfab7d5bed2dfc2553ae784579502a461  python-engineio-2.2.0.tar.gz
+md5	d281583ae81bcaa4acc4bd6fd4faab86  python-engineio-2.3.0.tar.gz
+sha256	eb4d28b7c6ae053f7ed50e688011b228ce8354dfdbf032220b76b3fc20d5f943  python-engineio-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index b222da38e9..bf674d767b 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 2.2.0
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/07/09/682c70c33e727aac028fca7216bb0b6efcd276e67118d1df417f778a3af1
+PYTHON_ENGINEIO_VERSION = 2.3.0
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/f1/6f/3b872dce14b381b2724d33cf9133c6d3e599f1e85e1f8ab75b01d243bf9e
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.17.1
