From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 30 Jun 2019 19:58:45 +0200
Subject: [Buildroot] [PATCH] package/python-scandir: bump to version 1.10.0
Message-ID: <1561917525-7285-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/benhoyt/scandir/releases

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/python-scandir/python-scandir.hash | 4 ++--
 package/python-scandir/python-scandir.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scandir/python-scandir.hash b/package/python-scandir/python-scandir.hash
index 5918291..5c01701 100644
--- a/package/python-scandir/python-scandir.hash
+++ b/package/python-scandir/python-scandir.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scandir/json
-md5	506c4cc5f38c00b301642a9cb0433910  scandir-1.9.0.tar.gz
-sha256	44975e209c4827fc18a3486f257154d34ec6eaec0f90fef0cca1caa482db7064  scandir-1.9.0.tar.gz
+md5	f8378f4d9f95a6a78e97ab01aa900c1d  scandir-1.10.0.tar.gz
+sha256	4d4631f6062e658e9007ab3149a9b914f3548cb38bfb021c64f39a025ce578ae  scandir-1.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256	a5e2fbdc239744419d29407cdbc92793c4d9c1d956c174f7cb7f96fa6d058c86  LICENSE.txt
diff --git a/package/python-scandir/python-scandir.mk b/package/python-scandir/python-scandir.mk
index 1008fca..f205fe3 100644
--- a/package/python-scandir/python-scandir.mk
+++ b/package/python-scandir/python-scandir.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCANDIR_VERSION = 1.9.0
+PYTHON_SCANDIR_VERSION = 1.10.0
 PYTHON_SCANDIR_SOURCE = scandir-$(PYTHON_SCANDIR_VERSION).tar.gz
-PYTHON_SCANDIR_SITE = https://files.pythonhosted.org/packages/16/2a/557af1181e6b4e30254d5a6163b18f5053791ca66e251e77ab08887e8fe3
+PYTHON_SCANDIR_SITE = https://files.pythonhosted.org/packages/df/f5/9c052db7bd54d0cbf1bc0bb6554362bba1012d03e5888950a4f5c5dadc4e
 PYTHON_SCANDIR_LICENSE = BSD-3-Clause
 PYTHON_SCANDIR_LICENSE_FILES = LICENSE.txt
 PYTHON_SCANDIR_SETUP_TYPE = setuptools
-- 
2.7.4
