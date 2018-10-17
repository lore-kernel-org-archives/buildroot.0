From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Oct 2018 21:48:34 +0200
Subject: [Buildroot] [git commit] python-urllib3: bump to version 1.24
Message-ID: <20181017194820.3150A83A51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22a6d1551a9ec54450d71b4a7042fbc39f3b15a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 505ff923be..ece027a636 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5	1ad43e4b5ab7a0794c89dc057e1d7179  urllib3-1.23.tar.gz
-sha256	a68ac5e15e76e7e5dd2b8f94007233e01effe3e50e8daddf69acfd81cb686baf  urllib3-1.23.tar.gz
+md5	0dd4694f18e0ab684c5db7c79e14f66b  urllib3-1.24.tar.gz
+sha256	41c3db2fc01e5b907288010dec72f9d0a74e37d6994e6eb56849f59fea2265ae  urllib3-1.24.tar.gz
 # Locally computed sha256 checksums
 sha256	11db569430ca5ad793f1399297b8df5041a22137abaf90642ea71da21d59121c  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 5519fbb9b2..f9e5e697f3 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.23
+PYTHON_URLLIB3_VERSION = 1.24
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/a5/74/05ffd00b4b5c08306939c485869f5dc40cbc27357195b0a98b18e4c48893
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
