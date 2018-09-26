From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 26 Sep 2018 18:34:57 +0300
Subject: [Buildroot] [PATCH 15/23] python-txtorcon: bump to version 18.0.2
In-Reply-To: <20180926153505.3411-1-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
Message-ID: <20180926153505.3411-16-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-txtorcon/python-txtorcon.hash | 9 +++++----
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index 71a2ec508f..ca43be5e7f 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/txtorcon/json, sha256 locally computed
-md5	4d7380fa7e721c77cac103d971882374  txtorcon-0.19.3.tar.gz
-sha256	f73396667909a3c7a98f4dd865edf4ed6a2518ee5a935d92e18b8a479ec244fd  txtorcon-0.19.3.tar.gz
-sha256	3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
+# md5, sha256 from https://pypi.org/pypi/txtorcon/json
+md5    76ca73a069947726216477c8da75f798  txtorcon-18.0.2.tar.gz
+sha256 ce50fdd00abb8b490b72809a2c664684f67f3c9467f392642d36f58309395a87  txtorcon-18.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256 3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index f75f50438e..596a2da063 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 0.19.3
+PYTHON_TXTORCON_VERSION = 18.0.2
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://pypi.python.org/packages/05/4b/d2fbfdc08ab83c299f2ad22ba38ea35f71f1c966684f5754e079108a1f64
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/0d/cf/d60e12055c2930aa5a347043423e59e29241d03fd1f2316d1dea08db383a
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
-- 
2.17.1
