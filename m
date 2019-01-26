From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 26 Jan 2019 08:33:13 +0200
Subject: [Buildroot] [PATCH 1/1] python-msgpack: bump to version 0.6.1
In-Reply-To: <20190126063316.10832-1-asafka7@gmail.com>
References: <20190126063316.10832-1-asafka7@gmail.com>
Message-ID: <20190126063316.10832-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 98027009ad..cb3b75d5f7 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5	be3043cc2c1e3b5ebf08463ffa71cf17  msgpack-0.6.0.tar.gz
-sha256	64abc6bf3a2ac301702f5760f4e6e227d0fd4d84d9014ef9a40faa9d43365259  msgpack-0.6.0.tar.gz
+md5	1b96537be6f5186fed0d131aaa59ef26  msgpack-0.6.1.tar.gz
+sha256	4008c72f5ef2b7936447dcb83db41d97e9791c83221be13d5e19db0796df1972  msgpack-0.6.1.tar.gz
 # Locally computed sha256
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 8bbae9283d..517166db63 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 0.6.0
+PYTHON_MSGPACK_VERSION = 0.6.1
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/3a/bb/dc3f9fc608a6c1c7a471c2bebc761d9c8dbb2f7179a4283a89b9451765b5
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/81/9c/0036c66234482044070836cc622266839e2412f8108849ab0bfdeaab8578
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.19.1
