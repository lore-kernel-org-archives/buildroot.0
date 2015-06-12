From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Jun 2015 16:23:11 -0300
Subject: [Buildroot] [PATCH 3/3] sysstat: bump to version 11.0.5
In-Reply-To: <1434136991-26950-1-git-send-email-gustavo@zacarias.com.ar>
References: <1434136991-26950-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1434136991-26950-3-git-send-email-gustavo@zacarias.com.ar>
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
index 226ff06..a170f81 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,2 +1,2 @@
 # From http://sebastien.godard.pagesperso-orange.fr/download.html
-md5	df1ed75656eb06320088d54247f0e803	sysstat-11.0.4.tar.xz
+md5	4d8e6e72d057189a1660462a678d9ada	sysstat-11.0.5.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 6bdd3b8..b28c029 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.0.4
+SYSSTAT_VERSION = 11.0.5
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
-- 
2.3.6
