From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:28 +0200
Subject: [Buildroot] [PATCH 01/21] package/python-pexpect: bump version to
	4.2.1
Message-ID: <20161006192948.27956-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pexpect/python-pexpect.hash | 6 +++---
 package/python-pexpect/python-pexpect.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
index 29cf892..e383607 100644
--- a/package/python-pexpect/python-pexpect.hash
+++ b/package/python-pexpect/python-pexpect.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org, sha256 locally computed
-md5 056df81e6ca7081f1015b4b147b977b7 pexpect-4.0.1.tar.gz
-sha256 232795ebcaaf2e120396dbbaa3a129eda51757eeaae1911558f4ef8ee414fc6c pexpect-4.0.1.tar.gz
+# md5 from https://pypi.python.org/pypi/pexpect/json, sha256 locally computed
+md5	3694410001a99dff83f0b500a1ca1c95  pexpect-4.2.1.tar.gz
+sha256	3d132465a75b57aa818341c6521392a06cc660feb3988d7f1074f39bd23c9a92  pexpect-4.2.1.tar.gz
diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
index 40a1741..f1f9903 100644
--- a/package/python-pexpect/python-pexpect.mk
+++ b/package/python-pexpect/python-pexpect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PEXPECT_VERSION = 4.0.1
-PYTHON_PEXPECT_SITE = https://pypi.python.org/packages/source/p/pexpect
+PYTHON_PEXPECT_VERSION = 4.2.1
 PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
+PYTHON_PEXPECT_SITE = https://pypi.python.org/packages/e8/13/d0b0599099d6cd23663043a2a0bb7c61e58c6ba359b2656e6fb000ef5b98
 PYTHON_PEXPECT_LICENSE = ISC
 PYTHON_PEXPECT_LICENSE_FILES = LICENSE
 PYTHON_PEXPECT_SETUP_TYPE = distutils
-- 
2.9.3
