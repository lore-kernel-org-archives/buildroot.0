From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Feb 2016 22:52:54 +0100
Subject: [Buildroot] [git commit] python-cffi: bump to 1.5.0
Message-ID: <20160204215309.E0F9B817E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95795cf6c8009f47df331ed7d9daab2f5f422168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cffi/python-cffi.hash | 6 +++---
 package/python-cffi/python-cffi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 200ef33..c689088 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,4 +1,4 @@
-# From https://pypi.python.org/pypi?:action=show_md5&digest=deeba7c1fd32a66f1db587988d760c11
-md5	deeba7c1fd32a66f1db587988d760c11	cffi-1.3.1.tar.gz
+# From https://pypi.python.org/pypi?:action=show_md5&digest=dec8441e67880494ee881305059af656
+md5  dec8441e67880494ee881305059af656  cffi-1.5.0.tar.gz
 # Calculated based on the hash above
-sha256	d45dd39a770b4afb591c82555f6a8bbc1ac7eb019eda9b621eee1a0a72201220	cffi-1.3.1.tar.gz
+sha256	 44f76f6c3fc654860821785192eca29bd66531af57d09b681e6d52584604a7e7  cffi-1.5.0.tar.gz
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 7151789..d7e4edf 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.3.1
+PYTHON_CFFI_VERSION = 1.5.0
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
 PYTHON_CFFI_SITE = https://pypi.python.org/packages/source/c/cffi
 PYTHON_CFFI_SETUP_TYPE = setuptools
