From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jun 2017 15:13:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-idna: bump version to 2.5
Message-ID: <20170617131302.15009-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-idna/python-idna.hash | 4 ++--
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index e3c2ab4d7f..839154a06f 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/idna/json, sha256 locally computed
-md5 e2d3f8a45d3d048a653eb186896e9e3e idna-2.2.tar.gz
-sha256 0ac27740937d86850010e035c6a10a564158a5accddf1aa24df89b0309252426 idna-2.2.tar.gz
+md5 fc1d992bef73e8824db411bb5d21f012 idna-2.5.tar.gz
+sha256 3cb5ce08046c4e3a560fc02f138d0ac63e00f8ce5901a56b32ec8b7994082aab idna-2.5.tar.gz
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 7e3a3174ba..c8d1793e0a 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 2.2
+PYTHON_IDNA_VERSION = 2.5
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://pypi.python.org/packages/94/fe/efb1cb6f505e1a560b3d080ae6b9fddc11e7c542d694ce4635c49b1ccdcb
+PYTHON_IDNA_SITE = https://pypi.python.org/packages/d8/82/28a51052215014efc07feac7330ed758702fc0581347098a81699b5281cb
 PYTHON_IDNA_LICENSE =  BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.rst
 PYTHON_IDNA_SETUP_TYPE = setuptools
-- 
2.11.0
