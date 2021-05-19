From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 11:42:30 +0200
Subject: [Buildroot] [git commit] package/python-falcon: Bump to version
 3.0.1
Message-ID: <20210519091515.67ACD83D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d172c8c01726c2c5a6d90977ad8fa7e77433022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index 80b2aed54f..979419c25a 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  0ebd5316cd7f59b9be4ea13650ea3a0d  falcon-3.0.0.tar.gz
-sha256  8d7c3d52ae4590ddfa0b3d9c75d44ab573340a5e78d72ee687712e757ac53929  falcon-3.0.0.tar.gz
+md5  4a70cfeeacb453f5fd7eb791bdd3ac01  falcon-3.0.1.tar.gz
+sha256  c41d84db325881a870e8b7129d5ecfd972fa4323cf77b7119a1d2a21966ee681  falcon-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 5b73b23277..1f400f9a1f 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 3.0.0
+PYTHON_FALCON_VERSION = 3.0.1
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/f1/59/2748d63922a46e040be06cd175a6242a33ade7839aac37f441544bb6d651
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/63/22/6a9009c53ad78e65d88a44db8eccc7f39c6f54fc05fb43b1e9cbbc481d06
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
