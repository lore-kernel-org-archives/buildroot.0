From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 22:04:37 +0200
Subject: [Buildroot] [git commit] package/lighttpd: bump to version 1.4.54
Message-ID: <20190907200028.E3E5E8CA45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7af499631cc5036e71217d39052b3f89c3359b3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See http://www.lighttpd.net/2019/5/27/1.4.54/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 926de33ef2..e998738689 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.53.sha256sum
-sha256 3bdfce1cf3e9650a556a8c26fb15342c5717c63f530c54693db632b0371dcb78  lighttpd-1.4.53.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.54.sha256sum
+sha256 cf14cce2254a96d8fcb6d3181e1a3c29a8f832531c3e86ff6f2524ecda9a8721  lighttpd-1.4.54.tar.xz
 # Locally calculated
 sha256 5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index f50a4af935..449b4b4de2 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).53
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).54
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
