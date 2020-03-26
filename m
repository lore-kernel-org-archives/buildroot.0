From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Mar 2020 16:06:31 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-idna: bump to version 2.9
Message-ID: <20200326220631.121672-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-idna/python-idna.hash | 6 +++---
 package/python-idna/python-idna.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index ddfd44e97c..50897f045b 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5    2e9ae0b4a0b26d1747c6127cdb060bc1  idna-2.8.tar.gz
-sha256 c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407  idna-2.8.tar.gz
+md5  870b8b80267f00f0faf1b7ba4bdbf14e  idna-2.9.tar.gz
+sha256  7588d1c14ae4c77d74036e8c22ff447b26d0fde8f007354fd48a7814db15b7cb  idna-2.9.tar.gz
 # Locally computed sha256 checksums
-sha256	0d4bc7abd48dcfb14e24254ee404066737ff0167144e222914a2113b8794683e  LICENSE.rst
+sha256  412014420d2473dba06117c3d4d9e0eecaa6dde0ca30cd951f4ec2be39426f32  LICENSE.rst
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 1dae47bb2b..eb4c1036cf 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 2.8
+PYTHON_IDNA_VERSION = 2.9
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7
-PYTHON_IDNA_LICENSE =  BSD-3-Clause
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/cb/19/57503b5de719ee45e83472f339f617b0c01ad75cba44aba1e4c97c2b0abd
+PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.rst
 PYTHON_IDNA_SETUP_TYPE = setuptools
 
-- 
2.20.1
