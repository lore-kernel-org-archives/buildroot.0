From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:47 -0500
Subject: [Buildroot] [PATCH 50/58] python-sh: bump to version 1.12.9
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-51-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index 0445fa6..ab3c4e0 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/sh/json, sha256 locally computed
-md5	89d46b1dba32713b7df74b1bc59d74a1  sh-1.12.7.tar.gz
-sha256	5a07373657a1a704a34ea1bf73b2e55c42388c5d449634d6d7c96147f5660086  sh-1.12.7.tar.gz
+md5 ddc128a8d943d25afa6e01af11e0063b sh-1.12.9.tar.gz
+sha256 579aa19bae7fe86b607df1afaf4e8537c453d2ce3d84e1d3957e099359a51677 sh-1.12.9.tar.gz
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 1aa6bb9..ed171cb 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 1.12.7
+PYTHON_SH_VERSION = 1.12.9
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://pypi.python.org/packages/c2/98/565d9b566b3153607336ae9e91c1c467896f7f786c2d5d8e50fef7d75b08
+PYTHON_SH_SITE = https://pypi.python.org/packages/fd/14/6deb4e89cc237ee4bc1c0b0485c77d7868477f96c47962366bc5fabc31fd
 PYTHON_SH_SETUP_TYPE = setuptools
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
-- 
2.9.3
