From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:38:27 +0100
Subject: [Buildroot] [git commit] package/python-validators: bump version to
 0.14.1
Message-ID: <20191216213016.B4D868B7A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4fd99d80b6ba3ba9386b0d5a2fe527139e592ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-validators/python-validators.hash | 4 ++--
 package/python-validators/python-validators.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 7e23afdfb7..f3c92f89a6 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5	7df330955d51859489690e452131d780  validators-0.14.0.tar.gz
-sha256	f0ac832212e3ee2e9b10e156f19b106888cf1429c291fbc5297aae87685014ae  validators-0.14.0.tar.gz
+md5	016484275dba8fd5c4cfd82dada490e2  validators-0.14.1.tar.gz
+sha256	0bfe836a1af37bb266d71ec1e98b530c38ce11bc7fbe0c4c96ef7b1532d019e5  validators-0.14.1.tar.gz
 # Locally computed sha256 checksums
 sha256	a7fd9d761c7ca1c6508b9baf030f6e21f5752d1caea3e49a270634aa9ef01e6f  LICENSE
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 8caba2a1b7..a8e99c86a5 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.14.0
+PYTHON_VALIDATORS_VERSION = 0.14.1
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/b2/b7/5fc43b7dba2a35362b2f5ce39dbee835c48898e2458910c3af810240fbaa
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/72/8a/f99287daae8cfef938e6eec785f6e259bf6bad93269d5398bb546d5b1563
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = BSD
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
