From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:14:57 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python3: bump to
 version 3.7.7
Message-ID: <20200314170444.D7D698385E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb3060a063ad90df244f5bcc3899aa1da43ee79f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Bugfix release, fixing a number of issues.  For details, see the
announcement:

https://pythoninsider.blogspot.com/2020/03/python-377-is-now-available.html

Update the hash of the license file for a change in copyright years:

-2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019 Python Software Foundation;
+2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020 Python Software Foundation;

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 8 ++++----
 package/python3/python3.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 6e99cae59b..b091e9b0ee 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-376/
-md5 c08fbee72ad5c2c95b0f4e44bf6fd72c Python-3.7.6.tar.xz
+# From https://www.python.org/downloads/release/python-377/
+md5 172c650156f7bea68ce31b2fd01fa766 Python-3.7.7.tar.xz
 # Locally computed
-sha256 55a2cce72049f0794e9a11a84862e9039af9183603b78bc60d89539f82cf533f Python-3.7.6.tar.xz
-sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c LICENSE
+sha256 06a0a9f1bf0d8cd1e4121194d666c4e28ddae4dd54346de6c343206599f02136 Python-3.7.7.tar.xz
+sha256 de4d1f2d2ad5ad0cfd1657a106476b31cb5db5ef9d1ff842b237c0c81f0c8a23 LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7f93372c22..8b73d4a6e1 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.7
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
