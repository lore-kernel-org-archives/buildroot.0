From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:19:14 +0200
Subject: [Buildroot] [git commit] package/python-bottle: bump to version
 0.12.17
Message-ID: <20191002201426.6D43B81E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10aca5ee770873b2cd10ed4eb66ea481f44461f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add LICENSE as license file (including hash).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bottle/python-bottle.hash | 8 +++++---
 package/python-bottle/python-bottle.mk   | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 3006c16e9a..03558c1abc 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/bottle/json, sha256 locally computed
-md5	d2fe1b48c1d49217e78bf326b1cad437  bottle-0.12.13.tar.gz
-sha256	39b751aee0b167be8dffb63ca81b735bbf1dd0905b3bc42761efedee8f123355  bottle-0.12.13.tar.gz
+# md5, sha256 from https://pypi.org/pypi/bottle/json
+md5	c7d8a42dbc6955593e5b9f957e650a60  bottle-0.12.17.tar.gz
+sha256	e9eaa412a60cc3d42ceb42f58d15864d9ed1b92e9d630b8130c871c5bb16107c  bottle-0.12.17.tar.gz
+# Locally computed sha256 checksums
+sha256	d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 6f071f64b5..a8879010e8 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.13
+PYTHON_BOTTLE_VERSION = 0.12.17
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://pypi.python.org/packages/bd/99/04dc59ced52a8261ee0f965a8968717a255ea84a36013e527944dbf3468c
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/c4/a5/6bf41779860e9b526772e1b3b31a65a22bd97535572988d16028c5ab617d
 PYTHON_BOTTLE_LICENSE = MIT
-# README.rst refers to the file "LICENSE" but it's not included
+PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
