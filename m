From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jan 2017 13:55:43 +0100
Subject: [Buildroot] [git commit] hdparm: bump to version 9.51
Message-ID: <20170121125742.B3A6081926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8bb53d2993c807383f52e76a53083825277f15f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
