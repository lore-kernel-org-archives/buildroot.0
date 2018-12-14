From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 14 Dec 2018 07:26:54 +0200
Subject: [Buildroot] [PATCH 1/1] python-requests: bump to version 2.21.0
In-Reply-To: <20181214052656.27280-1-asafka7@gmail.com>
References: <20181214052656.27280-1-asafka7@gmail.com>
Message-ID: <20181214052656.27280-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index e3b77744af..46f62c75c5 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5	2918817ea4688f4ea21cb4b11e353448  requests-2.20.1.tar.gz
-sha256	ea881206e59f41dbd0bd445437d792e43906703fff75ca8ff43ccdb11f33f263  requests-2.20.1.tar.gz
+md5	1bcd0e0977c3f8db1848ba0e2b7ab904  requests-2.21.0.tar.gz
+sha256	502a824f31acdacb3a35b6690b5fbf0bc41d63a24a45c4004352b0242707598e  requests-2.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256	be41abac2c40f8530307e8d172c590b476f4a488bc6a68f8de57b7cf64786687  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 0c327759b0..3d8542fcdf 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.20.1
+PYTHON_REQUESTS_VERSION = 2.21.0
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/40/35/298c36d839547b50822985a2cf0611b3b978a5ab7a5af5562b8ebe3e1369
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/52/2c/514e4ac25da2b08ca5a464c50463682126385c4272c18193876e91f4bc38
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.19.1
