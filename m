From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:56:58 +0200
Subject: [Buildroot] [git commit] package/python-asgiref: bump to version
 3.2.2
Message-ID: <20191002201426.2A78A882F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce5699ed80a9682336a27c57a6e3e2c10da92146
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index 61ec9ebdec..527b797473 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5	682697d39175a9681222dd6f304d8e51  asgiref-3.2.0.tar.gz
-sha256	cefcbd64acbfc9f38913566824ef070dd9a50e63f1b4cc5a7f1c44be809d7ff3  asgiref-3.2.0.tar.gz
+md5	a0d824805f07199ec41a9af6ff69761b  asgiref-3.2.2.tar.gz
+sha256	f62b1c88ebf5fe95db202a372982970edcf375c1513d7e70717df0750f5c2b98  asgiref-3.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 0ffc16dd90..9a1a817c9c 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.2.0
+PYTHON_ASGIREF_VERSION = 3.2.2
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/65/ef/e357b3e3d418f16d8f79b9d0c44d170bc0d88f0840b5755b6bfe25a576ea
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/6a/d8/ac8ccfd9551901413cddcff798e16f219489887ec5db3b163c321dd017c6
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
