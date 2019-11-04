From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:13:07 +0100
Subject: [Buildroot] [git commit] package/python-dateutil: bump to version
 2.8.1
Message-ID: <20191104210612.EA87C8E6E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b90eaa206e65656204e9d4d292e36d31f18ab965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dateutil/python-dateutil.hash | 4 ++--
 package/python-dateutil/python-dateutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
index eecba7d35a..f3dc69f272 100644
--- a/package/python-dateutil/python-dateutil.hash
+++ b/package/python-dateutil/python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dateutil/json
-md5	354db28843d949f1bc3e49e8458e22df  python-dateutil-2.8.0.tar.gz
-sha256	c89805f6f4d64db21ed966fda138f8a5ed7a4fdbc1a8ee329ce1b74e3c74da9e  python-dateutil-2.8.0.tar.gz
+md5	f2a1d4b680b297b367a974664ca3a4f6  python-dateutil-2.8.1.tar.gz
+sha256	73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c  python-dateutil-2.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256	ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index 4c915c8e83..759261d2d1 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DATEUTIL_VERSION = 2.8.0
-PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/ad/99/5b2e99737edeb28c71bcbec5b5dda19d0d9ef3ca3e92e3e925e7c0bb364c
+PYTHON_DATEUTIL_VERSION = 2.8.1
+PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
