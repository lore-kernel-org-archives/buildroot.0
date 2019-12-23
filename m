From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 20:42:34 +0100
Subject: [Buildroot] [git commit] package/python-pycares: bump to version
 3.1.0
Message-ID: <20191223194200.7E9D08E022@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71323def347fb75154c2ba3227cb15d54a24fecd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index dfe7ca723d..63f5d88aeb 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5	8a53781dd26db01ffe0b3358877bebbd  pycares-3.0.0.tar.gz
-sha256	b253f5dcaa0ac7076b79388a3ac80dd8f3bd979108f813baade40d3a9b8bf0bd  pycares-3.0.0.tar.gz
+md5	9d71bb8654cd2f7f34bdfe0ba641b59c  pycares-3.1.0.tar.gz
+sha256	663c000625725d3a63466a674df4ee7f62bf8ca1ae8a0b87a6411eb811e0e794  pycares-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256	427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 3698ec64f5..ecac40fd2d 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 3.0.0
+PYTHON_PYCARES_VERSION = 3.1.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/85/de/cd46a73e43e206a6ad1e9cf9cc893c3ed1b21caf57f1e0a8d9a119d290eb
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/50/39/d7d4e85041e95c12ccca220663328709da81f75f5e86d76049f0937e9f83
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
