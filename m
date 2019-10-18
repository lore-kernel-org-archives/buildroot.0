From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:04 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pip: bump to version 19.3.1
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-7-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And fix indentation in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pip/python-pip.hash | 6 +++---
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 48666c358d..7d02a51023 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5	f417444c66a0db1a82c8d9d2283a2f95  pip-19.2.3.tar.gz
-sha256	e7a31f147974362e6c82d84b91c7f2bdf57e4d3163d3d454e6c3e71944d67135  pip-19.2.3.tar.gz
+md5	1aaaf90fbafc50e7ba1e66ffceb00960  pip-19.3.1.tar.gz
+sha256	21207d76c1031e517668898a6b46a9fb1501c7a4710ef5dfd6a40ad9e6757ea7  pip-19.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256 5ba21fbb0964f936ad7d15362d1ed6d4931cc8c8f9ff2d4d91190e109be74431  LICENSE.txt
+sha256	5ba21fbb0964f936ad7d15362d1ed6d4931cc8c8f9ff2d4d91190e109be74431  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index b1d4aa7bfd..b8be234d24 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 19.2.3
+PYTHON_PIP_VERSION = 19.3.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/00/9e/4c83a0950d8bdec0b4ca72afd2f9cea92d08eb7c1a768363f2ea458d08b4
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/ce/ea/9b445176a65ae4ba22dce1d93e4b5fe182f953df71a145f557cffaffc1bf
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
