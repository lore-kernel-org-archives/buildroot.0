From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:25:59 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version 19.3.0
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-2-asafka7@gmail.com>
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
index 206870d5ab..f8c38ee4ed 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5	d5a6ee80beaa072bd2b3bcb6fee0d508  attrs-19.2.0.tar.gz
-sha256	f913492e1663d3c36f502e5e9ba6cd13cf19d7fab50aa13239e420fef95e1396  attrs-19.2.0.tar.gz
+md5	5b2db50fcc31be34d32798183c9bd062  attrs-19.3.0.tar.gz
+sha256	f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72  attrs-19.3.0.tar.gz
 # Locally computer sha256
 sha256	bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 5bfb0802a0..72b280c333 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 19.2.0
+PYTHON_ATTRS_VERSION = 19.3.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/bd/69/2833f182ea95ea1f17e9a7559b8b92ebfdf4f68b5c58b15bc10f47bc2e01
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/98/c3/2c227e66b5e896e15ccdae2e00bbc69aa46e9a8ce8869cc5fa96310bf612
 PYTHON_ATTRS_SETUP_TYPE = setuptools
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.20.1
