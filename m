From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 18:17:04 +0100
Subject: [Buildroot] [git commit] sysstat: bump to version 11.4.2
Message-ID: <20161209171846.96C317FF29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd9d6cd0586ed51f5145478b1cf7a8b63f5671c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add local sha256 hash as suggested by Vicente]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysstat/sysstat.hash | 4 +++-
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index 3170fc9..5de5ec7 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,2 +1,4 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1	59769deddef02acd60db3a42d772e57bd0978efb	sysstat-11.4.0.tar.xz
+sha1	84ac7feba76049f201e203c7ce0cc750479a9d43	sysstat-11.4.2.tar.xz
+# Locally calculated
+sha256	1fd407f8971f5854bc853d931dd85bcbea08658130f3f8510a730d5561980f39  sysstat-11.4.2.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index de6cd9f..1a86fa0 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.4.0
+SYSSTAT_VERSION = 11.4.2
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
