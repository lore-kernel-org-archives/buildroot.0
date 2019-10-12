From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 15:42:28 +0200
Subject: [Buildroot] [git commit] package/python-ubjson: bump to version
 0.14.0
Message-ID: <20191012140839.21E458D690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8de3f5533cde3c42181d1d6a08e05076f9cd5fad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ubjson/python-ubjson.hash | 4 ++--
 package/python-ubjson/python-ubjson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ubjson/python-ubjson.hash b/package/python-ubjson/python-ubjson.hash
index f93ae1acde..a7e954ce5d 100644
--- a/package/python-ubjson/python-ubjson.hash
+++ b/package/python-ubjson/python-ubjson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/py-ubjson/json
-md5	5dbbecd3dbecd744e45f27f14e2da5e1  py-ubjson-0.12.0.tar.gz
-sha256	b796cb5077a06c932f0d148f4eef4ce0f045a05cb14393177a6d034be9f8e364  py-ubjson-0.12.0.tar.gz
+md5	26c07be8e4c9f2b0ee7c42a9aca118ed  py-ubjson-0.14.0.tar.gz
+sha256	f742c87bccc8653329d3f79b8b3f40d44d11d17cce7f6d7025a73c52ebf91c66  py-ubjson-0.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256	ca182abcb84ad9984c9af2e30cb70c4fe0e1772674355207e8fcdb85e8c5e75f  LICENSE
diff --git a/package/python-ubjson/python-ubjson.mk b/package/python-ubjson/python-ubjson.mk
index 477cc400c8..58bba2ac74 100644
--- a/package/python-ubjson/python-ubjson.mk
+++ b/package/python-ubjson/python-ubjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UBJSON_VERSION = 0.12.0
+PYTHON_UBJSON_VERSION = 0.14.0
 PYTHON_UBJSON_SOURCE = py-ubjson-$(PYTHON_UBJSON_VERSION).tar.gz
-PYTHON_UBJSON_SITE = https://files.pythonhosted.org/packages/68/9c/a6c34e565351f0b04bcf6835e38bc4bd0647269dc48670e12eb99a3f5ef5
+PYTHON_UBJSON_SITE = https://files.pythonhosted.org/packages/10/31/0d8297c33d681aafa3fe900ca072a96d5acb97e79082fbb593e835376c93
 PYTHON_UBJSON_LICENSE = Apache-2.0
 PYTHON_UBJSON_LICENSE_FILES = LICENSE
 PYTHON_UBJSON_SETUP_TYPE = setuptools
