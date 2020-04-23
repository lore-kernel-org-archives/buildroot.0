From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:14:25 +0200
Subject: [Buildroot] [git commit] package/python: bump version to 2.7.18
Message-ID: <20200423200056.5D9598FC78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3586b0703fa9a8b4138ac4bf9e274c7f1bef2e6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://pythoninsider.blogspot.com/2020/04/python-2718-last-release-of-python-2.html

Updated license hash due to upstream commit:
https://github.com/python/cpython/commit/aa5b196c180d4c1dbe5a8593e55066e630d38c09

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python/python.hash | 8 ++++----
 package/python/python.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python/python.hash b/package/python/python.hash
index aa809b9a61..f5e51d9638 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-2717/
-md5 b3b6d2c92f42a60667814358ab9f0cfd Python-2.7.17.tar.xz
+# From https://www.python.org/downloads/release/python-2718/
+md5  fd6cc8ec0a78c44036f825e739f36e5a Python-2.7.18.tar.xz
 # Locally calculated
-sha256 4d43f033cdbd0aa7b7023c81b0e986fd11e653b5248dac9144d508f11812ba41  Python-2.7.17.tar.xz
-sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c  LICENSE
+sha256  b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43  Python-2.7.18.tar.xz
+sha256  de4d1f2d2ad5ad0cfd1657a106476b31cb5db5ef9d1ff842b237c0c81f0c8a23  LICENSE
diff --git a/package/python/python.mk b/package/python/python.mk
index f9d5619612..ccaaadd012 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).17
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).18
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = https://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python-2.0, others
