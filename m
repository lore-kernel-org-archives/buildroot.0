From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Jan 2015 22:50:20 +0100
Subject: [Buildroot] [git commit] python-cffi: bump to 0.8.6
Message-ID: <20150131222039.B20288046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7010c18443f7fec968d0f8c7388dc447fb59635b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cffi/python-cffi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
