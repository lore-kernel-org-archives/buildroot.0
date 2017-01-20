From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Jan 2017 17:25:45 -0300
Subject: [Buildroot] [PATCH] hdparm: bump to version 9.51
Message-ID: <20170120202545.27411-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hdparm/hdparm.hash | 4 ++--
 package/hdparm/hdparm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index 96f8650..1402169 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/hdparm/files/hdparm/
-md5	d380062ad6c4b40076736efbb640f1f5		hdparm-9.50.tar.gz
-sha1	2acfb9ab9f6aae0d1d69e302ae2861342e4a374e	hdparm-9.50.tar.gz
+md5	8fe0a71db02f7ffc602d14a69f766cff	hdparm-9.51.tar.gz
+sha1	cc9dc4cbaa00f7534988c37111be8e2c6e81cf73	hdparm-9.51.tar.gz
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index e9a2088..4a53e93 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HDPARM_VERSION = 9.50
+HDPARM_VERSION = 9.51
 HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
 HDPARM_LICENSE = BSD-Style
 HDPARM_LICENSE_FILES = LICENSE.TXT
-- 
2.10.2
