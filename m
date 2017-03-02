From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:58:19 +0100
Subject: [Buildroot] [git commit] python-xlwt: bump to version 1.2.0
Message-ID: <20170302205925.1E05E804EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed0234ad786215b530bbce345458e36b5ba89237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-xlwt/python-xlwt.hash | 7 +++----
 package/python-xlwt/python-xlwt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-xlwt/python-xlwt.hash b/package/python-xlwt/python-xlwt.hash
index 4cacf2b..4523887 100644
--- a/package/python-xlwt/python-xlwt.hash
+++ b/package/python-xlwt/python-xlwt.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/xlwt/json
-md5	fadf8d1be8c5f071561c4145ed5f5b89  xlwt-1.1.2.tar.gz
-# sha256 calculated by scanpypi
-sha256	aed648c17731f40f84550dd2a1aaa53569f0cbcaf5610ba895cd2632587b723c  xlwt-1.1.2.tar.gz
+# md5 from https://pypi.python.org/pypi/xlwt/json, sha256 locally computed
+md5 1f2673a93c221f0195f342c578f04968 xlwt-1.2.0.tar.gz
+sha256 505669c1eb6a60823fd3e2e723b60eea95f2c56254113bf163091ed2bedb4ac9 xlwt-1.2.0.tar.gz
diff --git a/package/python-xlwt/python-xlwt.mk b/package/python-xlwt/python-xlwt.mk
index 38d5f09..27901f9 100644
--- a/package/python-xlwt/python-xlwt.mk
+++ b/package/python-xlwt/python-xlwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLWT_VERSION = 1.1.2
+PYTHON_XLWT_VERSION = 1.2.0
 PYTHON_XLWT_SOURCE = xlwt-$(PYTHON_XLWT_VERSION).tar.gz
-PYTHON_XLWT_SITE = https://pypi.python.org/packages/0b/69/644313df86e6375ec2c6b34ec8ac544b9cc7803b7d943223d32811860f3d
+PYTHON_XLWT_SITE = https://pypi.python.org/packages/5b/8d/22b9ec552a1d7865de39f54bd15f9db09c72a6bf8ab77b11dcce4ae336bb
 PYTHON_XLWT_SETUP_TYPE = setuptools
 PYTHON_XLWT_LICENSE = BSD-3c, BSD-4c
 PYTHON_XLWT_LICENSE_FILES = docs/licenses.rst
