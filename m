From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:35:48 +0100
Subject: [Buildroot] [git commit] package/glib-networking: bump to version
 2.66.0
Message-ID: <20201221093424.9DBC380567@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78dc1dddd0ad8e182cf65ca7b5247adebde135ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/glib-networking/-/blob/2.66.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glib-networking/glib-networking.hash | 4 ++--
 package/glib-networking/glib-networking.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 336e0aa07b..976a19f25e 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.64/glib-networking-2.64.3.sha256sum
-sha256  937a06b124052813bfc0b0b86bff42016ff01067582e1aca65bb6dbe0845a168  glib-networking-2.64.3.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.66/glib-networking-2.66.0.sha256sum
+sha256  c5d7be2437fdd196eebfb70c4517b96d3ba7ec13bd496318b8f02dea383e0099  glib-networking-2.66.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 295c7516cc..743053390f 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.64
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).3
+GLIB_NETWORKING_VERSION_MAJOR = 2.66
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
