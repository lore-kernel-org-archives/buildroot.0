From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:50 -0500
Subject: [Buildroot] [PATCH 53/58] python-twisted: bump to version 17.1.0
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-54-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index cc78a4c..360e16d 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/twisted/json, sha256 locally computed
-md5	54a88ffe773d5a83c91fcfe86044b094  Twisted-16.6.0.tar.bz2
-sha256	d0fe115ea7ef8cf632d05103de60356c6e992b2153d6830bdc4476f8accb1fca  Twisted-16.6.0.tar.bz2
+md5 5b4b9ea5a480bec9c1449ffb57b2052a Twisted-17.1.0.tar.bz2
+sha256 dbf211d70afe5b4442e3933ff01859533eba9f13d8b3e2e1b97dc2125e2d44dc Twisted-17.1.0.tar.bz2
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 29fe735..b167a0f 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 16.6.0
+PYTHON_TWISTED_VERSION = 17.1.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://pypi.python.org/packages/dc/c0/a0114a6d7fa211c0904b0de931e8cafb5210ad824996cc6a9d67f3bae22c
+PYTHON_TWISTED_SITE = https://pypi.python.org/packages/d2/5d/ed5071740be94da625535f4333793d6fd238f9012f0fee189d0c5d00bd74
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.9.3
