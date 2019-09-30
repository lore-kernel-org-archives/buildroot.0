From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:55 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-tinyrpc: bump to version
 1.0.3
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-29-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-tinyrpc/python-tinyrpc.hash | 4 ++--
 package/python-tinyrpc/python-tinyrpc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tinyrpc/python-tinyrpc.hash b/package/python-tinyrpc/python-tinyrpc.hash
index dcaa479866..d01575c11c 100644
--- a/package/python-tinyrpc/python-tinyrpc.hash
+++ b/package/python-tinyrpc/python-tinyrpc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinyrpc/json
-md5	ee8fd20fb4879d4ec96500e50333b6cf  tinyrpc-1.0.1.tar.gz
-sha256	4572c9d63b056b5eb24bae5e0894115fe6b5c3fa314851d9df439c7d3f8e9d2b  tinyrpc-1.0.1.tar.gz
+md5	b3a95133c65c7b5b5eb4f88c4713e909  tinyrpc-1.0.3.tar.gz
+sha256	aa9f707a26cea5fd69af55fea28e8761f96b244e00efe3c8ccbeb233d5a9852e  tinyrpc-1.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256	587f1ea174824613f4a7e0d7fb95fda000a7f58ca17df12416e014c9ee82e619  LICENSE
diff --git a/package/python-tinyrpc/python-tinyrpc.mk b/package/python-tinyrpc/python-tinyrpc.mk
index 9ab039f955..d589936d88 100644
--- a/package/python-tinyrpc/python-tinyrpc.mk
+++ b/package/python-tinyrpc/python-tinyrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYRPC_VERSION = 1.0.1
+PYTHON_TINYRPC_VERSION = 1.0.3
 PYTHON_TINYRPC_SOURCE = tinyrpc-$(PYTHON_TINYRPC_VERSION).tar.gz
-PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/1f/f9/d2f9aa8238fc4f3f92e3912b3768c67e3b74257fdf47da2db391354be285
+PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/21/7a/ff1a74256e1bcc04fbaa414c13a2bb79a29ac9918b25f2238592b991e3bc
 PYTHON_TINYRPC_SETUP_TYPE = setuptools
 PYTHON_TINYRPC_LICENSE = MIT
 PYTHON_TINYRPC_LICENSE_FILES = LICENSE
-- 
2.20.1
