From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Aug 2016 20:07:12 -0300
Subject: [Buildroot] [PATCH] sysstat: bump to version 11.4.0
Message-ID: <1471388832-19389-1-git-send-email-gustavo@zacarias.com.ar>
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
index 539bbed..3170fc9 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,2 +1,2 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1	ef97b454c254a37587485f61071db1fd9374f276	sysstat-11.2.5.tar.xz
+sha1	59769deddef02acd60db3a42d772e57bd0978efb	sysstat-11.4.0.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 1be3d82..de6cd9f 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.2.5
+SYSSTAT_VERSION = 11.4.0
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
-- 
2.7.3
