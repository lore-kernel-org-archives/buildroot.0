From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:29 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version 19.1.0
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 23a5efd584..e05d427bd4 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5	44700294787c8018858777fc150e5d40  attrs-18.2.0.tar.gz
-sha256	10cbf6e27dbce8c30807caf056c8eb50917e0eaafe86347671b57254006c3e69  attrs-18.2.0.tar.gz
+md5	2be7bce157988928f5ff2bb50a0b510d  attrs-19.1.0.tar.gz
+sha256	f0b870f674851ecbfbbbd364d6b5cbdff9dcedbc7f3f5e18a6891057f21fe399  attrs-19.1.0.tar.gz
 # Locally computer sha256
 sha256	bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 9fbee2d349..97a6874092 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 18.2.0
+PYTHON_ATTRS_VERSION = 19.1.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/0f/9e/26b1d194aab960063b266170e53c39f73ea0d0d3f5ce23313e0ec8ee9bdf
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/cc/d9/931a24cc5394f19383fbbe3e1147a0291276afa43a0dc3ed0d6cd9fda813
 PYTHON_ATTRS_SETUP_TYPE = setuptools
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.20.1
