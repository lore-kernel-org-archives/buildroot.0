From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Feb 2017 16:13:12 +0100
Subject: [Buildroot] [git commit] package/python-psutil: bump to version
	5.1.3
Message-ID: <20170301170421.C579082288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ab3cdaa34ff7e2b2adb403907337d415f68b2f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index ead2d9c..c0b795b 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/psutil/json, sha256 locally computed
-md5	199a366dba829c88bddaf5b41d19ddc0  psutil-4.3.1.tar.gz
-sha256  38f74182fb9e15cafd0cdf0821098a95cc17301807aed25634a18b66537ba51b  psutil-4.3.1.tar.gz
+md5	3090e32d42761086ae82036cadb95ba3  psutil-5.1.3.tar.gz
+sha256  959bd58bdc8152b0a143cb3bd822d4a1b8f7230617b0e3eb2ff6e63812120f2b  psutil-5.1.3.tar.gz
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 1032318..2bb865d 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 4.3.1
+PYTHON_PSUTIL_VERSION = 5.1.3
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://pypi.python.org/packages/78/cc/f267a1371f229bf16db6a4e604428c3b032b823b83155bd33cef45e49a53
+PYTHON_PSUTIL_SITE = https://pypi.python.org/packages/78/0a/aa90434c6337dd50d182a81fe4ae4822c953e166a163d1bf5f06abb1ac0b
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3c
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
