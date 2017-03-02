From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-pyparsing: bump to version 2.1.10
Message-ID: <20170302205924.417117FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21c61a81aad3d2ecfede2093f86669fd491f4ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 6cf686a..6138580 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pyparsing/json, sha256 locally computed
-md5	ee943c354eac79526533c58342f322c7  pyparsing-2.1.9.tar.gz
-sha256	93326f5490bcfe7069806ff342692e75f72529cfa82f20683b5fceeb5d4a7fc2  pyparsing-2.1.9.tar.gz
+md5 065908b92904e0d3634eb156f44cc80e pyparsing-2.1.10.tar.gz
+sha256 811c3e7b0031021137fc83e051795025fcb98674d07eb8fe922ba4de53d39188 pyparsing-2.1.10.tar.gz
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 652345d..4a4b1bb 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 2.1.9
+PYTHON_PYPARSING_VERSION = 2.1.10
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://pypi.python.org/packages/87/ee/6f3a94d834c82a5c1a74f2fc77775ff05b5fbbf7d97f844e6fff5e2ff94b
+PYTHON_PYPARSING_SITE = https://pypi.python.org/packages/38/bb/bf325351dd8ab6eb3c3b7c07c3978f38b2103e2ab48d59726916907cd6fb
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = setuptools
