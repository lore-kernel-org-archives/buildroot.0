From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:09:22 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] dbus: bump to version
	1.10.14
Message-ID: <20170226211412.257C080AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27970846347ecd1ac389d5567b8143857e0cecfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3229c7c12d6edee36c9fe0c8755d8bbdfc092a52)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash | 2 +-
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 27d38ea..14bee20 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	210a79430b276eafc6406c71705e9140d25b9956d18068df98a70156dc0e475d  dbus-1.10.12.tar.gz
+sha256	23238f70353e38ce5ca183ebc9525c0d97ac00ef640ad29cf794782af6e6a083  dbus-1.10.14.tar.gz
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 8657128..c765e0a 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.10.12
+DBUS_VERSION = 1.10.14
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 or GPLv2+ (library, tools), GPLv2+ (tools)
 DBUS_LICENSE_FILES = COPYING
