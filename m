From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-cssselect: bump to version 1.0.1
Message-ID: <20170302205923.1EDFA82298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a79fe21ab07b7f701bc8599d4962f6f3f3a43fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cssselect/python-cssselect.hash | 7 +++----
 package/python-cssselect/python-cssselect.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index d3ee055..4825950 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/cssselect/json
-md5	4c5931d8456dfe72fa4662f9c0509bfa  cssselect-0.9.2.tar.gz
-# sha256 locally computed
-sha256	713b5b99ef08022257b3409c7ae1b18b2c6536b3f155e6237c5cfba0f67ae6f5  cssselect-0.9.2.tar.gz
+# md5 from https://pypi.python.org/pypi/cssselect/json, sha256 locally computed
+md5 3fa03bf82a9f0b1223c0f1eb1369e139 cssselect-1.0.1.tar.gz
+sha256 73db1c054b9348409e2862fc6c0dde5c4e4fbe4da64c5c5a9e05fbea45744077 cssselect-1.0.1.tar.gz
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index 0db69b9..5a4b63b 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 0.9.2
+PYTHON_CSSSELECT_VERSION = 1.0.1
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://pypi.python.org/packages/11/21/47b5d2696a945da177d2344b6e330b7b0d1c52404063cb387d2261517ccb
+PYTHON_CSSSELECT_SITE = https://pypi.python.org/packages/77/ff/9c865275cd19290feba56344eba570e719efb7ca5b34d67ed12b22ebbb0d
 PYTHON_CSSSELECT_SETUP_TYPE = setuptools
 PYTHON_CSSSELECT_LICENSE = BSD-3c
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
