From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 21:52:08 +0200
Subject: [Buildroot] [git commit] package/python-oauthlib: bump version to
 2.1.0
Message-ID: <20180731194702.18BB68A5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62cd0bcf4b218bdf17b120e61de683977277d13d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package using scanpypi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-oauthlib/Config.in            | 2 +-
 package/python-oauthlib/python-oauthlib.hash | 7 ++++---
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-oauthlib/Config.in b/package/python-oauthlib/Config.in
index d6617f3898..65016c1d08 100644
--- a/package/python-oauthlib/Config.in
+++ b/package/python-oauthlib/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_OAUTHLIB
 	  A generic, spec-compliant, thorough implementation of the
 	  OAuth request-signing logic.
 
-	  https://github.com/idan/oauthlib
+	  https://github.com/oauthlib/oauthlib
diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index f8e1324244..f0a3dee823 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/oauthlib/json, sha256 locally computed
-md5	277a9a966cc8c72e492b4eeb41332445  oauthlib-2.0.6.tar.gz
-sha256	ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1  oauthlib-2.0.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/oauthlib/json
+md5	544b15398afe48d9493fa60d571bd8c7  oauthlib-2.1.0.tar.gz
+sha256	ac35665a61c1685c56336bda97d5eefa246f1202618a1d6f34fccb1bdd404162  oauthlib-2.1.0.tar.gz
+# Locally computed sha256 checksums
 sha256	9e1ae8725f5815738dadb6cbb09f450453d94e07c7b5efaee864f546a6209a95  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index ab39800247..3aa7ae227a 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 2.0.6
+PYTHON_OAUTHLIB_VERSION = 2.1.0
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0684165bb38c51117f34e175c379fce5c7df754
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/df/5f/3f4aae7b28db87ddef18afed3b71921e531ca288dc604eb981e9ec9f8853
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
