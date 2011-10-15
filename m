From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:06:22 +0200
Subject: [Buildroot] [git commit] sysstat: bump to version 10.0.2
Message-ID: <20111015213657.8427F8D520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fadf98522870fee6d91fd0e0e622600f3fdf28c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sysstat/sysstat.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 30eaa73..0a17b4d 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-SYSSTAT_VERSION = 9.1.7
+SYSSTAT_VERSION = 10.0.2
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
-SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
+SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
 
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
