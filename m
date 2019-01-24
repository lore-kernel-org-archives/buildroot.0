From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 17:14:33 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] python-pyyaml: bump to
 version 3.13
Message-ID: <20190124161401.62E0C890FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfc00651e9e1dd409b813a855676e5932dc63807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:
http://autobuild.buildroot.net/results/e71/e715a7dc8b6856b4aba0b9b4568d61420c52a5c8

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fbe289f1450c3a20ade5444b40b03c1d6d074ded)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyyaml/python-pyyaml.hash | 6 +++---
 package/python-pyyaml/python-pyyaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index 209ab27e53..47a379ce6a 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/pyyaml/json, sha256 locally computed
-md5 4c129761b661d181ebf7ff4eb2d79950 PyYAML-3.12.tar.gz
-sha256 592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab PyYAML-3.12.tar.gz
+# md5, sha256 from https://pypi.python.org/pypi/pyyaml/json
+md5 b78b96636d68ac581c0e2f38158c224f PyYAML-3.13.tar.gz
+sha256 3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf PyYAML-3.13.tar.gz
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index beeaf88e96..cbf8df7b2d 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYYAML_VERSION = 3.12
+PYTHON_PYYAML_VERSION = 3.13
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a
+PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769
 PYTHON_PYYAML_SETUP_TYPE = distutils
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
