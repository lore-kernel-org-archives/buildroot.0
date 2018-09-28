From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Sep 2018 11:52:48 +0200
Subject: [Buildroot] [git commit] python-automat: bump to version 0.7.0
Message-ID: <20180928095227.BF5CF89148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b28bb28bbb646d09e85053720102942d1572a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-automat/python-automat.hash | 8 +++++---
 package/python-automat/python-automat.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-automat/python-automat.hash b/package/python-automat/python-automat.hash
index c0e3505234..f974679b9d 100644
--- a/package/python-automat/python-automat.hash
+++ b/package/python-automat/python-automat.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/automat/json, sha256 locally computed
-md5	ad7bba58d262d8956d732330cb5ef53d  Automat-0.6.0.tar.gz
-sha256	3c1fd04ecf08ac87b4dd3feae409542e9bf7827257097b2b6ed5692f69d6f6a8  Automat-0.6.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/automat/json
+md5	b72d5b7a83c2b1bd6e9ec3614a69f9ea  Automat-0.7.0.tar.gz
+sha256	cbd78b83fa2d81fe2a4d23d258e1661dd7493c9a50ee2f1a5b2cac61c1793b0e  Automat-0.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256	b2201301678d0a937d938543827ca1360712eb34e23de8ee3f3bfffbd4c0e376  LICENSE
diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index 96a4f51506..f3d8da49f0 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOMAT_VERSION = 0.6.0
+PYTHON_AUTOMAT_VERSION = 0.7.0
 PYTHON_AUTOMAT_SOURCE = Automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
-PYTHON_AUTOMAT_SITE = https://pypi.python.org/packages/de/05/b8e453085cf8a7f27bb1226596f4ccf5cc9e758377d60284f990bbdc592c
+PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/4a/4f/64db3ffda8828cb0541fe949354615f39d02f596b4c33fb74863756fc565
 PYTHON_AUTOMAT_SETUP_TYPE = setuptools
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
