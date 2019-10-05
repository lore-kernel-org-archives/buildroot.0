From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:47:12 +0200
Subject: [Buildroot] [git commit] package/python-pathvalidate: bump to
 version 0.29.0
Message-ID: <20191005150349.EC63188454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fb679aaae4b43388897657bd8942217c0c5fedf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pathvalidate/python-pathvalidate.hash | 8 +++++---
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 734d449585..db1190fc77 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pathvalidate/json, sha256 locally computed
-md5	fa119fcdbc744dc3a9de11185437992c  pathvalidate-0.16.0.tar.gz
-sha256	81c665a16e41203dc7698caf4f7ee15b7da97e36368e30e76e76e968ce77f468  pathvalidate-0.16.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pathvalidate/json
+md5	b0a8242d124a9e760ca2d084a4f8fa75  pathvalidate-0.29.0.tar.gz
+sha256	bf250828f40d94881df764950cffca14bb3fa83783d9f239125a6b5e23a5646e  pathvalidate-0.29.0.tar.gz
+# Locally computed sha256 checksums
+sha256	a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index c25f4ce3cf..ee707e4e25 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 0.16.0
+PYTHON_PATHVALIDATE_VERSION = 0.29.0
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/d8/c5/37474d872ca29510a10d93b103920fad551f577b696104a3574a89093e5f
+PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/fc/3f/7a96e26d36b7e99abc9c236ff6db2de2d98e59fed45f9932eb0d17d48473
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
