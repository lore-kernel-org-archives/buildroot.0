From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 09:20:25 +0200
Subject: [Buildroot] [git commit] package/python{3}-setuptools: bump to
 version 41.0.1
Message-ID: <20190501072307.D629283D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6559256f66e1b06c4b7c2ab07fb879aa1fe7b7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 package/python3-setuptools/python3-setuptools.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 53d77f57d2..1baccf309d 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  1fbcbe45c7fb1d21041e676ba68d2dec  setuptools-40.6.3.zip
-sha256  3b474dad69c49f0d2d86696b68105f3a6f195f7ab655af12ef9a9c326d2b08f8  setuptools-40.6.3.zip
+md5  6404ca798bb9a9073aff3b91b2df35c8  setuptools-41.0.1.zip
+sha256  a222d126f5471598053c9a77f4b5d4f26eaa1f150ad6e01dcf1a42e185d05613  setuptools-41.0.1.zip
 sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 015347d49b..8a0717a61f 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python3-setuptools/python3-setuptools.mk
-PYTHON_SETUPTOOLS_VERSION = 40.6.3
+PYTHON_SETUPTOOLS_VERSION = 41.0.1
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/37/1b/b25507861991beeade31473868463dad0e58b1978c209de27384ae541b0b
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index b6de5d4b25..55be0a3141 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 40.6.3
+PYTHON3_SETUPTOOLS_VERSION = 41.0.1
 PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/37/1b/b25507861991beeade31473868463dad0e58b1978c209de27384ae541b0b
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
