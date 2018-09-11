From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 11 Sep 2018 17:58:23 +0300
Subject: [Buildroot] [PATCH 1/1] python-scandir: bump to version 1.9.0
In-Reply-To: <20180911145823.15032-1-asafka7@gmail.com>
References: <20180911145823.15032-1-asafka7@gmail.com>
Message-ID: <20180911145823.15032-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-scandir/python-scandir.hash | 8 +++++---
 package/python-scandir/python-scandir.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-scandir/python-scandir.hash b/package/python-scandir/python-scandir.hash
index aecd9a58cc..5918291ba7 100644
--- a/package/python-scandir/python-scandir.hash
+++ b/package/python-scandir/python-scandir.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/scandir/json, sha256 locally computed
-md5 a2713043de681bba6b084be42e7a8a44 scandir-1.5.tar.gz
-sha256 c2612d1a487d80fb4701b4a91ca1b8f8a695b1ae820570815e85e8c8b23f1283 scandir-1.5.tar.gz
+# md5, sha256 from https://pypi.org/pypi/scandir/json
+md5	506c4cc5f38c00b301642a9cb0433910  scandir-1.9.0.tar.gz
+sha256	44975e209c4827fc18a3486f257154d34ec6eaec0f90fef0cca1caa482db7064  scandir-1.9.0.tar.gz
+# Locally computed sha256 checksums
+sha256	a5e2fbdc239744419d29407cdbc92793c4d9c1d956c174f7cb7f96fa6d058c86  LICENSE.txt
diff --git a/package/python-scandir/python-scandir.mk b/package/python-scandir/python-scandir.mk
index 9b7ba70071..1008fcad03 100644
--- a/package/python-scandir/python-scandir.mk
+++ b/package/python-scandir/python-scandir.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCANDIR_VERSION = 1.5
+PYTHON_SCANDIR_VERSION = 1.9.0
 PYTHON_SCANDIR_SOURCE = scandir-$(PYTHON_SCANDIR_VERSION).tar.gz
-PYTHON_SCANDIR_SITE = https://pypi.python.org/packages/bd/f4/3143e0289faf0883228017dbc6387a66d0b468df646645e29e1eb89ea10e
+PYTHON_SCANDIR_SITE = https://files.pythonhosted.org/packages/16/2a/557af1181e6b4e30254d5a6163b18f5053791ca66e251e77ab08887e8fe3
 PYTHON_SCANDIR_LICENSE = BSD-3-Clause
 PYTHON_SCANDIR_LICENSE_FILES = LICENSE.txt
 PYTHON_SCANDIR_SETUP_TYPE = setuptools
-- 
2.17.1
