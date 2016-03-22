From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Mar 2016 19:08:50 -0300
Subject: [Buildroot] [PATCH] json-glib: bump to version 1.2.0
Message-ID: <1458684530-1446-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/json-glib/json-glib.hash | 4 ++--
 package/json-glib/json-glib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index dd8bf54..18e1aa0 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/0.14/json-glib-0.14.2.sha256sum
-sha256	b816a5fa3e5664b08679a6972a6e5693d6cc1990ff4a6f94c07554db96be94a7	json-glib-0.14.2.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.2/json-glib-1.2.0.sha256sum
+sha256	99d6dfbe49c08fd7529f1fe8dcb1893b810a1bb222f1e7b65f41507658b8a7d3	json-glib-1.2.0.tar.xz
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index cffe958..f7c52c0 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 0.14
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).2
+JSON_GLIB_VERSION_MAJOR = 1.2
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).0
 JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPLv2.1+
-- 
2.7.3
