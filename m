From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 08:04:45 +0200
Subject: [Buildroot] [git commit] dbus: security bump to version 1.10.12
Message-ID: <20161013060802.40F2882269@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=420bfabf4702f511d1472a0a31ee928209966266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
Format string vulnerability processing ActivationFailure messages

See:
https://bugs.freedesktop.org/show_bug.cgi?id=98157

CVE not assigned yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash | 2 +-
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 1b20d3f..27d38ea 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9d8f1d069ab4d1a0255d7b400ea3bcef4430c42e729b1012abb2890e3f739a43  dbus-1.10.10.tar.gz
+sha256	210a79430b276eafc6406c71705e9140d25b9956d18068df98a70156dc0e475d  dbus-1.10.12.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 1388e34..8657128 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.10
+DBUS_VERSION = 1.10.12
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 or GPLv2+ (library, tools), GPLv2+ (tools)
 DBUS_LICENSE_FILES = COPYING
