From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat,  9 Feb 2019 17:05:22 +0200
Subject: [Buildroot] [PATCH 1/1] python-pip: bump to version 19.0.2
In-Reply-To: <20190209150522.10460-1-asafka7@gmail.com>
References: <20190209150522.10460-1-asafka7@gmail.com>
Message-ID: <20190209150522.10460-3-asafka7@gmail.com>
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
index 149099b118..96baf04a00 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5    b6919f1a368138f73b367abccc06f5ae  pip-19.0.1.tar.gz
-sha256 e81ddd35e361b630e94abeda4a1eddd36d47a90e71eb00f38f46b57f787cd1a5  pip-19.0.1.tar.gz
+md5	526fd9ec1e6ea956b3571ebfb42cf83c  pip-19.0.2.tar.gz
+sha256	f851133f8b58283fa50d8c78675eb88d4ff4cde29b6c41205cd938b06338e0e5  pip-19.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256 5ba21fbb0964f936ad7d15362d1ed6d4931cc8c8f9ff2d4d91190e109be74431  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 22562cc93f..94926fce09 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 19.0.1
+PYTHON_PIP_VERSION = 19.0.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/c8/89/ad7f27938e59db1f0f55ce214087460f65048626e2226531ba6cb6da15f0
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/4c/4d/88bc9413da11702cbbace3ccc51350ae099bb351febae8acc85fec34f9af
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.19.1
