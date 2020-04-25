From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 25 Apr 2020 16:10:21 -0500
Subject: [Buildroot] [PATCH] package/dbus-python: bump to version 1.2.16
Message-ID: <20200425211021.24470-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert hash file from tabs to spaces.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/dbus-python/dbus-python.hash | 6 +++---
 package/dbus-python/dbus-python.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dbus-python/dbus-python.hash b/package/dbus-python/dbus-python.hash
index 58b0a75908..e65695d616 100644
--- a/package/dbus-python/dbus-python.hash
+++ b/package/dbus-python/dbus-python.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	cdd4de2c4f5e58f287b12013ed7b41dee81d503c8d0d2397c5bd2fb01badf260	dbus-python-1.2.12.tar.gz
+sha256  11238f1d86c995d8aed2e22f04a1e3779f0d70e587caffeab4857f3c662ed5a4  dbus-python-1.2.16.tar.gz
 
 # Locally calculated
-sha256	1e4562245383fdb5203b1769789e5b28bba21af4923aea7e8b2614f7f93623c0	COPYING
-sha256	064523e3ab64d6f03904132b2cc4a1bd8500586edb4cd050c2ff2b96aed4c33b	dbus-gmain/COPYING
+sha256  1e4562245383fdb5203b1769789e5b28bba21af4923aea7e8b2614f7f93623c0  COPYING
+sha256  064523e3ab64d6f03904132b2cc4a1bd8500586edb4cd050c2ff2b96aed4c33b  dbus-gmain/COPYING
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index cf4882d8ee..f4b8996d76 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_PYTHON_VERSION = 1.2.12
+DBUS_PYTHON_VERSION = 1.2.16
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT (dbus-python), AFL-2.1 or GPL-2.0+ (dbus-gmain)
-- 
2.17.1
