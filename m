From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 19 Jan 2019 12:01:47 +0200
Subject: [Buildroot] [PATCH 1/1] python-crossbar: bump to version 19.1.2
Message-ID: <20190119100148.18202-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-crossbar/python-crossbar.hash | 4 ++--
 package/python-crossbar/python-crossbar.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
index 665cc25d1f..f956dc27e1 100644
--- a/package/python-crossbar/python-crossbar.hash
+++ b/package/python-crossbar/python-crossbar.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crossbar/json
-md5	83c025eb8f1406642503aa590edabaf2  crossbar-19.1.1.tar.gz
-sha256	6b30970f8cbd6962581790444b19a0743f0c589bd441e727623e8a7004a8679b  crossbar-19.1.1.tar.gz
+md5	462a204da3c776cbb770b98f9047e8e7  crossbar-19.1.2.tar.gz
+sha256	269d534a65c136a5c952a6accccf256f457569f731ee65e201e5a14e69db471a  crossbar-19.1.2.tar.gz
 # Locally computed
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  LICENSE
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 787d0f9441..064d2d92b6 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CROSSBAR_VERSION = 19.1.1
+PYTHON_CROSSBAR_VERSION = 19.1.2
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
-PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/38/55/54ac74ca6b4a3b0fe5919fd7ee787c444ce79d8dca58d561ea3f8e185782
+PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/86/19/54c7bd9da1ac70643b9ae7d3d4592a73391f62fcb376fcd30f8328c1c5ce
 PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
-- 
2.19.1
