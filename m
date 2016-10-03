From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Oct 2016 13:14:23 +0200
Subject: [Buildroot] [git commit] dbus-glib: bump version to 0.108
Message-ID: <20161003111634.DADDC80468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5446fc690a776375aa136132405d907a82502c86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-glib/dbus-glib.hash | 2 +-
 package/dbus-glib/dbus-glib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
index e5a2ebc..732ae97 100644
--- a/package/dbus-glib/dbus-glib.hash
+++ b/package/dbus-glib/dbus-glib.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 b38952706dcf68bad9c302999ef0f420b8cf1a2428227123f0ac4764b689c046  dbus-glib-0.106.tar.gz
+sha256 9f340c7e2352e9cdf113893ca77ca9075d9f8d5e81476bf2bf361099383c602c  dbus-glib-0.108.tar.gz
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index e191507..4a1e4b4 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_GLIB_VERSION = 0.106
+DBUS_GLIB_VERSION = 0.108
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFLv2.1, GPLv2+
