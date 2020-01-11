From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 23:07:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/qhull: bump to version 7.3.2
Message-ID: <20200111220731.1892481-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qhull/qhull.hash | 7 ++++---
 package/qhull/qhull.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/qhull/qhull.hash b/package/qhull/qhull.hash
index 4f059f2b5b..b97c25a3f7 100644
--- a/package/qhull/qhull.hash
+++ b/package/qhull/qhull.hash
@@ -1,4 +1,5 @@
-# From http://www.qhull.org/download/qhull-2015.2.md5sum
-md5	e6270733a826a6a7c32b796e005ec3dc	qhull-2015-src-7.2.0.tgz
+# From http://www.qhull.org/download/qhull-2019.1.md5sum
+md5	53c04f9c89b491b17b10c7ea1eaa4cc8	qhull-2019-src-7.3.2.tgz
 # Locally computed
-sha256	78b010925c3b577adc3d58278787d7df08f7c8fb02c3490e375eab91bb58a436	qhull-2015-src-7.2.0.tgz
+sha256	2b7990558c363076261564f61b74db4d0d73b71869755108a469038c07dc43fb	qhull-2019-src-7.3.2.tgz
+sha256	34db0c0c4f931861d720555c9cd7a2e228d1290ba29af0f2ee80c41bb2038afb	COPYING.txt
diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
index 8ea38f01ad..fcf517634b 100644
--- a/package/qhull/qhull.mk
+++ b/package/qhull/qhull.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-QHULL_VERSION = 7.2.0
+QHULL_VERSION = 7.3.2
 QHULL_SITE = http://www.qhull.org/download
-QHULL_SOURCE = qhull-2015-src-$(QHULL_VERSION).tgz
+QHULL_SOURCE = qhull-2019-src-$(QHULL_VERSION).tgz
 QHULL_INSTALL_STAGING = YES
 QHULL_LICENSE = BSD-Style
 QHULL_LICENSE_FILES = COPYING.txt
-- 
2.24.1
