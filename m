From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Jul 2021 23:20:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/dbus-glib: bump to version 0.112
Message-ID: <20210720212039.356674-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Update hash of COPYING (SPDX added with
  https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/96479fb8fd5e2f8896cdce7feff7839dcb47a7d1
  https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/d42176ae4763e5288ef37ea314fe58387faf2005)
- Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/dbus/dbus-glib/-/blob/dbus-glib-0.112/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dbus-glib/dbus-glib.hash | 4 ++--
 package/dbus-glib/dbus-glib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
index 098832431e..072dde3d69 100644
--- a/package/dbus-glib/dbus-glib.hash
+++ b/package/dbus-glib/dbus-glib.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825  dbus-glib-0.110.tar.gz
+sha256  7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a  dbus-glib-0.112.tar.gz
 
 # Locally calculated
-sha256 ef1634fc21d9112dca08f2557313584719d534d05213cf14f3c77938506266b4  COPYING
+sha256  589bc300214a8b9ecd121f51570fe6342617487fd8fc0fb1f4ec26a13d5b96f8  COPYING
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 5eb158d954..0d247e1d89 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_GLIB_VERSION = 0.110
+DBUS_GLIB_VERSION = 0.112
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
-- 
2.30.2
