From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:14:32 +0200
Subject: [Buildroot] [git commit] python-ipython: bump to version 5.8.0
Message-ID: <20181008191611.354288E4DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3642ff48407187d443e579d7b4524551004b2f40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ipython/python-ipython.hash | 8 +++++---
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index af1ed94b7a..41bdd70feb 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/ipython/json, sha256 locally computed
-md5 d8cc938f46801060239184a35ec9c5a6 ipython-5.4.0.tar.gz
-sha256 6907826c427c917bf0cdab71ee728288b1f1975c4b94b3ed608b67db3183c974 ipython-5.4.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ipython/json
+md5 7014b8824981eef2cb893ea5398d6b8d ipython-5.8.0.tar.gz
+sha256 4bac649857611baaaf76bc82c173aa542f7486446c335fe1a6c05d0d491c8906 ipython-5.8.0.tar.gz
+# Locally computed sha256
+sha256 a5d87689342ec47cebdf623af06cec734c607666c696fe48271f2ff91752443d COPYING.rst
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 5d92546fe0..79a48bf43d 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 5.4.0
+PYTHON_IPYTHON_VERSION = 5.8.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/36/cd/765f53135bbbbcd691858aba3af124453a230fe0c752f009f69012fce5d5
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/41/a6/2d25314b1f9375639d8f8e0f8052e8cec5df511d3449f22c4f1c2d8cb3c6
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
 PYTHON_IPYTHON_SETUP_TYPE = distutils
