From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:09:47 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] dbus: security bump to
	version 1.10.16
Message-ID: <20170226211412.30C54802BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17a052f38adb321c8c6533494932362827c088d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

From http://www.openwall.com/lists/oss-security/2017/02/16/4

The latest dbus release 1.10.16 fixes two symlink attacks in
non-production-suitable configurations. I am treating these as bugs
rather than practical vulnerabilities, and very much hope neither of
these is going to affect any real users, but I'm reporting them to
oss-security in case there's an attack vector that I've missed.

No CVEs assigned so far.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c9556ed90f22185b3abf822f0fe07afea661938a)
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
