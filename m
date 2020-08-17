From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:19:47 +0200
Subject: [Buildroot] [git commit branch/next] package/python-cffi: bump to
 version 1.14.2
Message-ID: <20200817130558.A3515867AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb923b42b2f0566c37d310061fa4eda5e8972ca8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 8c2beb06a4..37676f2664 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5	74845f8d2b7b583dd9a3574f402edf39  cffi-1.14.0.tar.gz
-sha256	2d384f4a127a15ba701207f7639d94106693b6cd64173d6c8988e2c25f3ac2b6  cffi-1.14.0.tar.gz
+md5	3cc2f1daf62dd66eda79b4d6281cebfc  cffi-1.14.2.tar.gz
+sha256	ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b  cffi-1.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 8f76e7c1d1..f882349fd7 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.14.0
+PYTHON_CFFI_VERSION = 1.14.2
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/05/54/3324b0c46340c31b909fcec598696aaec7ddc8c18a63f2db352562d3354c
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
