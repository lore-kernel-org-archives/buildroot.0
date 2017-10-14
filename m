From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Oct 2017 14:39:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/python3: bump version to 3.6.3
Message-ID: <20171014124000.18286-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed _SITE to https.

Release notes:
https://docs.python.org/3.6/whatsnew/changelog.html#python-3-6-3-final

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index f4734db52c..1a1f71cb42 100644
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
index 7473737bc7..1d2201eec7 100644
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
 
-- 
2.11.0
