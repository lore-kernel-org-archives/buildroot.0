From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 21:57:44 +0100
Subject: [Buildroot] [git commit] json-glib: bump version to 1.2.6
Message-ID: <20170315205804.A95DA7FAF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dde97d483278c2bca07af5467b6c477d00544cb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-glib/json-glib.hash | 4 ++--
 package/json-glib/json-glib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index 2a56939..bf85770 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.2/json-glib-1.2.2.sha256sum
-sha256	ea128ab52a824fcd06e5448fbb2bd8d9a13740d51c66d445828edba71321a621	json-glib-1.2.2.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.2/json-glib-1.2.6.sha256sum
+sha256 958fa59909ef28399c811aff29a5340b330b20660ca3586b4c5aa3a53997776c  json-glib-1.2.6.tar.xz
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 305c9ac..8b8a3cf2 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 JSON_GLIB_VERSION_MAJOR = 1.2
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).2
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
 JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPLv2.1+
