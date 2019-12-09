From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Dec 2019 22:08:16 +0100
Subject: [Buildroot] [git commit] package/python-yarl: bump to version 1.4.2
Message-ID: <20191209210631.2BF7D88F66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6be7438d36deb1920472114fcd47e9612d5dec4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 1cb0708435..b3910e9aff 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5	92889c31fce4c8f82b7ee9c2b2ed9cd1  yarl-1.3.0.tar.gz
-sha256	024ecdc12bc02b321bc66b41327f930d1c2c543fa9a561b39861da9388ba7aa9  yarl-1.3.0.tar.gz
+md5	08ba0d6e18f460b44d9e5459f3d217ba  yarl-1.4.2.tar.gz
+sha256	58cd9c469eced558cd81aa3f484b2924e8897049e06889e8ff2510435b7ef74b  yarl-1.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256	14c0820503ceef15e814a89b037d9efc066870087018294b6ae0f27163872cc5  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index f185724781..1f9b95a9c9 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.3.0
+PYTHON_YARL_VERSION = 1.4.2
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/fb/84/6d82f6be218c50b547aa29d0315e430cf8a23c52064c92d0a8377d7b7357
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/d6/67/6e2507586eb1cfa6d55540845b0cd05b4b77c414f6bca8b00b45483b976e
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
