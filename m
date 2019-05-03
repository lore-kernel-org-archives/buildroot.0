From: Grzegorz Blach <grzegorz@blach.pl>
Date: Fri,  3 May 2019 16:50:34 +0000
Subject: [Buildroot] [PATCH] package/python-falcon: bump to version 2.0.0
Message-ID: <20190503165035.28984-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-falcon/Config.in          | 4 +---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/python-falcon/Config.in b/package/python-falcon/Config.in
index ffd66eec1b..1bf93064bb 100644
--- a/package/python-falcon/Config.in
+++ b/package/python-falcon/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_PYTHON_FALCON
 	bool "python-falcon"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_MIMEPARSE # runtime
 	help
 	  An unladen web framework for building APIs and app
 	  backends.
 
-	  http://falconframework.org
+	  https://falconframework.org
diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index 7f6ee6ea3d..68b8d4cb2c 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5	3cb880665ee2cd52143cf8a7790a35e6  falcon-1.4.1.tar.gz
-sha256	3981f609c0358a9fcdb25b0e7fab3d9e23019356fb429c635ce4133135ae1bc4  falcon-1.4.1.tar.gz
+md5	77c52c144dd284e6259d257c6f008072  falcon-2.0.0.tar.gz
+sha256	eea593cf466b9c126ce667f6d30503624ef24459f118c75594a69353b6c3d5fc  falcon-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256	e9e7f1a7ba764f042e56afce6f3563c2be9c4fffbb1404b20f8050ae051f577c  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index b724ffadbe..1d7c869d6d 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 1.4.1
+PYTHON_FALCON_VERSION = 2.0.0
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/2f/e6/5045da9df509b9259037f065d15608930fd6c997ee930ad230f9fbfecf15
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/19/30/edff5a1fea7a8e9876c8391e170263e1bb207875b6a65cd619818487b27b
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-- 
2.21.0
