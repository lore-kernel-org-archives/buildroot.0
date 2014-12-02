From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 13:00:18 +0100
Subject: [Buildroot] [git commit] sysstat: bump to version 11.0.2
Message-ID: <20141202120522.CD7AE80075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d855e9e52e062c600f748e6b356fd17ed79d7d14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysstat/sysstat.hash |    2 +-
 package/sysstat/sysstat.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index 8ec534c..1a96e2f 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,2 +1,2 @@
 # From http://sebastien.godard.pagesperso-orange.fr/download.html
-md5	7d19d02294dc1befd48846caf2f3cafe	sysstat-11.0.1.tar.xz
+md5	27d4ca66869dce132ace3194dd7d7539	sysstat-11.0.2.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 0a80040..30fd9b2 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.0.1
+SYSSTAT_VERSION = 11.0.2
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
