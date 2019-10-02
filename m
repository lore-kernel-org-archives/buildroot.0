From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:19:42 +0200
Subject: [Buildroot] [git commit] package/python-validators: bump to version
 0.14.0
Message-ID: <20191002201427.78A7980503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fb122afd6ed0f357e662fce060e3eeb4b594077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
