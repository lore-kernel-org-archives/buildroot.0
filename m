From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 May 2016 15:29:07 +0200
Subject: [Buildroot] [git commit] python-cffi: bump to version 1.6.0
Message-ID: <20160506132916.811D67FED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17e85d938353639b60c830ea1f89bc4881157256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change download location.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cffi/python-cffi.hash | 6 +++---
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 52f5198..125c93e 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,4 +1,4 @@
-# From https://pypi.python.org/pypi?:action=show_md5&digest=fa766133f7299464c8bf857e0c966a82
-md5  fa766133f7299464c8bf857e0c966a82  cffi-1.5.2.tar.gz
+# From https://pypi.python.org/pypi?:action=show_md5&digest=2fae9160991afefb20ff0fbde3b14faf
+md5  2fae9160991afefb20ff0fbde3b14faf  cffi-1.6.0.tar.gz
 # Calculated based on the hash above
-sha256	 da9bde99872e46f7bb5cff40a9b1cc08406765efafb583c704de108b6cb821dd  cffi-1.5.2.tar.gz
+sha256	 a7f75c4ef2362c0a0e54657add0a6c509fecbfa3b3807bc0925f5cb1c9f927db  cffi-1.6.0.tar.gz
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 2b35832..3c2d534 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.5.2
+PYTHON_CFFI_VERSION = 1.6.0
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://pypi.python.org/packages/source/c/cffi
+PYTHON_CFFI_SITE = https://pypi.python.org/packages/b6/98/11feff87072e2e640fb8320712b781eccdef05d588618915236b32289d5a
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
