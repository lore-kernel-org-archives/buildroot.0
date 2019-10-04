From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:19 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pygments: bump to version
 2.4.2
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-13-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pygments/python-pygments.hash | 8 +++++---
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 525aa0e2d1..ad3604ee54 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pygments/json, sha256 locally computed
-md5 13037baca42f16917cbd5ad2fab50844 Pygments-2.2.0.tar.gz
-sha256 dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc Pygments-2.2.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pygments/json
+md5	5ecc3fbb2a783e917b369271fc0e6cd1  Pygments-2.4.2.tar.gz
+sha256	881c4c157e45f30af185c1ffe8d549d48ac9127433f2c380c24b84572ad66297  Pygments-2.4.2.tar.gz
+# Locally computed sha256 checksums
+sha256	45b88d3449c37806594758bf3c484d9d98b12b1ecc163f65431fe07fea6025f0  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 6e7eae69c3..5d190c4990 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.2.0
+PYTHON_PYGMENTS_VERSION = 2.4.2
 PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://pypi.python.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/7e/ae/26808275fc76bf2832deb10d3a3ed3107bc4de01b85dcccbe525f2cd6d1e
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_SETUP_TYPE = setuptools
-- 
2.20.1
