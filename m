From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:28 -0000
Subject: [Buildroot] [git commit] python-setuptools: bump to version 40.6.2
Message-ID: <20181202071555.C8BF68A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff039a3257286c50e7b384f5f43d34ebaa314738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 05d9312c78..a034ee8015 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  12f8546ead968a0c237732d53fe7fcb1  setuptools-40.5.0.zip
-sha256  2a2a200f4a760adbded23a091a00be2eca4e28efed65c6120ea275f7e89a1eab  setuptools-40.5.0.zip
+md5  1c45c7d66dc84ae4ee36581dc9e5359b  setuptools-40.6.2.zip
+sha256  86bb4d8e1b0fabad1f4642b64c335b673e53e7a381de03c9a89fe678152c4c64  setuptools-40.6.2.zip
 sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 3dca7094e8..0f28152e54 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 40.5.0
+PYTHON_SETUPTOOLS_VERSION = 40.6.2
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/26/e5/9897eee1100b166a61f91b68528cb692e8887300d9cbdaa1a349f6304b79
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/d1/8acb42f391cba52e35b131e442e80deffbb8d0676b93261d761b1f0ef8fb
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
