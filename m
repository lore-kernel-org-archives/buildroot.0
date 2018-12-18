From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 18 Dec 2018 19:24:07 +0200
Subject: [Buildroot] [PATCH 1/1] python-autobahn: bump to version 18.12.1
Message-ID: <20181218172407.17086-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 024617fd81..f6023ab2ee 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5	4a63c94ea306e07602eaca6befd86751  autobahn-18.11.2.tar.gz
-sha256	43262e500aaf8b89fb5f0b60ab13163500ee877908cdd6861208546d95c6dba0  autobahn-18.11.2.tar.gz
+md5	51b416c5503127911d9d8f1254967d44  autobahn-18.12.1.tar.gz
+sha256	bec9e04c97536a6c0044965db4a478672a01c4adee0aa84d9c4a0945b2adc879  autobahn-18.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index d175244fc0..6d51ede723 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 18.11.2
+PYTHON_AUTOBAHN_VERSION = 18.12.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/3a/9f/9552ce8fec2703370f63eedbedffa1151865f1265fbfc5c3bbd1029710cc
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/76/5b/ab59e271a11a08d02b1a3a3b777f7dde442cf89b169bbc67219016a84e7e
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
-- 
2.19.1
