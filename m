From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:01:47 +0100
Subject: [Buildroot] [git commit] python-psutil: bump to version 5.2.0
Message-ID: <20170312220223.778B080DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98a1ed7eba7b8a8f21ff3c81d05ae97a515d129a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index c0b795b..19fb8a4 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/psutil/json, sha256 locally computed
-md5	3090e32d42761086ae82036cadb95ba3  psutil-5.1.3.tar.gz
-sha256  959bd58bdc8152b0a143cb3bd822d4a1b8f7230617b0e3eb2ff6e63812120f2b  psutil-5.1.3.tar.gz
+md5	c9aa2599dcd9e5b59d71b6660d396062  psutil-5.2.0.tar.gz
+sha256  2fc91d068faa5613c093335f0e758673ef8c722ad4bfa4aded64c13ae69089eb  psutil-5.2.0.tar.gz
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 2bb865d..9783733 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.1.3
+PYTHON_PSUTIL_VERSION = 5.2.0
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://pypi.python.org/packages/78/0a/aa90434c6337dd50d182a81fe4ae4822c953e166a163d1bf5f06abb1ac0b
+PYTHON_PSUTIL_SITE = https://pypi.python.org/packages/3c/2f/f3ab91349c666f009077157b12057e613a3152a46a6c3be883777546b6de
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3c
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
