From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Oct 2018 09:54:35 +0200
Subject: [Buildroot] [git commit] python-subprocess32: bump to version 3.5.2
Message-ID: <20181003075643.0477F8B755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a27a360b6b11dd722d8b2d3c06afe564b87b4c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-subprocess32/python-subprocess32.hash | 5 +++--
 package/python-subprocess32/python-subprocess32.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-subprocess32/python-subprocess32.hash b/package/python-subprocess32/python-subprocess32.hash
index 17a54b0034..76b63d4a87 100644
--- a/package/python-subprocess32/python-subprocess32.hash
+++ b/package/python-subprocess32/python-subprocess32.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/subprocess32/json
-sha256	1e450a4a4c53bf197ad6402c564b9f7a53539385918ef8f12bdf430a61036590  subprocess32-3.2.7.tar.gz
+# md5, sha256 from https://pypi.org/pypi/subprocess32/json
+md5	4bd55a9fe9504a683255c4f51b1679ae  subprocess32-3.5.2.tar.gz
+sha256	eb2b989cf03ffc7166339eb34f1aa26c5ace255243337b1e22dab7caa1166687  subprocess32-3.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256	826b43437249d39422642f695154d064da64de92eb1476048a615f50bc1beb4a  LICENSE
diff --git a/package/python-subprocess32/python-subprocess32.mk b/package/python-subprocess32/python-subprocess32.mk
index 483bf5333f..1441420f29 100644
--- a/package/python-subprocess32/python-subprocess32.mk
+++ b/package/python-subprocess32/python-subprocess32.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SUBPROCESS32_VERSION = 3.2.7
+PYTHON_SUBPROCESS32_VERSION = 3.5.2
 PYTHON_SUBPROCESS32_SOURCE = subprocess32-$(PYTHON_SUBPROCESS32_VERSION).tar.gz
-PYTHON_SUBPROCESS32_SITE = https://files.pythonhosted.org/packages/b8/2f/49e53b0d0e94611a2dc624a1ad24d41b6d94d0f1b0a078443407ea2214c2
-PYTHON_SUBPROCESS32_SETUP_TYPE = distutils
+PYTHON_SUBPROCESS32_SITE = https://files.pythonhosted.org/packages/c3/5f/7117737fc7114061837a4f51670d863dd7f7f9c762a6546fa8a0dcfe61c8
+PYTHON_SUBPROCESS32_SETUP_TYPE = setuptools
 PYTHON_SUBPROCESS32_LICENSE = Python-2.0
 PYTHON_SUBPROCESS32_LICENSE_FILES = LICENSE
 
