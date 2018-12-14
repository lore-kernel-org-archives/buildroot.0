From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 14 Dec 2018 07:26:56 +0200
Subject: [Buildroot] [PATCH 1/1] python-yarl: bump to version 1.3.0
In-Reply-To: <20181214052656.27280-1-asafka7@gmail.com>
References: <20181214052656.27280-1-asafka7@gmail.com>
Message-ID: <20181214052656.27280-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-yarl/python-yarl.hash | 6 +++---
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 118c7225d8..1cb0708435 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.python.org/pypi/yarl/json
-md5	43380667129ebc52ac3c442daabb3f6d  yarl-1.2.6.tar.gz
-sha256	c8cbc21bbfa1dd7d5386d48cc814fe3d35b80f60299cdde9279046f399c3b0d8  yarl-1.2.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/yarl/json
+md5	92889c31fce4c8f82b7ee9c2b2ed9cd1  yarl-1.3.0.tar.gz
+sha256	024ecdc12bc02b321bc66b41327f930d1c2c543fa9a561b39861da9388ba7aa9  yarl-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	14c0820503ceef15e814a89b037d9efc066870087018294b6ae0f27163872cc5  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 591131e4a2..f185724781 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.2.6
+PYTHON_YARL_VERSION = 1.3.0
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/43/b8/057c3e5b546ff4b24263164ecda13f6962d85c9dc477fcc0bcdcb3adb658
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/fb/84/6d82f6be218c50b547aa29d0315e430cf8a23c52064c92d0a8377d7b7357
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.19.1
