From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  6 Sep 2016 23:01:23 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 3.3.1
Message-ID: <1473195683-25414-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps python pillow to version 3.3.1

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index bf7828d..fa6834e 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,4 +1,4 @@
-# https://pypi.python.org/pypi?:action=show_md5&digest=b5a15b03bf402fe254636c015fcf04da
-md5 b5a15b03bf402fe254636c015fcf04da  Pillow-3.3.0.tar.gz
+https://pypi.python.org/pypi?:action=show_md5&digest=3bc85204223b52e96ed05c9441507eed
+md5 3bc85204223b52e96ed05c9441507eed  Pillow-3.3.1.tar.gz
 # sha256 locally computed
-sha256 031e7c9c885a4f343d1ad366c7fd2340449dc70318acb4a28d6411994f0accd1  Pillow-3.3.0.tar.gz
+sha256 3491ca65d9fdba4db094ab3f8e17170425e7dd670e507921a665a1975d1b3df1  Pillow-3.3.1.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 0346ae8..d6ca5c8 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 3.3.0
+PYTHON_PILLOW_VERSION = 3.3.1
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://pypi.python.org/packages/e0/27/f61098a12f14690689924de93ffdd101463083a80bf8ff3e0c218addf05b
+PYTHON_PILLOW_SITE = https://pypi.python.org/packages/7b/32/e6978aed8fba6398c00eec25f12798fb57647a6cef4f85db1567e3d086ef
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-- 
1.9.1
