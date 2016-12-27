From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Dec 2016 10:35:20 +0100
Subject: [Buildroot] [git commit] lighttpd: bump to version 1.4.44
Message-ID: <20161227093822.E9E6681E53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b36b2d023fc30a1b6fd2616e6f53d61b90ca0ab3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.hash | 2 +-
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index c00236b..c325fda 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,2 +1,2 @@
 # From http://www.lighttpd.net/
-sha256 fe0c4a06dd2408a83ee7a2bfedc45e09597f3313cbda82485507573ae8fa948a  lighttpd-1.4.43.tar.xz
+sha256 adb66ca985651957feb209c91c55ebbf917d23630bfc3a216a2f70043c7b5422  lighttpd-1.4.44.tar.xz
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 9f7599a..c36c3b6 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).43
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).44
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
