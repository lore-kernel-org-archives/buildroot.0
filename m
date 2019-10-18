From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 21:22:58 +0200
Subject: [Buildroot] [git commit] package/python-portend: bump to version 2.5
Message-ID: <20191018191756.99CCC826DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7c6a8f45289ff719dd482ac75c051a824102455
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license file (and hash).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-portend/python-portend.hash | 8 +++++---
 package/python-portend/python-portend.mk   | 5 +++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-portend/python-portend.hash b/package/python-portend/python-portend.hash
index ce4d5f6f6d..14338df055 100644
--- a/package/python-portend/python-portend.hash
+++ b/package/python-portend/python-portend.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/portend/json, sha256 locally computed
-md5	a45e001d40227c4529b1a7186f4442f5  portend-1.8.tar.gz
-sha256	7de919b82c4ac60d4768fe80a2557290661aa665b7c427de6249d8cb2fde5561  portend-1.8.tar.gz
+# md5, sha256 from https://pypi.org/pypi/portend/json
+md5	0ab51a12b7462a5275946a3645a71e92  portend-2.5.tar.gz
+sha256	19dc27bfb3c72471bd30a235a4d5fbefef8a7e31cab367744b5d87a205e7bfd9  portend-2.5.tar.gz
+# Locally computed sha256 checksums
+sha256	a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-portend/python-portend.mk b/package/python-portend/python-portend.mk
index b0e89b130f..8d619052c9 100644
--- a/package/python-portend/python-portend.mk
+++ b/package/python-portend/python-portend.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PORTEND_VERSION = 1.8
+PYTHON_PORTEND_VERSION = 2.5
 PYTHON_PORTEND_SOURCE = portend-$(PYTHON_PORTEND_VERSION).tar.gz
-PYTHON_PORTEND_SITE = https://pypi.python.org/packages/3f/37/f3ab6c4a00632d53d7dfb74ba4a695e86605b92b0a94bd41fa443b60ccb6
+PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/2c/59/948666fc2455ae471efd40cb2a9a990f5f6f2354a9a6b228e29b9fb4a307
 PYTHON_PORTEND_LICENSE = MIT
+PYTHON_PORTEND_LICENSE_FILES = LICENSE
 PYTHON_PORTEND_SETUP_TYPE = setuptools
 PYTHON_PORTEND_DEPENDENCIES = host-python-setuptools-scm
 
