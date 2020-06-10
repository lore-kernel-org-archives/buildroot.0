From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 11 Jun 2020 01:34:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/python-ifaddr: bump to version 0.1.7
Message-ID: <20200610233456.374430-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-ifaddr/python-ifaddr.hash | 8 ++++----
 package/python-ifaddr/python-ifaddr.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-ifaddr/python-ifaddr.hash b/package/python-ifaddr/python-ifaddr.hash
index 18df40ac4c..57b155caa5 100644
--- a/package/python-ifaddr/python-ifaddr.hash
+++ b/package/python-ifaddr/python-ifaddr.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ifaddr/json
-md5	cc1b7f0a587ef38491f07e50bf91d82e  ifaddr-0.1.6.tar.gz
-sha256	c19c64882a7ad51a394451dabcbbed72e98b5625ec1e79789924d5ea3e3ecb93  ifaddr-0.1.6.tar.gz
-# Locally calculated
-sha256	926c6fdac9ede91ae54c67066597466b04f9b4f956a24f9c77931e7765607b2c  setup.py
+md5  97c4eb7505643b5f1fe17733cb42abd9  ifaddr-0.1.7.tar.gz
+sha256  1f9e8a6ca6f16db5a37d3356f07b6e52344f6f9f7e806d618537731669eb1a94  ifaddr-0.1.7.tar.gz
+# Locally computed sha256 checksums
+sha256  8700856576ae2bc80c63bc970250510d9213fb02fed006d5f22742c9ddde24d7  LICENSE.txt
diff --git a/package/python-ifaddr/python-ifaddr.mk b/package/python-ifaddr/python-ifaddr.mk
index 23c4ee365e..f1154d9de8 100644
--- a/package/python-ifaddr/python-ifaddr.mk
+++ b/package/python-ifaddr/python-ifaddr.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_IFADDR_VERSION = 0.1.6
+PYTHON_IFADDR_VERSION = 0.1.7
 PYTHON_IFADDR_SOURCE = ifaddr-$(PYTHON_IFADDR_VERSION).tar.gz
-PYTHON_IFADDR_SITE = https://files.pythonhosted.org/packages/9f/54/d92bda685093ebc70e2057abfa83ef1b3fb0ae2b6357262a3e19dfe96bb8
+PYTHON_IFADDR_SITE = https://files.pythonhosted.org/packages/3d/fc/4ce147e3997cd0ea470ad27112087545cf83bf85015ddb3054673cb471bb
 PYTHON_IFADDR_SETUP_TYPE = setuptools
 PYTHON_IFADDR_LICENSE = MIT
-PYTHON_IFADDR_LICENSE_FILES = setup.py
+PYTHON_IFADDR_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
-- 
2.18.2
