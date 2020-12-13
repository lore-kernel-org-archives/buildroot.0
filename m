From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 10:21:23 +0100
Subject: [Buildroot] [git commit] package/python-colorama: bump to version
 0.4.4
Message-ID: <20201213091419.3EFDA814A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e981b66cdaa1ef04c9c7ee57968ab4149a39ce78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-colorama/python-colorama.hash | 7 ++++---
 package/python-colorama/python-colorama.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-colorama/python-colorama.hash b/package/python-colorama/python-colorama.hash
index 312b9e1f7d..e975a66363 100644
--- a/package/python-colorama/python-colorama.hash
+++ b/package/python-colorama/python-colorama.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/colorama/json
-sha256  e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1  colorama-0.4.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/colorama/json
+md5  57b22f2597f63df051b69906fbf310cc  colorama-0.4.4.tar.gz
+sha256  5941b2b48a20143d2267e95b1c2a7603ce057ee39fd88e7329b0c292aa16869b  colorama-0.4.4.tar.gz
 # Locally computed sha256 checksums
-sha256	cac35c02686e5d04a5a7140bfb3b36e73aed496656e891102e428886d7930318  LICENSE.txt
+sha256  cac35c02686e5d04a5a7140bfb3b36e73aed496656e891102e428886d7930318  LICENSE.txt
diff --git a/package/python-colorama/python-colorama.mk b/package/python-colorama/python-colorama.mk
index 6117b853a2..d3d29a63e9 100644
--- a/package/python-colorama/python-colorama.mk
+++ b/package/python-colorama/python-colorama.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORAMA_VERSION = 0.4.3
+PYTHON_COLORAMA_VERSION = 0.4.4
 PYTHON_COLORAMA_SOURCE = colorama-$(PYTHON_COLORAMA_VERSION).tar.gz
-PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/82/75/f2a4c0c94c85e2693c229142eb448840fba0f9230111faa889d1f541d12d
+PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/1f/bb/5d3246097ab77fa083a61bd8d3d527b7ae063c7d8e8671b1cf8c4ec10cbe
 PYTHON_COLORAMA_SETUP_TYPE = setuptools
 PYTHON_COLORAMA_LICENSE = BSD-3-Clause
 PYTHON_COLORAMA_LICENSE_FILES = LICENSE.txt
