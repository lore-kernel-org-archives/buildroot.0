From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:34:10 +0200
Subject: [Buildroot] [git commit] package/python-ecdsa: bump to version
 0.16.1
Message-ID: <20210405160910.C65538C581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1cdaeb454f5c609837326e1ba3dd7cb836db9cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/tlsfuzzer/python-ecdsa/blob/python-ecdsa-0.16.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ecdsa/python-ecdsa.hash | 6 +++---
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index efe396bf0a..fcb8093826 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5	821d543047941dd26f543f62912230d4  ecdsa-0.15.tar.gz
-sha256	8f12ac317f8a1318efa75757ef0a651abe12e51fc1af8838fb91079445227277  ecdsa-0.15.tar.gz
+md5  98c0da4c046286e892fdba727f93edea  ecdsa-0.16.1.tar.gz
+sha256  cfc046a2ddd425adbd1a78b3c46f0d1325c657811c0f45ecc3a0a6236c1e50ff  ecdsa-0.16.1.tar.gz
 # Locally computed sha256 checksums
-sha256	3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
+sha256  3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index 1178c378fb..75c970518e 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.15
+PYTHON_ECDSA_VERSION = 0.16.1
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/e3/7c/b508ade1feb47cd79222e06d85e477f5cfc4fb0455ad3c70eb6330fc49aa
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/1d/d4/0684a83b3c16a9d1446ace27a506cef1db9b23984ac7ed6aaf764fdd56e8
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
