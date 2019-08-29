From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:18:15 +0200
Subject: [Buildroot] [git commit branch/next] package/python-ptyprocess:
 bump to version 0.6.0
Message-ID: <20190829202159.DC2C68839C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a50813f1b82b1650951476c5cb138384d1a1f0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ptyprocess/python-ptyprocess.hash | 8 +++++---
 package/python-ptyprocess/python-ptyprocess.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-ptyprocess/python-ptyprocess.hash b/package/python-ptyprocess/python-ptyprocess.hash
index 0e2e0aeda4..3af431a756 100644
--- a/package/python-ptyprocess/python-ptyprocess.hash
+++ b/package/python-ptyprocess/python-ptyprocess.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org, sha256 locally computed
-md5	94e537122914cc9ec9c1eadcd36e73a1 ptyprocess-0.5.1.tar.gz
-sha256 0530ce63a9295bfae7bd06edc02b6aa935619f486f0f1dc0972f516265ee81a6  ptyprocess-0.5.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ptyprocess/json
+md5	37402d69f3b50913d4d483587bffad8f  ptyprocess-0.6.0.tar.gz
+sha256	923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0  ptyprocess-0.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256	c822d385b1a73329846241799becf18690b5d44764c1bed69300b536a405030a  LICENSE
diff --git a/package/python-ptyprocess/python-ptyprocess.mk b/package/python-ptyprocess/python-ptyprocess.mk
index 59329d01e0..45102e9aa7 100644
--- a/package/python-ptyprocess/python-ptyprocess.mk
+++ b/package/python-ptyprocess/python-ptyprocess.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PTYPROCESS_VERSION = 0.5.1
-PYTHON_PTYPROCESS_SITE = https://pypi.python.org/packages/source/p/ptyprocess
+PYTHON_PTYPROCESS_VERSION = 0.6.0
+PYTHON_PTYPROCESS_SITE = https://files.pythonhosted.org/packages/7d/2d/e4b8733cf79b7309d84c9081a4ab558c89d8c89da5961bf4ddb050ca1ce0
 PYTHON_PTYPROCESS_SOURCE = ptyprocess-$(PYTHON_PTYPROCESS_VERSION).tar.gz
 PYTHON_PTYPROCESS_LICENSE = ISC
 PYTHON_PTYPROCESS_LICENSE_FILES = LICENSE
