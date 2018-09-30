From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:36:45 +0200
Subject: [Buildroot] [git commit] python-engineio: bump to version 2.3.1
Message-ID: <20180930084530.EFE9188E82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61a1e02a89d0c68bec9a41300c0d1a9d5bd325a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 37c34dff16..35db7e443a 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	d281583ae81bcaa4acc4bd6fd4faab86  python-engineio-2.3.0.tar.gz
-sha256	eb4d28b7c6ae053f7ed50e688011b228ce8354dfdbf032220b76b3fc20d5f943  python-engineio-2.3.0.tar.gz
+md5	c39f7460f3a3cfaf37933415223d088a  python-engineio-2.3.1.tar.gz
+sha256	f0fb8bbf8fde2da123258d08e0cc404f65a517b31685411ff933e58b8aec3141  python-engineio-2.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index bf674d767b..06c558d199 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 2.3.0
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/f1/6f/3b872dce14b381b2724d33cf9133c6d3e599f1e85e1f8ab75b01d243bf9e
+PYTHON_ENGINEIO_VERSION = 2.3.1
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/f7/20/984649ea01e6aaf5256a6f7280d12c1c00d421d08c4f5660986a7aca7604
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
