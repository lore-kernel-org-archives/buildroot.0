From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Oct 2018 15:32:03 +0200
Subject: [Buildroot] [git commit] python-txtorcon: bump to version 18.1.0
Message-ID: <20181003133127.3A3F98B852@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46568cd8101a36c296dad58a7ec91ba34c9f752f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[Thomas: bump to 18.1.0, to fix Python 2.x issue, reported by Ricardo.]
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txtorcon/python-txtorcon.hash | 9 +++++----
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index 71a2ec508f..ecb9726b7a 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/txtorcon/json, sha256 locally computed
-md5	4d7380fa7e721c77cac103d971882374  txtorcon-0.19.3.tar.gz
-sha256	f73396667909a3c7a98f4dd865edf4ed6a2518ee5a935d92e18b8a479ec244fd  txtorcon-0.19.3.tar.gz
-sha256	3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
+# md5, sha256 from https://pypi.org/pypi/txtorcon/json
+md5    2b39f371ae08cd7cac34caed7d6aaa56  txtorcon-18.1.0.tar.gz
+sha256 b61cf175a5f1d4092609caf05d178fcdcabf513928eec98d38125c501afea43c  txtorcon-18.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256 3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index f75f50438e..7f12e62f4f 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 0.19.3
+PYTHON_TXTORCON_VERSION = 18.1.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://pypi.python.org/packages/05/4b/d2fbfdc08ab83c299f2ad22ba38ea35f71f1c966684f5754e079108a1f64
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/d5/e1/577e28231013fffdc97c3078bbd37d9001e6cbea757b0b10da34d765dc32
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
