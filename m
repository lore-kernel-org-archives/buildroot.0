From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 3 Dec 2015 11:28:27 +0000
Subject: [Buildroot] [PATCH] sysstat: bump version to 11.0.8
Message-ID: <1449142107-6342-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/sysstat/sysstat.hash | 4 ++--
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index f535b54..fc55ec9 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,2 +1,2 @@
-# From http://sebastien.godard.pagesperso-orange.fr/download.html
-md5	438d607cd14357a24969633b9798d2be	sysstat-11.0.5.tar.xz
+# From: http://sebastien.godard.pagesperso-orange.fr/download.html
+sha1 22910242c6c5c1a0ff9699ef212195f90aa4d9ae  sysstat-11.0.8.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 7568a4b..7747a68 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.0.5
+SYSSTAT_VERSION = 11.0.8
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
-- 
2.4.10
