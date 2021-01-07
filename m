From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@essensium.com>
Date: Thu,  7 Jan 2021 19:00:07 +0100
Subject: [Buildroot] [PATCH] package/python-boto3: bump to version 1.16.50
Message-ID: <20210107180007.18864-1-raphael.melotte@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While at it, use two spaces for all the hashes.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
---
 package/python-boto3/python-boto3.hash | 6 +++---
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 49eb9ae5c6..6752a2cca0 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5	02e0d5ea4affd9c64e9166d5d3786766  boto3-1.9.210.tar.gz
-sha256	e221f6867282266e06aec2213f0ea5fdbd4eb3facbca4fcbf96886073350bc5e  boto3-1.9.210.tar.gz
+md5  8cecdbf7ef6702837d7ddabaa3e39a89  boto3-1.16.50.tar.gz
+sha256  4d502a842b81fdac4b950d3b88a5b9067ce118213b122b20f4192003cb067986  boto3-1.16.50.tar.gz
 # Locally computed sha256 checksums
-sha256	0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index e00cb84ad1..a5c2b6ab31 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.9.210
+PYTHON_BOTO3_VERSION = 1.16.50
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/d3/ac/79093e14a5397096d1fe4a17329a8453cebed8629cbc434e2dad5fb75b65
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/c8/c6/b4d9547a493ac2837f296f4a004dff6e7136cf6750d181769b8a61d63813
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.29.2
