From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:19:20 +0200
Subject: [Buildroot] [git commit] package/python-fire: bump to version 0.2.1
Message-ID: <20191002201426.AA3F781E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18635a2fe22c88dcf57ea4f430cf12ba619c0153
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fire/python-fire.hash | 4 ++--
 package/python-fire/python-fire.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
index 6c48950b7a..411270b70e 100644
--- a/package/python-fire/python-fire.hash
+++ b/package/python-fire/python-fire.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fire/json
-md5	dccf1cbd740146d52d9896e4a5ba673e  fire-0.2.0.tar.gz
-sha256	cdae28ea728d6cad487c900d534426d2cd09ddd2993287a885ff7c8accb097c8  fire-0.2.0.tar.gz
+md5	9f3a91c285b50351d039b6f0bb91aac3  fire-0.2.1.tar.gz
+sha256	6865fefc6981a713d2ce56a2a2c92c56c729269f74a6cddd6f4b94d16ae084c9  fire-0.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256	a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index 2573a577db..6471a4d143 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FIRE_VERSION = 0.2.0
+PYTHON_FIRE_VERSION = 0.2.1
 PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
-PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/40/6e/48cf0cffb7bf0bb58746bff99ed2d1a2769a32c4d74c06f988eb3e554f86
+PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/d9/69/faeaae8687f4de0f5973694d02e9d6c3eb827636a009157352d98de1129e
 PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
