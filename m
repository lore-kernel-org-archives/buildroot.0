From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:19:14 +0200
Subject: [Buildroot] [git commit] package/python-cssselect: bump to version
 1.1.0
Message-ID: <20191002201426.97DE281E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=202f37de7819c709a946ee92bb60b34683014d00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cssselect/python-cssselect.hash | 9 +++++----
 package/python-cssselect/python-cssselect.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index dd05bebe55..44813416cb 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/cssselect/json, sha256 locally computed
-md5	50422c9ec04b74cd60c571f74ddc1a80  cssselect-1.0.3.tar.gz
-sha256	066d8bc5229af09617e24b3ca4d52f1f9092d9e061931f4184cd572885c23204  cssselect-1.0.3.tar.gz
-sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
+# md5, sha256 from https://pypi.org/pypi/cssselect/json
+md5	fa57704c1cb66cc8e537b782bd6b227e  cssselect-1.1.0.tar.gz
+sha256	f95f8dedd925fd8f54edb3d2dfb44c190d9d18512377d3c1e2388d16126879bc  cssselect-1.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256	5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index 4ecc07aef6..f6faa94b4c 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 1.0.3
+PYTHON_CSSSELECT_VERSION = 1.1.0
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://pypi.python.org/packages/52/ea/f31e1d2e9eb130fda2a631e22eac369dc644e8807345fbed5113f2d6f92b
+PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/70/54/37630f6eb2c214cdee2ae56b7287394c8aa2f3bafb8b4eb8c3791aae7a14
 PYTHON_CSSSELECT_SETUP_TYPE = setuptools
 PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
