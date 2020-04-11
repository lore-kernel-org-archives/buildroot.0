From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:06:42 +0200
Subject: [Buildroot] [git commit] package/python-fire: bump to version 0.3.1
Message-ID: <20200411075350.1A9A07FAEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7940daf41b0842ea25bd05142c9e18e2f091683c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And use two spaces for license file indentation.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fire/python-fire.hash | 6 +++---
 package/python-fire/python-fire.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
index 411270b70e..a6a2df8c00 100644
--- a/package/python-fire/python-fire.hash
+++ b/package/python-fire/python-fire.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fire/json
-md5	9f3a91c285b50351d039b6f0bb91aac3  fire-0.2.1.tar.gz
-sha256	6865fefc6981a713d2ce56a2a2c92c56c729269f74a6cddd6f4b94d16ae084c9  fire-0.2.1.tar.gz
+md5  af6da611394a2332fbd5bd9f1227254e  fire-0.3.1.tar.gz
+sha256  9736a16227c3d469e5d2d296bce5b4d8fa8d7851e953bda327a455fc2994307f  fire-0.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256	a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
+sha256  a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index 6471a4d143..343abbca7d 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FIRE_VERSION = 0.2.1
+PYTHON_FIRE_VERSION = 0.3.1
 PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
-PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/d9/69/faeaae8687f4de0f5973694d02e9d6c3eb827636a009157352d98de1129e
+PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/34/a7/0e22e70778aca01a52b9c899d9c145c6396d7b613719cd63db97ffa13f2f
 PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
