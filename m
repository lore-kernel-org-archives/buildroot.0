From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:07:59 +0100
Subject: [Buildroot] [git commit] python-cffi: bump to 1.3.1
Message-ID: <20151213130804.31DF48178A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c5818681210365be345885d90400e6317f0a061
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cffi/python-cffi.hash | 6 +++---
 package/python-cffi/python-cffi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index b41c979..200ef33 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,4 +1,4 @@
-# From https://pypi.python.org/pypi/cffi/0.8.6
-md5	474b5a68299a6f05009171de1dc91be6	cffi-0.8.6.tar.gz
+# From https://pypi.python.org/pypi?:action=show_md5&digest=deeba7c1fd32a66f1db587988d760c11
+md5	deeba7c1fd32a66f1db587988d760c11	cffi-1.3.1.tar.gz
 # Calculated based on the hash above
-sha256	2532d9e3af9e3c6d0f710fc98b0295b563c7f39cfd97dd2242bd36fbf4900610	cffi-0.8.6.tar.gz
+sha256	d45dd39a770b4afb591c82555f6a8bbc1ac7eb019eda9b621eee1a0a72201220	cffi-1.3.1.tar.gz
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 17efbab..70fbe02 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 0.8.6
+PYTHON_CFFI_VERSION = 1.3.1
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
 PYTHON_CFFI_SITE = https://pypi.python.org/packages/source/c/cffi
 PYTHON_CFFI_SETUP_TYPE = setuptools
