From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:41:36 +0200
Subject: [Buildroot] [git commit] package/python-automat: bump to version
 0.8.0
Message-ID: <20191020135059.A18B682DF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9b606bc0fcf0cec9c1cf993638578da495b0162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-automat/python-automat.hash | 4 ++--
 package/python-automat/python-automat.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-automat/python-automat.hash b/package/python-automat/python-automat.hash
index f974679b9d..1be91e0e91 100644
--- a/package/python-automat/python-automat.hash
+++ b/package/python-automat/python-automat.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/automat/json
-md5	b72d5b7a83c2b1bd6e9ec3614a69f9ea  Automat-0.7.0.tar.gz
-sha256	cbd78b83fa2d81fe2a4d23d258e1661dd7493c9a50ee2f1a5b2cac61c1793b0e  Automat-0.7.0.tar.gz
+md5	47e980a48201a1dabe37fa11f0187013  Automat-0.8.0.tar.gz
+sha256	269a09dfb063a3b078983f4976d83f0a0d3e6e7aaf8e27d8df1095e09dc4a484  Automat-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256	b2201301678d0a937d938543827ca1360712eb34e23de8ee3f3bfffbd4c0e376  LICENSE
diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index f3d8da49f0..0bd40daf76 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOMAT_VERSION = 0.7.0
+PYTHON_AUTOMAT_VERSION = 0.8.0
 PYTHON_AUTOMAT_SOURCE = Automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
-PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/4a/4f/64db3ffda8828cb0541fe949354615f39d02f596b4c33fb74863756fc565
+PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/4c/9a/3052851fa3a888d1ff32f053fba424ed929b47383fb5327855fdf70018cd
 PYTHON_AUTOMAT_SETUP_TYPE = setuptools
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
