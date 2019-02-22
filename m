From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 22 Feb 2019 10:53:21 +0200
Subject: [Buildroot] [PATCH 1/1] python-pip: bump to version 19.0.3
In-Reply-To: <20190222085324.7343-1-asafka7@gmail.com>
References: <20190222085324.7343-1-asafka7@gmail.com>
Message-ID: <20190222085324.7343-2-asafka7@gmail.com>
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
index 149099b118..f2a6b25012 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5    b6919f1a368138f73b367abccc06f5ae  pip-19.0.1.tar.gz
-sha256 e81ddd35e361b630e94abeda4a1eddd36d47a90e71eb00f38f46b57f787cd1a5  pip-19.0.1.tar.gz
+md5	1c5edb0924a0d7d79f3a2e3df05009b4  pip-19.0.3.tar.gz
+sha256	6e6f197a1abfb45118dbb878b5c859a0edbdd33fd250100bc015b67fded4b9f2  pip-19.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256 5ba21fbb0964f936ad7d15362d1ed6d4931cc8c8f9ff2d4d91190e109be74431  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 22562cc93f..c7ca45d9d9 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 19.0.1
+PYTHON_PIP_VERSION = 19.0.3
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/c8/89/ad7f27938e59db1f0f55ce214087460f65048626e2226531ba6cb6da15f0
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/36/fa/51ca4d57392e2f69397cd6e5af23da2a8d37884a605f9e3f2d3bfdc48397
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.19.1
