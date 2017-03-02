From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-pysnmp: bump to version 4.3.3
Message-ID: <20170302205924.6A68F7FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e8f82f815aeb00498f963cafd784c5e52de8a83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pysnmp/python-pysnmp.hash | 4 ++--
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index b0f0f49..7ecbf4c 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pysnmp/json, sha256 locally computed
-md5	9a4d23c4c1edea1c77faed72c469d8e8  pysnmp-4.3.2.tar.gz
-sha256	7c2bd81df17aa7dca0057a68e7a32284a72231309a0237d66d5b803b5c118977  pysnmp-4.3.2.tar.gz
+md5 cc0838cdf3f2d34539f478942f648384 pysnmp-4.3.3.tar.gz
+sha256 c837d35cbb2c1e067b7b8ed752d962481ef8d7ff11e4cdd8bfb0840c4a786318 pysnmp-4.3.3.tar.gz
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index dff8bdd..0d72613 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 4.3.2
+PYTHON_PYSNMP_VERSION = 4.3.3
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://pypi.python.org/packages/9e/77/795fcc9d9a01adcb6175a3bf6532132addb8904922afd7877a9930d89f2f
+PYTHON_PYSNMP_SITE = https://pypi.python.org/packages/47/b5/c65b9b6fcc36d3f4caca30d3314920f1ca75f5ceecc1f6ae2538ede24511
 PYTHON_PYSNMP_SETUP_TYPE = setuptools
 
 PYTHON_PYSNMP_LICENSE = BSD-3c
