From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 28 Nov 2018 10:17:47 -0800
Subject: [Buildroot] [PATCH 1/1] dbus-python: bump to version 1.2.8
Message-ID: <20181128181747.96117-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/dbus-python/dbus-python.hash | 2 +-
 package/dbus-python/dbus-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-python/dbus-python.hash b/package/dbus-python/dbus-python.hash
index 080aada081..991bb42787 100644
--- a/package/dbus-python/dbus-python.hash
+++ b/package/dbus-python/dbus-python.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e2f1d6871f74fba23652e51d10873e54f71adab0525833c19bad9e99b1b2f9cc	dbus-python-1.2.4.tar.gz
+sha256	abf12bbb765e300bf8e2a1b2f32f85949eab06998dbda127952c31cb63957b6f	dbus-python-1.2.8.tar.gz
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index da04b7404f..d6af7454af 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_PYTHON_VERSION = 1.2.4
+DBUS_PYTHON_VERSION = 1.2.8
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT
-- 
2.19.2
