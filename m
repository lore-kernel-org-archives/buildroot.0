From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Sep 2018 11:51:29 +0200
Subject: [Buildroot] [git commit] python-autobahn: bump to version 18.9.2
Message-ID: <20180928095058.8AB4088FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29afd40b4bebce4e1ae1ca1b6683270a49f3e232
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 8 ++++----
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index f2d4993ddf..a59ee2df5d 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5    efddc3394c4e11f85bfa108c12a9346c  autobahn-18.9.1.tar.gz
-sha256 829fbeb08b7e0f7e8cd14d9d169043a861075c3f6e5e2739d564dc985b5e7015  autobahn-18.9.1.tar.gz
-# Locally computed
-sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
+md5	e8192e3a4bb7dc59db2a82234b13b080  autobahn-18.9.2.tar.gz
+sha256	d98b924f06865700116ee616027e4a6d678004a7b44e0d01cb262eab333112d6  autobahn-18.9.2.tar.gz
+# Locally computed sha256 checksums
+sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 31bd99e783..1668b241b0 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 18.9.1
+PYTHON_AUTOBAHN_VERSION = 18.9.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/3e/21/2074cfca5addf4f0c7e422798c50c85255ee5963889ee8b32edb06e47221
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/68/f8/43ef6e614f27a97a88a6e91768d3917adff630936ec71665fcc3bec48e53
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
