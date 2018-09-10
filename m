From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 10 Sep 2018 11:11:39 +0300
Subject: [Buildroot] [PATCH 1/1] python-psycopg2: bump to version 2.7.5
Message-ID: <20180910081139.25014-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

license file was updated too - they removed a paragraph related
to files that were previously removed from the repository.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-psycopg2/python-psycopg2.hash | 9 +++++----
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index ea4a07697b..5dedd61abc 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/psycopg2/json, sha256 locally computed
-md5    70fc57072e084565a42689d416cf2c5c  psycopg2-2.7.4.tar.gz
-sha256 8bf51191d60f6987482ef0cfe8511bbf4877a5aa7f313d7b488b53189cf26209  psycopg2-2.7.4.tar.gz
-sha256 1752db3c786e12b62ca804178dca033adce8bff4c4b3d98d3449d407fe45210d  LICENSE
+# md5, sha256 from https://pypi.org/pypi/psycopg2/json
+md5	9e7d6f695fc7f8d1c42a7905449246c9  psycopg2-2.7.5.tar.gz
+sha256	eccf962d41ca46e6326b97c8fe0a6687b58dfc1a5f6540ed071ff1474cea749e  psycopg2-2.7.5.tar.gz
+# Locally computed sha256 checksums
+sha256	3c2b037df24cb85ca1a48739dcab60a5037644b436f87173f6db0d101636b525  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index e9327f4607..c8c328d801 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.7.4
+PYTHON_PSYCOPG2_VERSION = 2.7.5
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://pypi.python.org/packages/74/83/51580322ed0e82cba7ad8e0af590b8fb2cf11bd5aaa1ed872661bd36f462
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/b2/c1/7bf6c464e903ffc4f3f5907c389e5a4199666bf57f6cd6bf46c17912a1f9
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
-- 
2.17.1
