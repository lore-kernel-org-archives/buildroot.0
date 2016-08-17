From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 15:04:37 +0200
Subject: [Buildroot] [git commit branch/next] sysstat: bump to version 11.4.0
Message-ID: <20160817130538.D400082125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27ccabcadb3f421686ac78e4fa3295e7c2a734c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
