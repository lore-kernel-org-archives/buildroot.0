From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  7 Feb 2017 16:56:36 +0100
Subject: [Buildroot] [PATCH] python-pyyaml: bump to version 3.12
Message-ID: <20170207155636.28399-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pyyaml/python-pyyaml.hash | 7 +++----
 package/python-pyyaml/python-pyyaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index a6d9a776a..209ab27e5 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,4 +1,3 @@
-# From https://pypi.python.org/pypi?:action=show_md5&digest=f50e08ef0fe55178479d3a618efe21db
-md5 f50e08ef0fe55178479d3a618efe21db PyYAML-3.11.tar.gz
-# Locally computed
-sha256 c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8 PyYAML-3.11.tar.gz
+# md5 from https://pypi.python.org/pypi/pyyaml/json, sha256 locally computed
+md5 4c129761b661d181ebf7ff4eb2d79950 PyYAML-3.12.tar.gz
+sha256 592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab PyYAML-3.12.tar.gz
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index f3d72833d..0509a7adb 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYYAML_VERSION = 3.11
+PYTHON_PYYAML_VERSION = 3.12
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://pypi.python.org/packages/source/P/PyYAML
+PYTHON_PYYAML_SITE = https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a
 PYTHON_PYYAML_SETUP_TYPE = distutils
 PYTHON_PYYAML_LICENSE = Python software foundation license v2
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
-- 
2.11.0
