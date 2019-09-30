From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:57 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-validators: bump to version
 0.14.0
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-31-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-validators/python-validators.hash | 4 ++--
 package/python-validators/python-validators.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 08ff612d5c..7e23afdfb7 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5	8a83e4f4d8ce20907717ddddfc84c894  validators-0.12.6.tar.gz
-sha256	f6aca085caf9e13d5a0fd8ddb3afbea2541c0ca9477b1fb8098c797dd812ff64  validators-0.12.6.tar.gz
+md5	7df330955d51859489690e452131d780  validators-0.14.0.tar.gz
+sha256	f0ac832212e3ee2e9b10e156f19b106888cf1429c291fbc5297aae87685014ae  validators-0.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256	a7fd9d761c7ca1c6508b9baf030f6e21f5752d1caea3e49a270634aa9ef01e6f  LICENSE
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index bf3f09914e..8caba2a1b7 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.12.6
+PYTHON_VALIDATORS_VERSION = 0.14.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/8f/cd/1571ece4bf93e02143449417d244daa89dfc46288110b096b81e84aa6ddd
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/b2/b7/5fc43b7dba2a35362b2f5ce39dbee835c48898e2458910c3af810240fbaa
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = BSD
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
-- 
2.20.1
