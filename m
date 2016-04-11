From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Apr 2016 15:29:41 -0300
Subject: [Buildroot] [PATCH] sysstat: bump to version 11.2.3
Message-ID: <1460399381-2634-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysstat/sysstat.hash | 2 +-
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index 3714258..655cafe 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,2 +1,2 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1	01dd5212efff6eff6f9018711de3de471516060e	sysstat-11.2.1.1.tar.xz
+sha1	7e9422e985b65728d007bd38d4a8d090aa795826	sysstat-11.2.3.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 449c30a..a16054f 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.2.1.1
+SYSSTAT_VERSION = 11.2.3
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
-- 
2.7.3
