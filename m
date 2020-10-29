From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 29 Oct 2020 23:09:55 +0100
Subject: [Buildroot] [PATCH] package/python-idna: bump to version 2.10
Message-ID: <20201029220955.5158-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-idna/python-idna.hash | 4 ++--
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 50897f045b..c5f7378fda 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  870b8b80267f00f0faf1b7ba4bdbf14e  idna-2.9.tar.gz
-sha256  7588d1c14ae4c77d74036e8c22ff447b26d0fde8f007354fd48a7814db15b7cb  idna-2.9.tar.gz
+md5  7a910c706db30d758f377db2762c0f9a  idna-2.10.tar.gz
+sha256  b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6  idna-2.10.tar.gz
 # Locally computed sha256 checksums
 sha256  412014420d2473dba06117c3d4d9e0eecaa6dde0ca30cd951f4ec2be39426f32  LICENSE.rst
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index eb4c1036cf..b4d9839e29 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 2.9
+PYTHON_IDNA_VERSION = 2.10
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/cb/19/57503b5de719ee45e83472f339f617b0c01ad75cba44aba1e4c97c2b0abd
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/ea/b7/e0e3c1c467636186c39925827be42f16fee389dc404ac29e930e9136be70
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.rst
 PYTHON_IDNA_SETUP_TYPE = setuptools
-- 
2.29.1
