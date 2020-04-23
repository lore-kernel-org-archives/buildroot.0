From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:10:05 +0200
Subject: [Buildroot] [git commit] package/python-colorama: bump to 0.4.3
Message-ID: <20200423195713.9083D8FC66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d329c4b71f89b75ac9697eddb9f08d2dc2ca87e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-colorama/python-colorama.hash | 5 ++---
 package/python-colorama/python-colorama.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-colorama/python-colorama.hash b/package/python-colorama/python-colorama.hash
index 06f61f80af..312b9e1f7d 100644
--- a/package/python-colorama/python-colorama.hash
+++ b/package/python-colorama/python-colorama.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/colorama/json
-md5	f927529cd1735f6f50ee2c61628e9c1f  colorama-0.4.1.tar.gz
-sha256	05eed71e2e327246ad6b38c540c4a3117230b19679b875190486ddd2d721422d  colorama-0.4.1.tar.gz
+# sha256 from https://pypi.org/pypi/colorama/json
+sha256  e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1  colorama-0.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256	cac35c02686e5d04a5a7140bfb3b36e73aed496656e891102e428886d7930318  LICENSE.txt
diff --git a/package/python-colorama/python-colorama.mk b/package/python-colorama/python-colorama.mk
index 2f4bc5e1f1..6117b853a2 100644
--- a/package/python-colorama/python-colorama.mk
+++ b/package/python-colorama/python-colorama.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORAMA_VERSION = 0.4.1
+PYTHON_COLORAMA_VERSION = 0.4.3
 PYTHON_COLORAMA_SOURCE = colorama-$(PYTHON_COLORAMA_VERSION).tar.gz
-PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/76/53/e785891dce0e2f2b9f4b4ff5bc6062a53332ed28833c7afede841f46a5db
+PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/82/75/f2a4c0c94c85e2693c229142eb448840fba0f9230111faa889d1f541d12d
 PYTHON_COLORAMA_SETUP_TYPE = setuptools
 PYTHON_COLORAMA_LICENSE = BSD-3-Clause
 PYTHON_COLORAMA_LICENSE_FILES = LICENSE.txt
