From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 16 Jan 2017 13:17:48 +0000
Subject: [Buildroot] [PATCH] lighttpd: bump version to 1.4.45
Message-ID: <20170116131748.41759-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lighttpd/lighttpd.hash | 2 +-
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index c325fda..36783ff 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,2 +1,2 @@
 # From http://www.lighttpd.net/
-sha256 adb66ca985651957feb209c91c55ebbf917d23630bfc3a216a2f70043c7b5422  lighttpd-1.4.44.tar.xz
+sha256 1c97225deea33eefba6d4158c2cef27913d47553263516bbe9d2e2760fc43a3f  lighttpd-1.4.45.tar.xz
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index c36c3b6..b3127ef 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).44
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).45
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
-- 
2.10.2
