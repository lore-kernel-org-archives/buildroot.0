From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 16 Nov 2019 07:24:41 -0600
Subject: [Buildroot] [next] package/python-tinyrpc: bump to 1.0.4
Message-ID: <20191116132441.24983-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/python-tinyrpc/python-tinyrpc.hash | 5 ++---
 package/python-tinyrpc/python-tinyrpc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-tinyrpc/python-tinyrpc.hash b/package/python-tinyrpc/python-tinyrpc.hash
index d01575c11c..b4bc7ae863 100644
--- a/package/python-tinyrpc/python-tinyrpc.hash
+++ b/package/python-tinyrpc/python-tinyrpc.hash
@@ -1,5 +1,4 @@
 # md5, sha256 from https://pypi.org/pypi/tinyrpc/json
-md5	b3a95133c65c7b5b5eb4f88c4713e909  tinyrpc-1.0.3.tar.gz
-sha256	aa9f707a26cea5fd69af55fea28e8761f96b244e00efe3c8ccbeb233d5a9852e  tinyrpc-1.0.3.tar.gz
-# Locally computed sha256 checksums
+sha256	4b41fab967fb1c978f573bf0d609a3b12cc3b6ed62bd3108f43f575563746396  tinyrpc-1.0.4.tar.gz
+md5	cd61e3cbc01ea940abc97d3a87abf4a7  tinyrpc-1.0.4.tar.gz
 sha256	587f1ea174824613f4a7e0d7fb95fda000a7f58ca17df12416e014c9ee82e619  LICENSE
diff --git a/package/python-tinyrpc/python-tinyrpc.mk b/package/python-tinyrpc/python-tinyrpc.mk
index d589936d88..0ac0470f74 100644
--- a/package/python-tinyrpc/python-tinyrpc.mk
+++ b/package/python-tinyrpc/python-tinyrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYRPC_VERSION = 1.0.3
+PYTHON_TINYRPC_VERSION = 1.0.4
 PYTHON_TINYRPC_SOURCE = tinyrpc-$(PYTHON_TINYRPC_VERSION).tar.gz
-PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/21/7a/ff1a74256e1bcc04fbaa414c13a2bb79a29ac9918b25f2238592b991e3bc
+PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/9d/91/c639ba014aada92446516c5fc4b04f2cee3539ab2d0758a6a87a6da973cb
 PYTHON_TINYRPC_SETUP_TYPE = setuptools
 PYTHON_TINYRPC_LICENSE = MIT
 PYTHON_TINYRPC_LICENSE_FILES = LICENSE
-- 
2.17.1
