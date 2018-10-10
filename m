From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 10 Oct 2018 22:54:34 +0300
Subject: [Buildroot] [PATCH 1/1] python-subprocess32: bump to version 3.5.3
Message-ID: <20181010195434.14618-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-subprocess32/python-subprocess32.hash | 4 ++--
 package/python-subprocess32/python-subprocess32.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-subprocess32/python-subprocess32.hash b/package/python-subprocess32/python-subprocess32.hash
index 76b63d4a87..e96505d3d4 100644
--- a/package/python-subprocess32/python-subprocess32.hash
+++ b/package/python-subprocess32/python-subprocess32.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/subprocess32/json
-md5	4bd55a9fe9504a683255c4f51b1679ae  subprocess32-3.5.2.tar.gz
-sha256	eb2b989cf03ffc7166339eb34f1aa26c5ace255243337b1e22dab7caa1166687  subprocess32-3.5.2.tar.gz
+md5	afa0510115f483d668e25aa30502d9bc  subprocess32-3.5.3.tar.gz
+sha256	6bc82992316eef3ccff319b5033809801c0c3372709c5f6985299c88ac7225c3  subprocess32-3.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256	826b43437249d39422642f695154d064da64de92eb1476048a615f50bc1beb4a  LICENSE
diff --git a/package/python-subprocess32/python-subprocess32.mk b/package/python-subprocess32/python-subprocess32.mk
index 1441420f29..d6c57fb8bd 100644
--- a/package/python-subprocess32/python-subprocess32.mk
+++ b/package/python-subprocess32/python-subprocess32.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SUBPROCESS32_VERSION = 3.5.2
+PYTHON_SUBPROCESS32_VERSION = 3.5.3
 PYTHON_SUBPROCESS32_SOURCE = subprocess32-$(PYTHON_SUBPROCESS32_VERSION).tar.gz
-PYTHON_SUBPROCESS32_SITE = https://files.pythonhosted.org/packages/c3/5f/7117737fc7114061837a4f51670d863dd7f7f9c762a6546fa8a0dcfe61c8
+PYTHON_SUBPROCESS32_SITE = https://files.pythonhosted.org/packages/be/2b/beeba583e9877e64db10b52a96915afc0feabf7144dcbf2a0d0ea68bf73d
 PYTHON_SUBPROCESS32_SETUP_TYPE = setuptools
 PYTHON_SUBPROCESS32_LICENSE = Python-2.0
 PYTHON_SUBPROCESS32_LICENSE_FILES = LICENSE
-- 
2.17.1
