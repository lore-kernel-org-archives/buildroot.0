From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:33 -0000
Subject: [Buildroot] [git commit] package/python-wtforms: bump to version
 2.3.3
Message-ID: <20200902161634.132E085EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3e6c5c6607bbb35ceff83c3ceceeb23d7837631
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add docs/license.rst to PYTHON_WTFORMS_LICENSE_FILES

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index 431a20cea1..ed9bfd1a23 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  bff06943e59671581af07f80d14bda5f  WTForms-2.3.1.tar.gz
-sha256  861a13b3ae521d6700dac3b2771970bd354a63ba7043ecc3a82b5288596a1972  WTForms-2.3.1.tar.gz
+md5  2b6ea167a71c6becf20f0934417fd06c  WTForms-2.3.3.tar.gz
+sha256  81195de0ac94fbc8368abbaf9197b88c4f3ffd6c2719b5bf5fc9da744f3d829c  WTForms-2.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index c47bd0b748..23280a6fe5 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 2.3.1
+PYTHON_WTFORMS_VERSION = 2.3.3
 PYTHON_WTFORMS_SOURCE = WTForms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/68/7a/4ce1636e03a25585f3e1436179232a66c25e53ef17f01b4384d16ace6d61
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/dd/3f/f25d26b1c66896e2876124a12cd8be8f606abf4e1890a20f3ca04e4a1555
 PYTHON_WTFORMS_SETUP_TYPE = setuptools
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
-PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst
+PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
 
 $(eval $(python-package))
