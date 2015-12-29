From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 18:01:27 +0100
Subject: [Buildroot] [git commit] sysstat: bump to version 11.2.0
Message-ID: <20151229170138.1977E8191E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cc14edba9ac894680221e48cfc1bf669af86391
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysstat/sysstat.hash | 2 +-
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index fc55ec9..d69440b 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,2 +1,2 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1 22910242c6c5c1a0ff9699ef212195f90aa4d9ae  sysstat-11.0.8.tar.xz
+sha1	61b70892d864f8bac5714e2fe0a006f0fda6efba	sysstat-11.2.0.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 7747a68..ba0eb26 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.0.8
+SYSSTAT_VERSION = 11.2.0
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
