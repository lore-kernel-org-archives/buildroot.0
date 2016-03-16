From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 16 Mar 2016 16:41:48 +0100
Subject: [Buildroot] [PATCH 3/4] python-cffi: bump to version 1.5.2
In-Reply-To: <1458142909-26392-1-git-send-email-yegorslists@googlemail.com>
References: <1458142909-26392-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1458142909-26392-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cffi/python-cffi.hash | 6 +++---
 package/python-cffi/python-cffi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index c689088..52f5198 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,4 +1,4 @@
-# From https://pypi.python.org/pypi?:action=show_md5&digest=dec8441e67880494ee881305059af656
-md5  dec8441e67880494ee881305059af656  cffi-1.5.0.tar.gz
+# From https://pypi.python.org/pypi?:action=show_md5&digest=fa766133f7299464c8bf857e0c966a82
+md5  fa766133f7299464c8bf857e0c966a82  cffi-1.5.2.tar.gz
 # Calculated based on the hash above
-sha256	 44f76f6c3fc654860821785192eca29bd66531af57d09b681e6d52584604a7e7  cffi-1.5.0.tar.gz
+sha256	 da9bde99872e46f7bb5cff40a9b1cc08406765efafb583c704de108b6cb821dd  cffi-1.5.2.tar.gz
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index d7e4edf..2b35832 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.5.0
+PYTHON_CFFI_VERSION = 1.5.2
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
 PYTHON_CFFI_SITE = https://pypi.python.org/packages/source/c/cffi
 PYTHON_CFFI_SETUP_TYPE = setuptools
-- 
2.7.0
