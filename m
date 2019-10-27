From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Oct 2019 11:12:28 +0100
Subject: [Buildroot] [PATCH 2/2] package/dbus-python: bump to version 1.2.12
In-Reply-To: <20191027101228.6340-1-fontaine.fabrice@gmail.com>
References: <20191027101228.6340-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027101228.6340-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dbus-python/dbus-python.hash | 2 +-
 package/dbus-python/dbus-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-python/dbus-python.hash b/package/dbus-python/dbus-python.hash
index 5bf2f507c6..d5448249b4 100644
--- a/package/dbus-python/dbus-python.hash
+++ b/package/dbus-python/dbus-python.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	abf12bbb765e300bf8e2a1b2f32f85949eab06998dbda127952c31cb63957b6f	dbus-python-1.2.8.tar.gz
+sha256	cdd4de2c4f5e58f287b12013ed7b41dee81d503c8d0d2397c5bd2fb01badf260	dbus-python-1.2.12.tar.gz
 
 # Locally calculated
 sha256	1e4562245383fdb5203b1769789e5b28bba21af4923aea7e8b2614f7f93623c0	COPYING
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index c3a3649396..33f2358876 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_PYTHON_VERSION = 1.2.8
+DBUS_PYTHON_VERSION = 1.2.12
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT
-- 
2.23.0
