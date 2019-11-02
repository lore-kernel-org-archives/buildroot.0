From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 10:09:37 +0100
Subject: [Buildroot] [git commit] package/python-engineio: bump to version
 3.10.0
Message-ID: <20191102090554.0DD6B8E519@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53765075edff8a7b6e5292a472b41c22a27940d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index cf6acb60aa..f10e69af65 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5	11a4f18f5b08a36d07d3c0ff85e7c047  python-engineio-3.9.3.tar.gz
-sha256	2a4c874aea686e79f8ea9efc30748110df581df6d577d18bb5eaa1a8f2199d12  python-engineio-3.9.3.tar.gz
+md5	bec3b06a112a7f09a0a9c92b627282fe  python-engineio-3.10.0.tar.gz
+sha256	9c9a6035b4b5e5a225f426f846afa14cf627f7571d1ae02167cb703fefd134b7  python-engineio-3.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index cfc7fcaf63..62036a9c76 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 3.9.3
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/f4/e4/d46daeb6010781d56f3468d0ad4e11e2d44aafc4ec521327a19d80f536f2
+PYTHON_ENGINEIO_VERSION = 3.10.0
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/78/8e/c58cf2725fd17d65b9fe818b70aff4ccce4903b47aaee6f4321727a8b8bb
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
