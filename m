From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 10:20:50 -0300
Subject: [Buildroot] [PATCH] sysstat: bump to version 11.0.1
Message-ID: <1410960050-3177-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysstat/sysstat.hash | 2 ++
 package/sysstat/sysstat.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/sysstat/sysstat.hash

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
new file mode 100644
index 0000000..8ec534c
--- /dev/null
+++ b/package/sysstat/sysstat.hash
@@ -0,0 +1,2 @@
+# From http://sebastien.godard.pagesperso-orange.fr/download.html
+md5	7d19d02294dc1befd48846caf2f3cafe	sysstat-11.0.1.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 8365087..9d413fe 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.0.0
-SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
+SYSSTAT_VERSION = 11.0.1
+SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
 SYSSTAT_DEPENDENCIES = host-gettext
-- 
1.8.5.5
