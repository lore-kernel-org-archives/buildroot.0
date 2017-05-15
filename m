From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 15 May 2017 13:56:37 +0100
Subject: [Buildroot] [PATCH next] sysstat: bump version to 11.4.4
Message-ID: <20170515125637.24381-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename --disable-man-group option to --disable-file-attr
https://github.com/sysstat/sysstat/commit/fcd4de4080e20705a09f475646dc431d8c9378ef

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/sysstat/sysstat.hash | 4 ++--
 package/sysstat/sysstat.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index 3b4dda8f1..8d4ecf48c 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,4 +1,4 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1 805002b2bef00cd9ab44c5037d09b29cb71a17f8  sysstat-11.4.3.tar.xz
+sha1 0e4950da333ff4e68826d58a6f43cb8048d85e9c  sysstat-11.4.4.tar.xz
 # Locally calculated
-sha256 02e9cafa5557fbae435d33e592373655df929d817ae711d31142dd2f7d4dcee7  sysstat-11.4.3.tar.xz
+sha256 6585f08e24347d2d6462aee6ef97e80fe4cc869605193184500df0f80fa61cc8  sysstat-11.4.4.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 31645b8f9..bd73214c3 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.4.3
+SYSSTAT_VERSION = 11.4.4
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
-SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
+SYSSTAT_CONF_OPTS = --disable-file-attr --disable-sensors
 SYSSTAT_DEPENDENCIES = host-gettext
 SYSSTAT_LICENSE = GPL-2.0+
 SYSSTAT_LICENSE_FILES = COPYING
-- 
2.13.0
