From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 22:13:21 +0100
Subject: [Buildroot] [git commit] package/python3: bump to version 3.8.2
Message-ID: <20200227210134.207CB81486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed19f4d231706af25a6f35a2eb067392ce0a15d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixing a number of issues.  For details, see the
announcement:

https://docs.python.org/release/3.8.2/whatsnew/changelog.html#python-3-8-2-final

Adjust the spacing in the hash file and update the hash of the license file
for a change in copyright years:

-2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019 Python Software Foundation;
+2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020 Python Software Foundation;

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 8 ++++----
 package/python3/python3.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 3773825b43..cb7c6b2f25 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-380/
-md5		b3fb85fd479c0bf950c626ef80cacb57 Python-3.8.1.tar.xz
+# From https://www.python.org/downloads/release/python-382/
+md5  e9d6ebc92183a177b8e8a58cad5b8d67  Python-3.8.2.tar.xz
 # Locally computed
-sha256 75894117f6db7051c1b34f37410168844bbb357c139a8a10a352e9bf8be594e8 Python-3.8.1.tar.xz
-sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c LICENSE
+sha256  2646e7dc233362f59714c6193017bb2d6f7b38d6ab4a0cb5fbac5c36c4d845df  Python-3.8.2.tar.xz
+sha256  de4d1f2d2ad5ad0cfd1657a106476b31cb5db5ef9d1ff842b237c0c81f0c8a23  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6a12c1f0e8..d12237300d 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.8
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
