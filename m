From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:52:18 +0200
Subject: [Buildroot] [git commit] package/python3: bump version to 3.6.3
Message-ID: <20171015134529.47117810D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e877fb4fe2b1a9f29e0c75a3404066ebc34e147a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed _SITE to https.

Release notes:
https://docs.python.org/3.6/whatsnew/changelog.html#python-3-6-3-final

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index f4734db..33adb18 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-362/
-md5 2c68846471994897278364fc18730dd9 Python-3.6.2.tar.xz
+# From https://www.python.org/downloads/release/python-363/
+md5 b9c2c36c33fb89bda1fefd37ad5af9be Python-3.6.3.tar.xz
 # Locally computed
-sha256 9229773be41ed144370f47f0f626a1579931f5a390f1e8e3853174d52edd64a9 Python-3.6.2.tar.xz
+sha256 cda7d967c9a4bfa52337cdf551bcc5cff026b6ac50a8834e568ce4a794ca81da Python-3.6.3.tar.xz
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7473737..1d2201e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.6
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
-PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
+PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
 PYTHON3_LICENSE_FILES = LICENSE
 
