From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Sep 2019 16:34:25 +0200
Subject: [Buildroot] [PATCH] package/python-validators: bump version to
 0.12.6
Message-ID: <20190916143425.10008-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes a number of post-0.12.2 fixes, including a python 3.7 compatibility
fix:

https://github.com/kvesteri/validators/blob/master/CHANGES.rst

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-validators/python-validators.hash | 4 ++--
 package/python-validators/python-validators.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 8c6e3f9ecc..08ff612d5c 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5	9c9583f91972163b3b736033bb929d8a  validators-0.12.2.tar.gz
-sha256	172ac45f7d1944ce4beca3c5c53ca7c83e9759e39fd3fedc1cf28e2130268706  validators-0.12.2.tar.gz
+md5	8a83e4f4d8ce20907717ddddfc84c894  validators-0.12.6.tar.gz
+sha256	f6aca085caf9e13d5a0fd8ddb3afbea2541c0ca9477b1fb8098c797dd812ff64  validators-0.12.6.tar.gz
 # Locally computed sha256 checksums
 sha256	a7fd9d761c7ca1c6508b9baf030f6e21f5752d1caea3e49a270634aa9ef01e6f  LICENSE
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index e94476f834..bf3f09914e 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.12.2
+PYTHON_VALIDATORS_VERSION = 0.12.6
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/45/7b/5b7b74208a3e0744d1a0efbfb1935fa46fa4cfe58d3d63f17c49c58c429c
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/8f/cd/1571ece4bf93e02143449417d244daa89dfc46288110b096b81e84aa6ddd
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = BSD
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
-- 
2.20.1
