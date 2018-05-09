From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed,  9 May 2018 17:47:15 +0200
Subject: [Buildroot] [PATCH 1/1] dbus-glib: Bump to version 0.110
Message-ID: <20180509154715.24517-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/dbus-glib/dbus-glib.hash | 2 +-
 package/dbus-glib/dbus-glib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
index 732ae97c86..8a80b71b45 100644
--- a/package/dbus-glib/dbus-glib.hash
+++ b/package/dbus-glib/dbus-glib.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 9f340c7e2352e9cdf113893ca77ca9075d9f8d5e81476bf2bf361099383c602c  dbus-glib-0.108.tar.gz
+sha256 7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825  dbus-glib-0.110.tar.gz
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 2257c8e4f9..372942e1c3 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_GLIB_VERSION = 0.108
+DBUS_GLIB_VERSION = 0.110
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
-- 
2.16.3
