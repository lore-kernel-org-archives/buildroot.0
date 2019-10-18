From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 21:12:13 +0200
Subject: [Buildroot] [git commit] package/python-texttable: bump to version
 1.6.2
Message-ID: <20191018191755.DC7F6826B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5145bb1ca4700ac6eb2dbb0238675e438c991200
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Switch _SETUP_TYPE to setuptools instead of distutils.
* License has changed to MIT (updated LICENSE, PKG-INFO, setup.py,
  sources files, etc.)

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-texttable/python-texttable.hash | 9 +++++----
 package/python-texttable/python-texttable.mk   | 8 ++++----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
index 448d6b7dd1..367eb8d60f 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/texttable/json, sha256 locally computed
-md5	a712b5a5464d51c5fc43c64d9d2cd0de  texttable-0.9.1.tar.gz
-sha256	119041773ff03596b56392532f9315cb3a3116e404fd6f36e76a7dc088d95c79  texttable-0.9.1.tar.gz
-sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE
+# md5, sha256 from https://pypi.org/pypi/texttable/json
+md5	763141f0bdf598cdc5cf780ed4d2eb94  texttable-1.6.2.tar.gz
+sha256	eff3703781fbc7750125f50e10f001195174f13825a92a45e9403037d539b4f4  texttable-1.6.2.tar.gz
+# Locally computed sha256 checksums
+sha256	181d0c3366cc36fd6ae7d023b23a743581003fd42974c8983ea40f7161faeaf3  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 96fe6cf882..3b173a35ee 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 0.9.1
+PYTHON_TEXTTABLE_VERSION = 1.6.2
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://pypi.python.org/packages/02/e1/2565e6b842de7945af0555167d33acfc8a615584ef7abd30d1eae00a4d80
-PYTHON_TEXTTABLE_SETUP_TYPE = distutils
-PYTHON_TEXTTABLE_LICENSE = LGPL-3.0+
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/82/a8/60df592e3a100a1f83928795aca210414d72cebdc6e4e0c95a6d8ac632fe
+PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
+PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
