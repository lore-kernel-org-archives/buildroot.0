From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 22:14:08 +0100
Subject: [Buildroot] [git commit] package/lighttpd: bump to version 1.4.53
Message-ID: <20190127212827.5333E8137C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68ec36d9fa95d1e8ca314c931a05d5fc0e5870d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 93581a9abb..926de33ef2 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.52.sha256sum
-sha256 27bc0991c530b7c6335e6efff2181934d3c1a1c516f7401ea71d8302cefda764  lighttpd-1.4.52.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.53.sha256sum
+sha256 3bdfce1cf3e9650a556a8c26fb15342c5717c63f530c54693db632b0371dcb78  lighttpd-1.4.53.tar.xz
 # Locally calculated
 sha256 5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5c0315a265..f50a4af935 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).52
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).53
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
