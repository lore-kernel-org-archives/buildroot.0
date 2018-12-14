From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Dec 2018 21:29:31 +0100
Subject: [Buildroot] [git commit] python-setuptools: bump to version 40.6.3
Message-ID: <20181214202637.B673584659@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34c5558e66a8675ffc07943dde433e5e0d672328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index a034ee8015..53d77f57d2 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  1c45c7d66dc84ae4ee36581dc9e5359b  setuptools-40.6.2.zip
-sha256  86bb4d8e1b0fabad1f4642b64c335b673e53e7a381de03c9a89fe678152c4c64  setuptools-40.6.2.zip
+md5  1fbcbe45c7fb1d21041e676ba68d2dec  setuptools-40.6.3.zip
+sha256  3b474dad69c49f0d2d86696b68105f3a6f195f7ab655af12ef9a9c326d2b08f8  setuptools-40.6.3.zip
 sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 0f28152e54..cc6f991cdd 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 40.6.2
+PYTHON_SETUPTOOLS_VERSION = 40.6.3
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/d1/8acb42f391cba52e35b131e442e80deffbb8d0676b93261d761b1f0ef8fb
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/37/1b/b25507861991beeade31473868463dad0e58b1978c209de27384ae541b0b
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
