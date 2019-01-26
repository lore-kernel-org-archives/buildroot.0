From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 26 Jan 2019 08:33:14 +0200
Subject: [Buildroot] [PATCH 1/1] python-pip: bump to version 19.0.1
In-Reply-To: <20190126063316.10832-1-asafka7@gmail.com>
References: <20190126063316.10832-1-asafka7@gmail.com>
Message-ID: <20190126063316.10832-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License change - a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pip/python-pip.hash | 6 +++---
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 1a70f0f7c2..149099b118 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5	75cad449ad62c88b22de317a26781714  pip-18.1.tar.gz
-sha256	c0a292bd977ef590379a3f05d7b7f65135487b67470f6281289a94e015650ea1  pip-18.1.tar.gz
+md5    b6919f1a368138f73b367abccc06f5ae  pip-19.0.1.tar.gz
+sha256 e81ddd35e361b630e94abeda4a1eddd36d47a90e71eb00f38f46b57f787cd1a5  pip-19.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	391a8784e319dae5431477d4cc9bc504fc5d71fd9e89e1c80f1cd3855f5d7cfa  LICENSE.txt
+sha256 5ba21fbb0964f936ad7d15362d1ed6d4931cc8c8f9ff2d4d91190e109be74431  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 9ae7e7324f..22562cc93f 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 18.1
+PYTHON_PIP_VERSION = 19.0.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/45/ae/8a0ad77defb7cc903f09e551d88b443304a9bd6e6f124e75c0fbbf6de8f7
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/c8/89/ad7f27938e59db1f0f55ce214087460f65048626e2226531ba6cb6da15f0
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.19.1
