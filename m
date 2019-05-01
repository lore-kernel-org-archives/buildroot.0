From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 09:25:47 +0200
Subject: [Buildroot] [git commit] package/python-mutagen: bump to version
 1.42.0
Message-ID: <20190501072308.096AE83D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=340c6b8006b3d613955db0bf6d202572d68acdde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for the license file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-mutagen/python-mutagen.hash | 5 +++--
 package/python-mutagen/python-mutagen.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-mutagen/python-mutagen.hash b/package/python-mutagen/python-mutagen.hash
index 337100677c..5ee8ed17c7 100644
--- a/package/python-mutagen/python-mutagen.hash
+++ b/package/python-mutagen/python-mutagen.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/mutagen/json, sha256 locally computed
-md5 af52956a1b8976accf402f3104b95a84 mutagen-1.36.2.tar.gz
-sha256 86fe98e941ca305be8ee6bdc6bb0e4e9c473bf9fb69a838fe5bf2fc6124fbcc7 mutagen-1.36.2.tar.gz
+md5 3729218f974c3a79ee9972ffa5ca5d12 mutagen-1.42.0.tar.gz
+sha256 bb61e2456f59a9a4a259fbc08def6d01ba45a42da8eeaa97d00633b0ec5de71c mutagen-1.42.0.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
index 3b516fe128..5477d6f4c8 100644
--- a/package/python-mutagen/python-mutagen.mk
+++ b/package/python-mutagen/python-mutagen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MUTAGEN_VERSION = 1.36.2
+PYTHON_MUTAGEN_VERSION = 1.42.0
 PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
-PYTHON_MUTAGEN_SITE = https://pypi.python.org/packages/e7/8a/61496657e30c2cbeb9b3aa28848e0adbcba7cab0ff0bd8e6206647670088
+PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/30/4c/5ad1a6e1ccbcfaf6462db727989c302d9d721beedd9b09c11e6f0c7065b0
 PYTHON_MUTAGEN_LICENSE = GPL-2.0
 PYTHON_MUTAGEN_LICENSE_FILES = COPYING
 PYTHON_MUTAGEN_SETUP_TYPE = distutils
