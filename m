From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:32:07 +0200
Subject: [Buildroot] [git commit] python-autobahn: bump to version 18.9.1
Message-ID: <20180908133537.2D7278365B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8a5501cda50a65ed9d85b220b93150265f81e49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 7 ++++---
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 32c99167e9..f2d4993ddf 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/autobahn/json, sha256 locally computed
-md5	f8c8d74bf73644719b751e6fb11dc4a3  autobahn-17.10.1.tar.gz
-sha256	8cf74132a18da149c5ea3dcbb5e055f6f4fe5a0238b33258d29e89bd276a8078  autobahn-17.10.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/autobahn/json
+md5    efddc3394c4e11f85bfa108c12a9346c  autobahn-18.9.1.tar.gz
+sha256 829fbeb08b7e0f7e8cd14d9d169043a861075c3f6e5e2739d564dc985b5e7015  autobahn-18.9.1.tar.gz
+# Locally computed
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 3ba91c5e14..31bd99e783 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 17.10.1
+PYTHON_AUTOBAHN_VERSION = 18.9.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://pypi.python.org/packages/e4/2e/01a64212b1eb580d601fa20f146c962235e3493795f46e3b254597ec635d
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/3e/21/2074cfca5addf4f0c7e422798c50c85255ee5963889ee8b32edb06e47221
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
