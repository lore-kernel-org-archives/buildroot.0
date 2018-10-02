From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Oct 2018 16:41:31 +0200
Subject: [Buildroot] [git commit] python-sdnotify: bump to version 0.3.2
Message-ID: <20181002144115.4172A8B654@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5c7780eadf82f9a81769d3759313b7a6d8ecea7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sdnotify/python-sdnotify.hash | 9 +++++----
 package/python-sdnotify/python-sdnotify.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-sdnotify/python-sdnotify.hash b/package/python-sdnotify/python-sdnotify.hash
index 6d3ad6ba89..b4106418ef 100644
--- a/package/python-sdnotify/python-sdnotify.hash
+++ b/package/python-sdnotify/python-sdnotify.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/sdnotify/json
-md5	a182c1ef47e1c6c965771aa3029da16f  sdnotify-0.3.1.tar.gz
-# sha256 calculated by scanpypi
-sha256	e69220d4f6cbb02130f43f929350a80cf51033fde47dcb056fbda71e2dff2d5a  sdnotify-0.3.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/sdnotify/json
+md5	749ddca1c70be1697fecc443fb1fdb16  sdnotify-0.3.2.tar.gz
+sha256	73977fc746b36cc41184dd43c3fe81323e7b8b06c2bb0826c4f59a20c56bb9f1  sdnotify-0.3.2.tar.gz
+# Locally computed sha256 checksums
+sha256	038351c6f544a386576da41d5fe1320437ed211507565dd9c334c8290055b88e  LICENSE.txt
diff --git a/package/python-sdnotify/python-sdnotify.mk b/package/python-sdnotify/python-sdnotify.mk
index 7c24d32729..1b0f2276dc 100644
--- a/package/python-sdnotify/python-sdnotify.mk
+++ b/package/python-sdnotify/python-sdnotify.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SDNOTIFY_VERSION = 0.3.1
+PYTHON_SDNOTIFY_VERSION = 0.3.2
 PYTHON_SDNOTIFY_SOURCE = sdnotify-$(PYTHON_SDNOTIFY_VERSION).tar.gz
-PYTHON_SDNOTIFY_SITE = https://pypi.python.org/packages/57/f9/ae03e3ebc83be0d501cde1f5d6d23dee74f5c2105f2cdb98bff4fa9ada9c
+PYTHON_SDNOTIFY_SITE = https://files.pythonhosted.org/packages/ce/d8/9fdc36b2a912bf78106de4b3f0de3891ff8f369e7a6f80be842b8b0b6bd5
 PYTHON_SDNOTIFY_SETUP_TYPE = distutils
 PYTHON_SDNOTIFY_LICENSE = MIT
 PYTHON_SDNOTIFY_LICENSE_FILES = LICENSE.txt
