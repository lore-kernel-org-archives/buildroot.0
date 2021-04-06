From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:37:59 +0200
Subject: [Buildroot] [git commit] package/python-iso8601: bump to version
 0.1.14
Message-ID: <20210406071628.1FADE7FC90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7df870920c96191d6ed7a7db29b48e876c854298
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/micktwomey/pyiso8601/releases/tag/0.1.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-iso8601/python-iso8601.hash | 4 ++--
 package/python-iso8601/python-iso8601.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iso8601/python-iso8601.hash b/package/python-iso8601/python-iso8601.hash
index 18cf3958da..76dd5ec452 100644
--- a/package/python-iso8601/python-iso8601.hash
+++ b/package/python-iso8601/python-iso8601.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iso8601/json
-md5  df6e924305fd799d90be63336b2ab8b3  iso8601-0.1.13.tar.gz
-sha256  f7dec22af52025d4526be94cc1303c7d8f5379b746a3f54a8c8446384392eeb1  iso8601-0.1.13.tar.gz
+md5  d6fe8ccc847aaf8ac965da3b6023e697  iso8601-0.1.14.tar.gz
+sha256  8aafd56fa0290496c5edbb13c311f78fa3a241f0853540da09d9363eae3ebd79  iso8601-0.1.14.tar.gz
 # Locally computed sha256 checksums
 sha256  116d368d14a8cf0061027c944c60ee20b476ce42814818a7d627396906761f16  LICENSE
diff --git a/package/python-iso8601/python-iso8601.mk b/package/python-iso8601/python-iso8601.mk
index 3620255db4..3f128d15e4 100644
--- a/package/python-iso8601/python-iso8601.mk
+++ b/package/python-iso8601/python-iso8601.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ISO8601_VERSION = 0.1.13
+PYTHON_ISO8601_VERSION = 0.1.14
 PYTHON_ISO8601_SOURCE = iso8601-$(PYTHON_ISO8601_VERSION).tar.gz
-PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/05/90/2d9927dc2d33192f58fe39d2d216313a8380625cd4b062efb93f1afd7a29
+PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/f9/ed/b97abc7877e5b253eef96a469f47d617b0ebcccc735405fa1a620c7ee833
 PYTHON_ISO8601_SETUP_TYPE = setuptools
 PYTHON_ISO8601_LICENSE = MIT
 PYTHON_ISO8601_LICENSE_FILES = LICENSE
