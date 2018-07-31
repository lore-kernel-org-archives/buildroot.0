From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jul 2018 17:02:05 +0200
Subject: [Buildroot] [PATCH 1/7] package/python-idna: bump version to 2.7
Message-ID: <20180731150211.18751-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated package using scanpypi, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-idna/python-idna.hash | 8 +++++---
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 839154a06f..4b3c84e5d8 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/idna/json, sha256 locally computed
-md5 fc1d992bef73e8824db411bb5d21f012 idna-2.5.tar.gz
-sha256 3cb5ce08046c4e3a560fc02f138d0ac63e00f8ce5901a56b32ec8b7994082aab idna-2.5.tar.gz
+# md5, sha256 from https://pypi.org/pypi/idna/json
+md5	0e5bb69018ddef1b9d95f681182be82c  idna-2.7.tar.gz
+sha256	684a38a6f903c1d71d6d5fac066b58d7768af4de2b832e426ec79c30daa94a16  idna-2.7.tar.gz
+# Locally computed sha256 checksums
+sha256	0d4bc7abd48dcfb14e24254ee404066737ff0167144e222914a2113b8794683e  LICENSE.rst
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index c8d1793e0a..d5c57955a3 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 2.5
+PYTHON_IDNA_VERSION = 2.7
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://pypi.python.org/packages/d8/82/28a51052215014efc07feac7330ed758702fc0581347098a81699b5281cb
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935
 PYTHON_IDNA_LICENSE =  BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.rst
 PYTHON_IDNA_SETUP_TYPE = setuptools
-- 
2.18.0
