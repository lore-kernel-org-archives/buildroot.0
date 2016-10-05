From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:46 +0200
Subject: [Buildroot] [git commit] package/python-paramiko: bump version to
	2.0.2
Message-ID: <20161005210758.986D98042B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8816ba2e6c064ff673e082ef5c2289552e77b372
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-paramiko/python-paramiko.hash | 7 +++----
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 29af27d..f2aedc7 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/paramiko/json
-md5	7e1203f5ffeb7d2bc2bffc4feb804216  paramiko-1.16.0.tar.gz
-# sha256 calculated by scanpypi
-sha256	3297ebd3cd072f573772f7c7426939a443c62c458d54bb632ff30fd6ecf96892  paramiko-1.16.0.tar.gz
+# md5 from https://pypi.python.org/pypi/paramiko/json, sha256 locally computed
+md5	6312aee79892801cf5a624eb4f8fd864  paramiko-2.0.2.tar.gz
+sha256	411bf90fa22b078a923ff19ef9772c1115a0953702db93549a2848acefd141dc  paramiko-2.0.2.tar.gz
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 52822bb..e616049 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 1.16.0
+PYTHON_PARAMIKO_VERSION = 2.0.2
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://pypi.python.org/packages/source/p/paramiko
+PYTHON_PARAMIKO_SITE = https://pypi.python.org/packages/6b/4e/971b8c917456a2ec9666311f7e695493002a64022397cd668150b5efd2a8
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPLv2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
