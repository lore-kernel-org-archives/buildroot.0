From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Sep 2018 13:11:14 +0200
Subject: [Buildroot] [git commit] python-incremental: bump to version 17.5.0
Message-ID: <20180928111047.7A09D8A28A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22cfee8d27084a5197844fe0255527d13da77044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-incremental/python-incremental.hash | 8 +++++---
 package/python-incremental/python-incremental.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-incremental/python-incremental.hash b/package/python-incremental/python-incremental.hash
index 580e76c7c2..c897f6e495 100644
--- a/package/python-incremental/python-incremental.hash
+++ b/package/python-incremental/python-incremental.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/incremental/json, sha256 locally computed
-md5	3fe6b3b1da1d26a48187fb27e969f072  incremental-16.10.1.tar.gz
-sha256	14ad6b720ec47aad6c9caa83e47db1843e2b9b98742da5dda08e16a99f400342  incremental-16.10.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/incremental/json
+md5	602746e0d438e075a5a9e0678140bba2  incremental-17.5.0.tar.gz
+sha256	7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3  incremental-17.5.0.tar.gz
+# Locally computed sha256
+sha256	d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
index fc1975ffd9..9c9d3a4405 100644
--- a/package/python-incremental/python-incremental.mk
+++ b/package/python-incremental/python-incremental.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INCREMENTAL_VERSION = 16.10.1
+PYTHON_INCREMENTAL_VERSION = 17.5.0
 PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
-PYTHON_INCREMENTAL_SITE = https://pypi.python.org/packages/da/b0/32233c9e84b0d44b39015fba8fec03e88053723c1b455925081dc6ccd9e7
+PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/8f/26/02c4016aa95f45479eea37c90c34f8fab6775732ae62587a874b619ca097
 PYTHON_INCREMENTAL_SETUP_TYPE = setuptools
 PYTHON_INCREMENTAL_LICENSE = MIT
 PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
