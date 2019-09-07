From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 14:28:38 +0200
Subject: [Buildroot] [git commit] package/python-enum: bump to version 0.4.7
Message-ID: <20190907122436.3A7038B768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=866dc545faf433abfec771798c80254c0ef44d3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-enum/python-enum.hash | 8 +++++---
 package/python-enum/python-enum.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-enum/python-enum.hash b/package/python-enum/python-enum.hash
index 6f1daa0b6c..4b4b369e34 100644
--- a/package/python-enum/python-enum.hash
+++ b/package/python-enum/python-enum.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/enum/json, sha256 locally computed
-md5 173d468112cfa13a149b2c8af3e8fd52 enum-0.4.6.tar.gz
-sha256 54e78526b166982b36884613f35a76d9a6711c49810d3ec1a05b10c9b31f938e enum-0.4.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/enum/json
+md5 e7d170e3f84435b77058de625c96ef58 enum-0.4.7.tar.gz
+sha256 8c7cf3587eda51008bcc1eed99ea2c331ccd265c231dbaa95ec5258d3dc03100 enum-0.4.7.tar.gz
+# Locally computed sha256 checksums
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL-3
diff --git a/package/python-enum/python-enum.mk b/package/python-enum/python-enum.mk
index ea602e44a9..f1de8a9312 100644
--- a/package/python-enum/python-enum.mk
+++ b/package/python-enum/python-enum.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENUM_VERSION = 0.4.6
+PYTHON_ENUM_VERSION = 0.4.7
 PYTHON_ENUM_SOURCE = enum-$(PYTHON_ENUM_VERSION).tar.gz
-PYTHON_ENUM_SITE = https://pypi.python.org/packages/0c/4e/1ea357e7783c756bb579333c1e4a026fb331371ee771f616ffedc781e531
+PYTHON_ENUM_SITE = https://files.pythonhosted.org/packages/02/a0/32e1d5a21b703f600183e205aafc6773577e16429af5ad3c3f9b956b07ca
 PYTHON_ENUM_SETUP_TYPE = setuptools
 PYTHON_ENUM_LICENSE = GPL-3.0+
 PYTHON_ENUM_LICENSE_FILES = LICENSE.GPL-3
