From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Jul 2019 08:11:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/json-glib: bump to version 1.4.4
In-Reply-To: <20190702061113.24985-1-fontaine.fabrice@gmail.com>
References: <20190702061113.24985-1-fontaine.fabrice@gmail.com>
Message-ID: <20190702061113.24985-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-glib/json-glib.hash | 4 ++--
 package/json-glib/json-glib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index fae4df36d4..b68794db37 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.4/json-glib-1.4.2.sha256sum
-sha256 2d7709a44749c7318599a6829322e081915bdc73f5be5045882ed120bb686dc8  json-glib-1.4.2.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.4/json-glib-1.4.4.sha256sum
+sha256 720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9fabec4374f4bc47  json-glib-1.4.4.tar.xz
 
 # Hash for license file:
 sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 2d4adb2adb..5c14dcba88 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 JSON_GLIB_VERSION_MAJOR = 1.4
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).2
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).4
 JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+
-- 
2.20.1
