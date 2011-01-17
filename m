From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] sysstat: bump to version 9.1.7
Message-ID: <20110117202413.C61918A6AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f51cb1a3bd5572d421a073f4cd61dabd0fd6b28a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes some new metrics for sar (amount of active and inactive memory,
processes blocked waiting for I/O to complete).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sysstat/sysstat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index c5fe5c9..09e5177 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SYSSTAT_VERSION = 9.1.6
+SYSSTAT_VERSION = 9.1.7
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
-- 
1.7.3.4
