From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  3 Feb 2020 10:27:05 +0100
Subject: [Buildroot] [PATCH] package/python-validators: bump version to
 0.14.2
Message-ID: <20200203092706.2946-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes an issue with domain name validation.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-validators/python-validators.hash | 4 ++--
 package/python-validators/python-validators.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index f3c92f89a6..1a3aa79980 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5	016484275dba8fd5c4cfd82dada490e2  validators-0.14.1.tar.gz
-sha256	0bfe836a1af37bb266d71ec1e98b530c38ce11bc7fbe0c4c96ef7b1532d019e5  validators-0.14.1.tar.gz
+md5	ae3932b693452b96f037c919e1d7250f  validators-0.14.2.tar.gz
+sha256	b192e6bde7d617811d59f50584ed240b580375648cd032d106edeb3164099508  validators-0.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256	a7fd9d761c7ca1c6508b9baf030f6e21f5752d1caea3e49a270634aa9ef01e6f  LICENSE
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index a8e99c86a5..e24ce35fdd 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.14.1
+PYTHON_VALIDATORS_VERSION = 0.14.2
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/72/8a/f99287daae8cfef938e6eec785f6e259bf6bad93269d5398bb546d5b1563
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/4d/56/9b48c918ef118ea12b90f227c4498ed4703b418bdd8fb49479dfcbeae4ef
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = BSD
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
-- 
2.20.1
