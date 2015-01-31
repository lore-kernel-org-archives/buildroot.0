From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 31 Jan 2015 19:59:35 +0100
Subject: [Buildroot] [PATCH] python-cffi: bump to 0.8.6
Message-ID: <1422730775-28205-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cffi/python-cffi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 3d5c86f..17efbab 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 0.8.2
+PYTHON_CFFI_VERSION = 0.8.6
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
 PYTHON_CFFI_SITE = https://pypi.python.org/packages/source/c/cffi
 PYTHON_CFFI_SETUP_TYPE = setuptools
-- 
2.1.0
