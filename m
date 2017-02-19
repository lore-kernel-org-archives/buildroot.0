From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:31 -0500
Subject: [Buildroot] [PATCH 34/58] python-pycparser: bump to version 2.17
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-35-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-pycparser/python-pycparser.hash | 6 +++---
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index a87bfd4..25747c3 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=a2bc8d28c923b4fe2b2c3b4b51a4f935, sha256 locally computed
-md5     a2bc8d28c923b4fe2b2c3b4b51a4f935  pycparser-2.14.tar.gz
-sha256  7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73  pycparser-2.14.tar.gz
+# md5 from https://pypi.python.org/pypi/pycparser/json, sha256 locally computed
+md5 ca98dcb50bc1276f230118f6af5a40c7 pycparser-2.17.tar.gz
+sha256 0aac31e917c24cb3357f5a4d5566f2cc91a19ca41862f6c3c22dc60a629673b6 pycparser-2.17.tar.gz
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index a32f1aa..e66c80b 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCPARSER_VERSION = 2.14
+PYTHON_PYCPARSER_VERSION = 2.17
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://pypi.python.org/packages/source/p/pycparser
+PYTHON_PYCPARSER_SITE = https://pypi.python.org/packages/be/64/1bb257ffb17d01f4a38d7ce686809a736837ad4371bcc5c42ba7a715c3ac
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3c
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
-- 
2.9.3
