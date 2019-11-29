From: Louis Aussedat <aussedat.louis@gmail.com>
Date: Fri, 29 Nov 2019 23:36:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-tqdm: bump to version 4.39.0
Message-ID: <20191129223612.2970-1-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
---
 package/python-tqdm/python-tqdm.hash | 4 ++--
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 63dea98cf2..ffaa397a46 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/project/tqdm
-md5	84f1744e2cc097d9e824a2e201cca4a6  tqdm-4.37.0.tar.gz
-sha256	fca09992116d6dc3ad9789cf601a254081eb40d5c14c1863ab6cd10e15c2cb26  tqdm-4.37.0.tar.gz
+md5	e76bb515d530ebaae2610fddb4457bda  tqdm-4.39.0.tar.gz
+sha256	f1a1613fee07cc30a253051617f2a219a785c58877f9f6bfa129446cbaf8b4c1  tqdm-4.39.0.tar.gz
 # Locally computed sha256 checksums
 sha256	1bbf12d09d437844527b3cdaba01d379dac651b5cbb5ebb0d764274684d2680b  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index 3aa562e22e..60d39b0a10 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.37.0
+PYTHON_TQDM_VERSION = 4.39.0
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/cc/7b/5878d4e1b01a2eb802f78ea277f2385072681cabefc8fb4fbdee28dd1869
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/a0/77/ee3aad4ee074d519597c16149ddebc7587ead2e5b609b8d765a860989c6a
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
-- 
2.24.0
