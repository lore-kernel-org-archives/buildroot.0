From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 12:06:29 +0200
Subject: [Buildroot] [git commit] python-cffi: bump to version 1.8.3
Message-ID: <20160920102825.533547FDB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e895b44b8135952518df47010930b7cdd253737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cffi/python-cffi.hash | 7 +++----
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 125c93e..39065bc 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,4 +1,3 @@
-# From https://pypi.python.org/pypi?:action=show_md5&digest=2fae9160991afefb20ff0fbde3b14faf
-md5  2fae9160991afefb20ff0fbde3b14faf  cffi-1.6.0.tar.gz
-# Calculated based on the hash above
-sha256	 a7f75c4ef2362c0a0e54657add0a6c509fecbfa3b3807bc0925f5cb1c9f927db  cffi-1.6.0.tar.gz
+# md5 from https://pypi.python.org/pypi/cffi/json, sha256 locally computed
+md5  c8e877fe0426a99d0cf5872cf2f95b27  cffi-1.8.3.tar.gz
+sha256	 c321bd46faa7847261b89c0469569530cad5a41976bb6dba8202c0159f476568  cffi-1.8.3.tar.gz
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 3c2d534..d348695 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.6.0
+PYTHON_CFFI_VERSION = 1.8.3
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://pypi.python.org/packages/b6/98/11feff87072e2e640fb8320712b781eccdef05d588618915236b32289d5a
+PYTHON_CFFI_SITE = https://pypi.python.org/packages/0a/f3/686af8873b70028fccf67b15c78fd4e4667a3da995007afc71e786d61b0a
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
