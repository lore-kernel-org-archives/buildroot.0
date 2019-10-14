From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:02:35 +0200
Subject: [Buildroot] [git commit] package/python-meld3: bump to version 2.0.0
Message-ID: <20191014195658.600F28DEE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e44552cf7a99d19d9208956add61a58832d8b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hashes for license files.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-meld3/python-meld3.hash | 9 ++++++---
 package/python-meld3/python-meld3.mk   | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-meld3/python-meld3.hash b/package/python-meld3/python-meld3.hash
index c7d9025e7c..f423b0bf19 100644
--- a/package/python-meld3/python-meld3.hash
+++ b/package/python-meld3/python-meld3.hash
@@ -1,3 +1,6 @@
-# md5 from https://pypi.python.org/pypi/meld3/json, sha256 locally computed
-md5     3ccc78cd79cffd63a751ad7684c02c91  meld3-1.0.2.tar.gz
-sha256  f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558  meld3-1.0.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/meld3/json
+md5	56fff5d6599efeefc81cf2d3b8cf6b4e  meld3-2.0.0.tar.gz
+sha256	1efda676264490db2e30bfb81b27a918cc6d9c2de6d609491aa43410b9537eb9  meld3-2.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	5fe11cd858707131b6ec1338b5c2cd68dd1fdb875e3ec967149bc6fea858ecec  LICENSE.txt
+sha256	2422945b49554688d529e1f8d4ac6e0ab77a817e8889158e1e56cf963ecf5c4d  COPYRIGHT.txt
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
index 675478ef7c..f67172e6f8 100644
--- a/package/python-meld3/python-meld3.mk
+++ b/package/python-meld3/python-meld3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MELD3_VERSION = 1.0.2
+PYTHON_MELD3_VERSION = 2.0.0
 PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
-PYTHON_MELD3_SITE = https://pypi.python.org/packages/45/a0/317c6422b26c12fe0161e936fc35f36552069ba8e6f7ecbd99bbffe32a5f
+PYTHON_MELD3_SITE = https://files.pythonhosted.org/packages/00/3b/023446ddc1bf0b519c369cbe88269c30c6a64bd10af4817c73f560c302f7
 PYTHON_MELD3_LICENSE = ZPL-2.1
 PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
 PYTHON_MELD3_SETUP_TYPE = setuptools
