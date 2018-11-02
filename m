From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  2 Nov 2018 10:53:41 +0200
Subject: [Buildroot] [PATCH 1/1] python-pip: bump to version 18.1
In-Reply-To: <20181102085341.29421-1-asafka7@gmail.com>
References: <20181102085341.29421-1-asafka7@gmail.com>
Message-ID: <20181102085341.29421-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index c9b574a6dd..1a70f0f7c2 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5	52f75ceb21e96c258f289859a2996b60  pip-18.0.tar.gz
-sha256	a0e11645ee37c90b40c46d607070c4fd583e2cd46231b1c06e389c5e814eed76  pip-18.0.tar.gz
+md5	75cad449ad62c88b22de317a26781714  pip-18.1.tar.gz
+sha256	c0a292bd977ef590379a3f05d7b7f65135487b67470f6281289a94e015650ea1  pip-18.1.tar.gz
 # Locally computed sha256 checksums
 sha256	391a8784e319dae5431477d4cc9bc504fc5d71fd9e89e1c80f1cd3855f5d7cfa  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 0a0dce5bca..9ae7e7324f 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 18.0
+PYTHON_PIP_VERSION = 18.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/69/81/52b68d0a4de760a2f1979b0931ba7889202f302072cc7a0d614211bc7579
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/45/ae/8a0ad77defb7cc903f09e551d88b443304a9bd6e6f124e75c0fbbf6de8f7
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.19.1
