From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2020 19:45:55 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.6.3
Message-ID: <20201123024555.1979033-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 95ee7ef88d..783702c74b 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  a9b20bf0b8a6962e1101b28908a67bf8  yarl-1.5.1.tar.gz
-sha256  c22c75b5f394f3d47105045ea551e08a3e804dc7e01b37800ca35b58f856c3d6  yarl-1.5.1.tar.gz
+md5  3b6f2da3db8c645a9440375fd6a414eb  yarl-1.6.3.tar.gz
+sha256  8a9066529240171b68893d60dca86a763eae2139dd42f42106b03cf4b426bf10  yarl-1.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  14c0820503ceef15e814a89b037d9efc066870087018294b6ae0f27163872cc5  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 0b92e6281a..32ec477064 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.5.1
+PYTHON_YARL_VERSION = 1.6.3
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/ac/dd/59768bb3fa08e8b23e91575bca3ff8d2edbfbceebec8c59eaa24c4215791
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/97/e7/af7219a0fe240e8ef6bb555341a63c43045c21ab0392b4435e754b716fa1
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.25.1
