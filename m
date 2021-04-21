From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 22:43:25 +0200
Subject: [Buildroot] [git commit] package/python-mbstrdecoder: bump to
 version 1.0.1
Message-ID: <20210421201644.084BF800C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d07dc9660d6a4216cd59ab01ab0007fcbb5f5425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/thombashi/mbstrdecoder/releases/tag/v1.0.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 4 ++--
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index f8103b0add..296930f607 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mbstrdecoder/json
-md5  3ab822b853bfd2f08e35ba85c1ac2e2e  mbstrdecoder-1.0.0.tar.gz
-sha256  9df7778c0c051c98f6b5a848909202e5cd423c9692665b20d1a9bd0f771b8235  mbstrdecoder-1.0.0.tar.gz
+md5  aa377cfa117318583dffa1fd96123bdf  mbstrdecoder-1.0.1.tar.gz
+sha256  f895e1fb97496855ab5e43de99588787169c01f782c71625142d1a62729e9f9d  mbstrdecoder-1.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index 4a768ef695..6474324b78 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 1.0.0
+PYTHON_MBSTRDECODER_VERSION = 1.0.1
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/5e/05/7dd1704e3e1522757708f59e727b540a6e5032ba6bb20e73851da7111b11
+PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/b7/3b/2524dd4771dfca572269036fb08356715cb78a1c1c2a4dae3a810a86b777
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
