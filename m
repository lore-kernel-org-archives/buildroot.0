From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 22:40:37 +0200
Subject: [Buildroot] [PATCH 2/5] package/python-oauthlib: bump version to
 3.0.2
In-Reply-To: <20190803204040.341-1-bernd.kuhls@t-online.de>
References: <20190803204040.341-1-bernd.kuhls@t-online.de>
Message-ID: <20190803204040.341-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash after upstream bump to 2019
https://github.com/oauthlib/oauthlib/commit/f4273e75250dd36c88d63dc075ae45650a5172e9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-oauthlib/python-oauthlib.hash | 6 +++---
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index f0a3dee823..48905a7508 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5	544b15398afe48d9493fa60d571bd8c7  oauthlib-2.1.0.tar.gz
-sha256	ac35665a61c1685c56336bda97d5eefa246f1202618a1d6f34fccb1bdd404162  oauthlib-2.1.0.tar.gz
+md5	1d8454f0e80a628dcef55db12f73895e  oauthlib-3.0.2.tar.gz
+sha256	b4d99ae8ccfb7d33ba9591b59355c64eef5241534aa3da2e4c0435346b84bc8e  oauthlib-3.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256	9e1ae8725f5815738dadb6cbb09f450453d94e07c7b5efaee864f546a6209a95  LICENSE
+sha256	3d1e12d8ac52c0b6c148af6d291f72400b8720ed16c0ac4a89868b6d14b1c939  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index 3aa7ae227a..d5fdc8ec7d 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 2.1.0
+PYTHON_OAUTHLIB_VERSION = 3.0.2
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/df/5f/3f4aae7b28db87ddef18afed3b71921e531ca288dc604eb981e9ec9f8853
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/6a/cf/f1a44998f36c62a7a9e51145101428299be27b1e3a411adfd6fd87589889
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
-- 
2.20.1
