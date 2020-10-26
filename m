From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 22:09:13 +0100
Subject: [Buildroot] [git commit] package/python-intelhex: bump to version
 2.3.0
Message-ID: <20201026205658.8E7DE82650@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=772eea51525116b647a4c386d1a0b7d3cbe61ac8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix Python 3.9 compatibility issue with 'array' module

https://github.com/python-intelhex/intelhex/releases/tag/2.3.0

Fixes:
 - http://autobuild.buildroot.org/results/1c217f0c67c63ee43494ef84af832df8e856e2df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-intelhex/Config.in            | 2 +-
 package/python-intelhex/python-intelhex.hash | 4 ++--
 package/python-intelhex/python-intelhex.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-intelhex/Config.in b/package/python-intelhex/Config.in
index 20dbb8c9ca..d67de822f2 100644
--- a/package/python-intelhex/Config.in
+++ b/package/python-intelhex/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_INTELHEX
 	help
 	  Python library for Intel HEX files manipulations.
 
-	  https://pypi.python.org/pypi/IntelHex
+	  https://github.com/python-intelhex/intelhex
diff --git a/package/python-intelhex/python-intelhex.hash b/package/python-intelhex/python-intelhex.hash
index 80674f14ae..917bd72cd7 100644
--- a/package/python-intelhex/python-intelhex.hash
+++ b/package/python-intelhex/python-intelhex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/intelhex/json
-md5  9ce7402e0fd33249aef52cbf437b4ab7  intelhex-2.2.1.tar.gz
-sha256  009d8511e0d50639230c39af9607deee771cf026f67ef7507a8c3fd4fa927832  intelhex-2.2.1.tar.gz
+md5  9de0e92c1b66f75322581c8b22c020c2  intelhex-2.3.0.tar.gz
+sha256  892b7361a719f4945237da8ccf754e9513db32f5628852785aea108dcd250093  intelhex-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1b2eb032ab8a1b0266f7995c76e44509f89ca9c0e90ec507763b5e735aca7de4  LICENSE.txt
diff --git a/package/python-intelhex/python-intelhex.mk b/package/python-intelhex/python-intelhex.mk
index 64b21270e1..cc8b973f0f 100644
--- a/package/python-intelhex/python-intelhex.mk
+++ b/package/python-intelhex/python-intelhex.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_INTELHEX_VERSION = 2.2.1
+PYTHON_INTELHEX_VERSION = 2.3.0
 PYTHON_INTELHEX_SOURCE = intelhex-$(PYTHON_INTELHEX_VERSION).tar.gz
-PYTHON_INTELHEX_SITE = https://files.pythonhosted.org/packages/01/66/8fab869edcc0eaf8fc030472ff379b8eeee2ef3b42f8aec6bd84e9f735e3
-PYTHON_INTELHEX_SETUP_TYPE = distutils
+PYTHON_INTELHEX_SITE = https://files.pythonhosted.org/packages/66/37/1e7522494557d342a24cb236e2aec5d078fac8ed03ad4b61372586406b01
+PYTHON_INTELHEX_SETUP_TYPE = setuptools
 PYTHON_INTELHEX_LICENSE = BSD-3-Clause
 PYTHON_INTELHEX_LICENSE_FILES = LICENSE.txt
 
