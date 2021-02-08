From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon,  8 Feb 2021 01:55:43 +0100
Subject: [Buildroot] [PATCH 2/3] package/python-pyjwt: bump to version 2.0.1
In-Reply-To: <20210208005546.482866-1-grzegorz@blach.pl>
References: <20210208005546.482866-1-grzegorz@blach.pl>
Message-ID: <20210208005546.482866-2-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 10875510f0..e3408a4eb5 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  7a1b1c8bfeb67c31ee4fdadefe5ff4b8  PyJWT-2.0.0.tar.gz
-sha256  7a2b271c6dac2fda9e0c33d176c4253faba2c6c6b3a99c7f28a32c3c97522779  PyJWT-2.0.0.tar.gz
+md5  93b74f59d08be8c852a3c259da2ea121  PyJWT-2.0.1.tar.gz
+sha256  a5c70a06e1f33d81ef25eecd50d50bd30e34de1ca8b2b9fa3fe0daaabcf69bf7  PyJWT-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 9215911389..dd20e0efcb 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.0.0
+PYTHON_PYJWT_VERSION = 2.0.1
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/14/6d/096dc269d105ba374d6bfd3ecb22b516795ca0572499820dadc8178d9ae1
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/ef/68/d610e2e10bc8336a033a6e0f0401341106ee9ed9cb0c1571b0d1a8eacf39
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.27.0
