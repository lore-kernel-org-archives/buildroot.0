From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 1 Nov 2016 10:59:47 +0000
Subject: [Buildroot] [PATCH] lighttpd: bump version to 1.4.43
Message-ID: <20161101105947.56217-1-Vincent.Riera@imgtec.com>
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
index edec58f..c00236b 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,2 +1,2 @@
 # From http://www.lighttpd.net/
-sha256 b2c9069ed0bade9362c27b469a9b884641786aea1c3d686f9fd9f01d15e2a15f  lighttpd-1.4.42.tar.xz
+sha256 fe0c4a06dd2408a83ee7a2bfedc45e09597f3313cbda82485507573ae8fa948a  lighttpd-1.4.43.tar.xz
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 537604a..9f7599a 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).42
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).43
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
-- 
2.10.1
