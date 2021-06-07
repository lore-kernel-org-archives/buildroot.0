From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:50 -0000
Subject: [Buildroot] [git commit] package/python-bleak: bump to version
 0.11.0
Message-ID: <20210607144657.20DF380FB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2525b3be23f9f914db9b0a9fccd6fec747d9d121
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-bleak/Config.in         | 2 +-
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bleak/Config.in b/package/python-bleak/Config.in
index 6015361899..43ed65d752 100644
--- a/package/python-bleak/Config.in
+++ b/package/python-bleak/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_BLEAK
 	bool "python-bleak"
 	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_TXDBUS # runtime
+	select BR2_PACKAGE_PYTHON_DBUS_NEXT # runtime
 	help
 	  Bluetooth Low Energy platform Agnostic Klient.
 
diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 9506822c1b..9931bce202 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  e891b33804b69f0247eb770ca27fa0d5  bleak-0.10.0.tar.gz
-sha256  5c3a873965f2910865895e572e7a4f10533d6e150e6ba17936397426bf8d1eee  bleak-0.10.0.tar.gz
+md5  f15b43e4a6380eadb96b4235385c2ba1  bleak-0.11.0.tar.gz
+sha256  7796a6188547cf77f668406e6513d5d23316c508ca929882ed429d90c7a745ff  bleak-0.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 040d64ed41..870bfce10f 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.10.0
+PYTHON_BLEAK_VERSION = 0.11.0
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/80/37/c8c88709e4f1ca4636bf11c96d1ec046d7426cd02670ae80a3542280558b
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/7c/f3/817132098d57f5717f7f7dc46357e4ca2647c9addaf8e571382d12a28546
 PYTHON_BLEAK_SETUP_TYPE = setuptools
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
