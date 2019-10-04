From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:28 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.0.3
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-22-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 18560b17ce..2aec0144e6 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5	63a26fdd0bf1154d4a5e9144b7028dd0  tornado-6.0.1.tar.gz
-sha256	de274c65f45f6656c375cdf1759dbf0bc52902a1e999d12a35eb13020a641a53  tornado-6.0.1.tar.gz
+md5	cab4b11480f6d032e46465586192d343  tornado-6.0.3.tar.gz
+sha256	c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9  tornado-6.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index fe65d7516e..e326fadcb5 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.0.1
+PYTHON_TORNADO_VERSION = 6.0.3
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://pypi.python.org/packages/b1/7f/8109821ff9df1bf3519169e34646705c32ac13be6a4d51a79ed57f47686e
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/30/78/2d2823598496127b21423baffaa186b668f73cd91887fcef78b6eade136b
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_SETUP_TYPE = setuptools
-- 
2.20.1
