From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 26 Sep 2018 18:34:55 +0300
Subject: [Buildroot] [PATCH 13/23] python-sortedcontainers: bump to version
 2.0.5
In-Reply-To: <20180926153505.3411-1-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
Message-ID: <20180926153505.3411-14-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 .../python-sortedcontainers/python-sortedcontainers.hash  | 8 +++++---
 .../python-sortedcontainers/python-sortedcontainers.mk    | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-sortedcontainers/python-sortedcontainers.hash b/package/python-sortedcontainers/python-sortedcontainers.hash
index 11fa076601..c68d78a176 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.hash
+++ b/package/python-sortedcontainers/python-sortedcontainers.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/sortedcontainers/json, sha256 locally computed
-md5	ad4f00e377ad934954ac90fcac0b185f  sortedcontainers-1.5.7.tar.gz
-sha256	0ff0442865e492bc50476b18000fb8400cf2472d14d21a92b27cd7c5184550ea  sortedcontainers-1.5.7.tar.gz
+# md5, sha256 from https://pypi.org/pypi/sortedcontainers/json
+md5	5f079b1131d8b1a3ed025e7e679b1497  sortedcontainers-2.0.5.tar.gz
+sha256	b74f2756fb5e23512572cc76f0fe0832fd86310f77dfee54335a35fb33f6b950  sortedcontainers-2.0.5.tar.gz
+# Locally computed sha256 checksums
+sha256	7dcf4a5137118a925727b8a1690bc6ea70b156ee6739dbb51fd4d386718d6ce5  LICENSE
diff --git a/package/python-sortedcontainers/python-sortedcontainers.mk b/package/python-sortedcontainers/python-sortedcontainers.mk
index 99606816ab..c32f9e4047 100644
--- a/package/python-sortedcontainers/python-sortedcontainers.mk
+++ b/package/python-sortedcontainers/python-sortedcontainers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SORTEDCONTAINERS_VERSION = 1.5.7
+PYTHON_SORTEDCONTAINERS_VERSION = 2.0.5
 PYTHON_SORTEDCONTAINERS_SOURCE = sortedcontainers-$(PYTHON_SORTEDCONTAINERS_VERSION).tar.gz
-PYTHON_SORTEDCONTAINERS_SITE = https://pypi.python.org/packages/8d/aa/5369362d730728639ba434318df26b5c554804578d1c48381367ea5377c6
+PYTHON_SORTEDCONTAINERS_SITE = https://files.pythonhosted.org/packages/b9/30/accbf5c09c5fa25a3d5f762761e0d7ece6fdb12f2a9c43b840f73cef43ef
 PYTHON_SORTEDCONTAINERS_SETUP_TYPE = setuptools
 PYTHON_SORTEDCONTAINERS_LICENSE = Apache-2.0
 PYTHON_SORTEDCONTAINERS_LICENSE_FILES = LICENSE
-- 
2.17.1
