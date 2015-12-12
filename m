From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 14:16:27 +0100
Subject: [Buildroot] [git commit] package/python: bump to version 2.7.11
Message-ID: <20151212131720.3FB6680E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fd47ce1a84c335a4d57b995571534ebfb0b79e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Thomas: quick run-time test on ARM.]
---
 package/python/python.hash | 6 +++---
 package/python/python.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python/python.hash b/package/python/python.hash
index ef8dd98..d1cf1ba 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-2710/
-md5	c685ef0b8e9f27b5e3db5db12b268ac6	Python-2.7.10.tar.xz
+# From https://www.python.org/downloads/release/python-2711/
+md5	1dbcc848b4cd8399a8199d000f9f823c	Python-2.7.11.tar.xz
 # Locally calculated
-sha256	1cd3730781b91caf0fa1c4d472dc29274186480161a150294c42ce9b5c5effc0	Python-2.7.10.tar.xz
+sha256	962b4c45af50124ea61f11a30deb4342fc0bc21126790fa1d7f6c79809413f46  Python-2.7.11.tar.xz
diff --git a/package/python/python.mk b/package/python/python.mk
index 80ffbde..4ecd0d1 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).10
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).11
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python software foundation license v2, others
