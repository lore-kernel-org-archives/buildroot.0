From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:02:30 +0200
Subject: [Buildroot] [git commit] python-psutil: bump to version 4.3.0
Message-ID: <20160630220236.D70FE820FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7835a8356504dbd765aed7fca02d9da881ef1e6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-psutil/python-psutil.hash | 6 +++---
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 8e3a535..007b7c5 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=713f259f917a0c26acfbb7e6ae632ef7, sha256 locally computed
-md5	713f259f917a0c26acfbb7e6ae632ef7  psutil-4.2.0.tar.gz
-sha256  544f013a0aea7199e07e3efe5627f5d4165179a04c66050b234cc3be2eca1ace  psutil-4.2.0.tar.gz
+# md5 from https://pypi.python.org/pypi/psutil/json, sha256 locally computed
+md5	ca97cf5f09c07b075a12a68b9d44a67d  psutil-4.3.0.tar.gz
+sha256  86197ae5978f216d33bfff4383d5cc0b80f079d09cf45a2a406d1abb5d0299f0  psutil-4.3.0.tar.gz
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index a5a1de9..85882ad 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 4.2.0
+PYTHON_PSUTIL_VERSION = 4.3.0
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://pypi.python.org/packages/a6/bf/5ce23dc9f50de662af3b4bf54812438c298634224924c4e18b7c3b57a2aa
+PYTHON_PSUTIL_SITE = https://pypi.python.org/packages/22/a8/6ab3f0b3b74a36104785808ec874d24203c6a511ffd2732dd215cf32d689
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3c
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
