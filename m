From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:19 -0500
Subject: [Buildroot] [PATCH 22/58] python-mako: bump to version 1.0.6
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-23-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index b6a74f3..6a64ec3 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/Mako/json, sha256 locally computed
-md5	c5fc31a323dd4990683d2f2da02d4e20	Mako-1.0.4.tar.gz
-sha256	fed99dbe4d0ddb27a33ee4910d8708aca9ef1fe854e668387a9ab9a90cbf9059	Mako-1.0.4.tar.gz
+# md5 from https://pypi.python.org/pypi/mako/json, sha256 locally computed
+md5 a28e22a339080316b2acc352b9ee631c Mako-1.0.6.tar.gz
+sha256 48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d Mako-1.0.6.tar.gz
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 88ce13e..0d06dc4 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.0.4
+PYTHON_MAKO_VERSION = 1.0.6
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://pypi.python.org/packages/7a/ae/925434246ee90b42e8ef57d3b30a0ab7caf9a2de3e449b876c56dcb48155
+PYTHON_MAKO_SITE = https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
-- 
2.9.3
