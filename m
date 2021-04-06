From: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue,  6 Apr 2021 18:06:04 +0200
Subject: [Buildroot] [PATCH] package/python-falcon: Bump to version 3.0.0
Message-ID: <20210406160605.264867-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depends on BR2_PACKAGE_PYTHON3

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-falcon/Config.in          | 1 +
 package/python-falcon/python-falcon.hash | 6 +++---
 package/python-falcon/python-falcon.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-falcon/Config.in b/package/python-falcon/Config.in
index 1bf93064bb..f90ef55b30 100644
--- a/package/python-falcon/Config.in
+++ b/package/python-falcon/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FALCON
 	bool "python-falcon"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  An unladen web framework for building APIs and app
 	  backends.
diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index 68b8d4cb2c..80b2aed54f 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5	77c52c144dd284e6259d257c6f008072  falcon-2.0.0.tar.gz
-sha256	eea593cf466b9c126ce667f6d30503624ef24459f118c75594a69353b6c3d5fc  falcon-2.0.0.tar.gz
+md5  0ebd5316cd7f59b9be4ea13650ea3a0d  falcon-3.0.0.tar.gz
+sha256  8d7c3d52ae4590ddfa0b3d9c75d44ab573340a5e78d72ee687712e757ac53929  falcon-3.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	e9e7f1a7ba764f042e56afce6f3563c2be9c4fffbb1404b20f8050ae051f577c  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 1d7c869d6d..5b73b23277 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 2.0.0
+PYTHON_FALCON_VERSION = 3.0.0
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/19/30/edff5a1fea7a8e9876c8391e170263e1bb207875b6a65cd619818487b27b
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/f1/59/2748d63922a46e040be06cd175a6242a33ade7839aac37f441544bb6d651
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-- 
2.27.0
