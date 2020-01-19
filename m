From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2020 23:27:17 +0100
Subject: [Buildroot] [git commit] package/python-pycares: bump to version
 3.1.1
Message-ID: <20200119221830.81C1C82AB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4b8d836ecfc51c59328c52bf62d2e5d1f7cf38e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 63f5d88aeb..c8c46175dc 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5	9d71bb8654cd2f7f34bdfe0ba641b59c  pycares-3.1.0.tar.gz
-sha256	663c000625725d3a63466a674df4ee7f62bf8ca1ae8a0b87a6411eb811e0e794  pycares-3.1.0.tar.gz
+md5	8ac802d79b318efa27d3a9949d0604d1  pycares-3.1.1.tar.gz
+sha256	18dfd4fd300f570d6c4536c1d987b7b7673b2a9d14346592c5d6ed716df0d104  pycares-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256	427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index ecac40fd2d..dea34f82bf 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 3.1.0
+PYTHON_PYCARES_VERSION = 3.1.1
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/50/39/d7d4e85041e95c12ccca220663328709da81f75f5e86d76049f0937e9f83
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/4e/09/f49ef1c4b6a5ad50fc08a8acd015f1938594dd7a6b4a6a96d049d9bbec7d
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
