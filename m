From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Feb 2017 16:14:36 -0300
Subject: [Buildroot] [PATCH master] dbus: security bump to version 1.10.16
Message-ID: <20170216191436.18244-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
* Symlink attack in nonce-tcp transport.
* Symlink attack in unit tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus/dbus.hash | 2 +-
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 14bee20..af8143d 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	23238f70353e38ce5ca183ebc9525c0d97ac00ef640ad29cf794782af6e6a083  dbus-1.10.14.tar.gz
+sha256	a7b0ba6ea3e8d0e08afec5e3030d0245614268276620c536726f8fa6e5c43388  dbus-1.10.16.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index c765e0a..2d1583e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.14
+DBUS_VERSION = 1.10.16
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 or GPLv2+ (library, tools), GPLv2+ (tools)
 DBUS_LICENSE_FILES = COPYING
-- 
2.10.2
