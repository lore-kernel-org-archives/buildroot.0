From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu,  9 Apr 2020 19:00:12 +0300
Subject: [Buildroot] [PATCH] package/python-psutil: bump to version 5.7.0
In-Reply-To: <20200409160014.18401-1-asafka7@gmail.com>
References: <20200409160014.18401-1-asafka7@gmail.com>
Message-ID: <20200409160014.18401-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add use two spaces for license file hash indentation.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-psutil/python-psutil.hash | 6 +++---
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 7f3d629d66..0000d6033c 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5	b2c94e0368fc6e6f237a7252f8e85ca2  psutil-5.6.7.tar.gz
-sha256	ffad8eb2ac614518bbe3c0b8eb9dffdb3a8d2e3a7d5da51c5b974fb723a5c5aa  psutil-5.6.7.tar.gz
+md5  ed7b0f11ed214bcabbe76b7cf52f3ae3  psutil-5.7.0.tar.gz
+sha256  685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e  psutil-5.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256	24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
+sha256  24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 62a94f3c41..5f87e723cc 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.6.7
+PYTHON_PSUTIL_VERSION = 5.7.0
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/73/93/4f8213fbe66fc20cb904f35e6e04e20b47b85bee39845cc66a0bcf5ccdcb
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/c4/b8/3512f0e93e0db23a71d82485ba256071ebef99b227351f0f5540f744af41
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.26.0
