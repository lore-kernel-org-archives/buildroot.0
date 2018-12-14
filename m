From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Dec 2018 21:30:21 +0100
Subject: [Buildroot] [git commit] python-cython: bump to version 0.29.2
Message-ID: <20181214202637.C40BC84659@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9c6c561c15802b8bbb2e7245efd0408a080cd42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 4ce7b3cd55..1fdb7e19cf 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5    3cf61c7ef8e5daa47e469cf7ba2e598c  Cython-0.29.1.tar.gz
-sha256 18ab7646985a97e02cee72e1ddba2e732d4931d4e1732494ff30c5aa084bfb97  Cython-0.29.1.tar.gz
+md5	175af2d64f9ae09d25f5cf8181388559  Cython-0.29.2.tar.gz
+sha256	2ac187ff998a95abb7fae452b5178f91e1a713698c9ced89836c94e6b1d3f41e  Cython-0.29.2.tar.gz
 # Locally computed sha256 checksums
 sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256 e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 852146406a..8dd1469495 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.1
+PYTHON_CYTHON_VERSION = 0.29.2
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/f0/f8/7f406aac4c6919d5a4ce16509bbe059cd256e9ad94bae5ccac14094b7c51
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/c1/f2/d1207fd0dfe5cb4dbb06a035eb127653821510d896ce952b5c66ca3dafa4
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
