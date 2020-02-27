From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:59:26 +0100
Subject: [Buildroot] [git commit branch/next] package/python-passlib: bump
 to version 1.7.2
Message-ID: <20200227100041.86D0F8EC46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94c48ead6700f8fb5855f177d21857fc868fa860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash change is due to date update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-passlib/python-passlib.hash | 6 +++---
 package/python-passlib/python-passlib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-passlib/python-passlib.hash b/package/python-passlib/python-passlib.hash
index 8e7f790af0..867223e19a 100644
--- a/package/python-passlib/python-passlib.hash
+++ b/package/python-passlib/python-passlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/passlib/json
-md5	254869dae3fd9f09f0746a3cb29a0b15  passlib-1.7.1.tar.gz
-sha256	3d948f64138c25633613f303bcc471126eae67c04d5e3f6b7b8ce6242f8653e0  passlib-1.7.1.tar.gz
+md5	b908529cfd4c33057c244324c692eae7  passlib-1.7.2.tar.gz
+sha256	8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8  passlib-1.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256	ae8cd74bd5be7be586c52def8bcddfe817872cf2e0782b159d37f88bf0ff11fc  LICENSE
+sha256	49a74ad666f456493d6b9e2cda7c55e46ad512ce2c67db4accaddb27bb240bb9  LICENSE
diff --git a/package/python-passlib/python-passlib.mk b/package/python-passlib/python-passlib.mk
index 1a3726b607..6ab94fd66e 100644
--- a/package/python-passlib/python-passlib.mk
+++ b/package/python-passlib/python-passlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PASSLIB_VERSION = 1.7.1
+PYTHON_PASSLIB_VERSION = 1.7.2
 PYTHON_PASSLIB_SOURCE = passlib-$(PYTHON_PASSLIB_VERSION).tar.gz
-PYTHON_PASSLIB_SITE = https://files.pythonhosted.org/packages/25/4b/6fbfc66aabb3017cd8c3bd97b37f769d7503ead2899bf76e570eb91270de
+PYTHON_PASSLIB_SITE = https://files.pythonhosted.org/packages/6d/6b/4bfca0c13506535289b58f9c9761d20f56ed89439bfe6b8e07416ce58ee1
 PYTHON_PASSLIB_SETUP_TYPE = setuptools
 PYTHON_PASSLIB_LICENSE = BSD-3-Clause
 PYTHON_PASSLIB_LICENSE_FILES = LICENSE
