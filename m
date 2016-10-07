From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:15:19 +0200
Subject: [Buildroot] [git commit] package/python-rtslib-fb: bump version to
	2.1.58
Message-ID: <20161007131551.D7C9680089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e57ea511ee8f4e944bc6343b467386fff20acd37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-rtslib-fb/python-rtslib-fb.hash | 5 +++--
 package/python-rtslib-fb/python-rtslib-fb.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-rtslib-fb/python-rtslib-fb.hash b/package/python-rtslib-fb/python-rtslib-fb.hash
index fd06185..e4e56e7 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.hash
+++ b/package/python-rtslib-fb/python-rtslib-fb.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  d5d81a78046b4c228d29ba88d9950e0f63858e5fcf601e3d0f8bf107fbaadc03  python-rtslib-fb-v2.1.fb57.tar.gz
+# md5 from https://pypi.python.org/pypi/rtslib-fb/json, sha256 locally computed
+md5	f8a2c55cea6de95968fc0dd49beeef6f  rtslib-fb-2.1.58.tar.gz
+sha256	5806f9903557907787abd9c8b9dffb2b312e6c5e3ff40d50d26b10c37b118d47  rtslib-fb-2.1.58.tar.gz
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index 85bee0b..f0864a0 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_RTSLIB_FB_VERSION = v2.1.fb57
-PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
+PYTHON_RTSLIB_FB_VERSION = 2.1.58
+PYTHON_RTSLIB_FB_SOURCE = rtslib-fb-$(PYTHON_RTSLIB_FB_VERSION).tar.gz
+PYTHON_RTSLIB_FB_SITE = https://pypi.python.org/packages/c8/26/ae0ff9a721d046bef78c457d8fc19287f7dbe36f98f5e190b017f0d9e9b7
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
-PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
+PYTHON_RTSLIB_FB_LICENSE_FILES = setup.py
 PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
 PYTHON_RTSLIB_FB_DEPENDENCIES = python-six
 
