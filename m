From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:11:59 -0500
Subject: [Buildroot] [PATCH 02/58] python-backports-abc: bump to version 0.5
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-3-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-backports-abc/python-backports-abc.hash | 6 +++---
 package/python-backports-abc/python-backports-abc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-backports-abc/python-backports-abc.hash b/package/python-backports-abc/python-backports-abc.hash
index 07e954e..f638527 100644
--- a/package/python-backports-abc/python-backports-abc.hash
+++ b/package/python-backports-abc/python-backports-abc.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=0b65a216ce9dc9c1a7e20a729dd7c05b, sha256 locally computed
-md5     0b65a216ce9dc9c1a7e20a729dd7c05b backports_abc-0.4.tar.gz
-sha256  8b3e4092ba3d541c7a2f9b7d0d9c0275b21c6a01c53a61c731eba6686939d0a5  backports_abc-0.4.tar.gz
+# md5 from https://pypi.python.org/pypi/backports_abc/json, sha256 locally computed
+md5 7d1936ec183a3586290adf60f6f96764 backports_abc-0.5.tar.gz
+sha256 033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde backports_abc-0.5.tar.gz
diff --git a/package/python-backports-abc/python-backports-abc.mk b/package/python-backports-abc/python-backports-abc.mk
index 1e3a9a6..f84318b 100644
--- a/package/python-backports-abc/python-backports-abc.mk
+++ b/package/python-backports-abc/python-backports-abc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BACKPORTS_ABC_VERSION = 0.4
+PYTHON_BACKPORTS_ABC_VERSION = 0.5
 PYTHON_BACKPORTS_ABC_SOURCE = backports_abc-$(PYTHON_BACKPORTS_ABC_VERSION).tar.gz
-PYTHON_BACKPORTS_ABC_SITE = https://pypi.python.org/packages/source/b/backports_abc
+PYTHON_BACKPORTS_ABC_SITE = https://pypi.python.org/packages/68/3c/1317a9113c377d1e33711ca8de1e80afbaf4a3c950dd0edfaf61f9bfe6d8
 PYTHON_BACKPORTS_ABC_LICENSE = Python Software Foundation License
 PYTHON_BACKPORTS_ABC_SETUP_TYPE = setuptools
 
-- 
2.9.3
