From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  1 Aug 2020 14:00:55 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.5.1
Message-ID: <20200801200055.80723-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yarl/python-yarl.hash | 6 +++---
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index b3910e9aff..95ee7ef88d 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5	08ba0d6e18f460b44d9e5459f3d217ba  yarl-1.4.2.tar.gz
-sha256	58cd9c469eced558cd81aa3f484b2924e8897049e06889e8ff2510435b7ef74b  yarl-1.4.2.tar.gz
+md5  a9b20bf0b8a6962e1101b28908a67bf8  yarl-1.5.1.tar.gz
+sha256  c22c75b5f394f3d47105045ea551e08a3e804dc7e01b37800ca35b58f856c3d6  yarl-1.5.1.tar.gz
 # Locally computed sha256 checksums
-sha256	14c0820503ceef15e814a89b037d9efc066870087018294b6ae0f27163872cc5  LICENSE
+sha256  14c0820503ceef15e814a89b037d9efc066870087018294b6ae0f27163872cc5  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 1f9b95a9c9..0b92e6281a 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.4.2
+PYTHON_YARL_VERSION = 1.5.1
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/d6/67/6e2507586eb1cfa6d55540845b0cd05b4b77c414f6bca8b00b45483b976e
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/ac/dd/59768bb3fa08e8b23e91575bca3ff8d2edbfbceebec8c59eaa24c4215791
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.25.1
