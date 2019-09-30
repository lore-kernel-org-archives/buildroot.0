From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:45 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-mistune: bump to version
 0.8.4
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-19-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-mistune/python-mistune.hash | 7 ++++---
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index e939aefc86..f545308f4b 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/mistune/json, sha256 locally computed
-md5	8bd955fe74ce37af54b16c0d9b89a2ef  mistune-0.8.tar.gz
-sha256	dc3f43e7cf0abb95cdfecbf82d85c419108d5f13e1844b2a8a2fc0abf24c7a47  mistune-0.8.tar.gz
+# md5, sha256 from https://pypi.org/pypi/mistune/json
+md5	fb6ab174ece938dea09f8b2adad771e4  mistune-0.8.4.tar.gz
+sha256	59a3429db53c50b5c6bcc8a07f8848cb00d7dc8bdb431a4ab41920d201d4756e  mistune-0.8.4.tar.gz
+# Locally computed sha256 checksums
 sha256  0c5259c3dd0a7c46f4835221645f62a0638c9b9faa02af08676e8069e1ff964b  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index 405216ccb4..6beb425837 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 0.8
+PYTHON_MISTUNE_VERSION = 0.8.4
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://pypi.python.org/packages/d3/66/a45d1c7c50fd63a707cd1bd340b969523137c5284d9466c41012fe54c621
+PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/2d/a4/509f6e7783ddd35482feda27bc7f72e65b5e7dc910eca4ab2164daf9c577
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
-- 
2.20.1
