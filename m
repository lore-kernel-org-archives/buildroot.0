From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jan 2019 08:37:04 +0100
Subject: [Buildroot] [git commit] package/lighttpd: bump to version 1.4.52
Message-ID: <20190110073727.5EBF78B468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec69d3820fee7af759c4cbdd422b7acfc877a849
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes location header parsing regression introduced in 1.4.51:
https://redmine.lighttpd.net/issues/2918

Fixes header setting regression introduced in 1.4.51:
https://redmine.lighttpd.net/issues/2919

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.hash | 2 +-
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 0829c6b4c9..0fb00bf568 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
 # From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.51.sha256sum
-sha256 2af9fdb265d1f025bfa634e13770239712ecbd585e4975b8226edf1df74e9c82  lighttpd-1.4.51.tar.xz
+sha256 27bc0991c530b7c6335e6efff2181934d3c1a1c516f7401ea71d8302cefda764  lighttpd-1.4.52.tar.xz
 # Locally calculated
 sha256 5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index d8f64dc7e8..5c0315a265 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).51
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).52
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
