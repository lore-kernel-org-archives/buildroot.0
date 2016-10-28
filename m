From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Oct 2016 12:09:07 -0300
Subject: [Buildroot] [PATCH] json-glib: bump to version 1.2.2
Message-ID: <1477667347-4861-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/json-glib/json-glib.hash | 4 ++--
 package/json-glib/json-glib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index 18e1aa0..2a56939 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.2/json-glib-1.2.0.sha256sum
-sha256	99d6dfbe49c08fd7529f1fe8dcb1893b810a1bb222f1e7b65f41507658b8a7d3	json-glib-1.2.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.2/json-glib-1.2.2.sha256sum
+sha256	ea128ab52a824fcd06e5448fbb2bd8d9a13740d51c66d445828edba71321a621	json-glib-1.2.2.tar.xz
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index f7c52c0..305c9ac 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 JSON_GLIB_VERSION_MAJOR = 1.2
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).0
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).2
 JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPLv2.1+
-- 
2.7.3
