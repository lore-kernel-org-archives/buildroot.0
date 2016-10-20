From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 21:34:32 +0200
Subject: [Buildroot] [git commit] hdparm: bump to version 9.50
Message-ID: <20161020193500.759717FEC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f77c00ac999843420b9d1e14f790fd370186b3aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hdparm/hdparm.hash | 4 ++--
 package/hdparm/hdparm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index 7d70f0b..96f8650 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/hdparm/files/hdparm/
-md5	213efdbe7471fad3408198918e164354		hdparm-9.48.tar.gz
-sha1	1efce086ef47667cf8016861d3ce958969e70dfc	hdparm-9.48.tar.gz
+md5	d380062ad6c4b40076736efbb640f1f5		hdparm-9.50.tar.gz
+sha1	2acfb9ab9f6aae0d1d69e302ae2861342e4a374e	hdparm-9.50.tar.gz
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index a2b3e8c..e9a2088 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HDPARM_VERSION = 9.48
+HDPARM_VERSION = 9.50
 HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
 HDPARM_LICENSE = BSD-Style
 HDPARM_LICENSE_FILES = LICENSE.TXT
