From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  9 Oct 2018 19:22:26 +0300
Subject: [Buildroot] [PATCH 1/1] python-engineio: bump to version 2.3.2
Message-ID: <20181009162226.7432-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 35db7e443a..7bf1a49410 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	c39f7460f3a3cfaf37933415223d088a  python-engineio-2.3.1.tar.gz
-sha256	f0fb8bbf8fde2da123258d08e0cc404f65a517b31685411ff933e58b8aec3141  python-engineio-2.3.1.tar.gz
+md5	92d2e1b62083ce8f0dcd8fd905b0dd9d  python-engineio-2.3.2.tar.gz
+sha256	871f4d022eb9171e380281266ba2aef0759b264ba862350bc94e7a597a98a443  python-engineio-2.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 06c558d199..e730c39cd2 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 2.3.1
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/f7/20/984649ea01e6aaf5256a6f7280d12c1c00d421d08c4f5660986a7aca7604
+PYTHON_ENGINEIO_VERSION = 2.3.2
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/66/18/09516793c68e0f7fb759d54c109a09a86e31c3e685eb77884613a1c1a7b3
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.17.1
