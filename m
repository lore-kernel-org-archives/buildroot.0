From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:54 +0200
Subject: [Buildroot] [git commit] package/python-pyparsing: bump version to
	2.1.9
Message-ID: <20161005210758.E14F381916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=678b9a6d0e78ceb8712e0f7b2c77e5623e28c80f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyparsing/python-pyparsing.hash | 6 +++---
 package/python-pyparsing/python-pyparsing.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 93a0845..6cf686a 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/pyparsing/2.0.3, sha256 locally computed
-md5	0fe479be09fc2cf005f753d3acc35939  pyparsing-2.0.3.tar.gz
-sha256  06e729e1cbf5274703b1f47b6135ed8335999d547f9d8cf048b210fb8ebf844f  pyparsing-2.0.3.tar.gz
+# md5 from https://pypi.python.org/pypi/pyparsing/json, sha256 locally computed
+md5	ee943c354eac79526533c58342f322c7  pyparsing-2.1.9.tar.gz
+sha256	93326f5490bcfe7069806ff342692e75f72529cfa82f20683b5fceeb5d4a7fc2  pyparsing-2.1.9.tar.gz
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index ad066b8..652345d 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 2.0.3
+PYTHON_PYPARSING_VERSION = 2.1.9
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://pypi.python.org/packages/source/p/pyparsing
+PYTHON_PYPARSING_SITE = https://pypi.python.org/packages/87/ee/6f3a94d834c82a5c1a74f2fc77775ff05b5fbbf7d97f844e6fff5e2ff94b
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
-PYTHON_PYPARSING_SETUP_TYPE = distutils
+PYTHON_PYPARSING_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
