From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:33:43 +0200
Subject: [Buildroot] [git commit] package/argus: bump to version 3.0.8.2
Message-ID: <20190927213015.ACD6B8FA5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4104d6581bbff42f1985560a0197410d1f6b229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/argus/argus.hash | 9 +++++++--
 package/argus/argus.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/argus/argus.hash b/package/argus/argus.hash
index 84edce61ec..f6f727ccc9 100644
--- a/package/argus/argus.hash
+++ b/package/argus/argus.hash
@@ -1,2 +1,7 @@
-# From http://qosient.com/argus/src/argus-3.0.8.tar.gz.md5
-md5	84daae71a502e4f6d088c279de3aa36b  argus-3.0.8.tar.gz
+# From http://qosient.com/argus/src/argus-3.0.8.2.tar.gz.md5
+md5	eaf5f5ec66569e556392802a70ef9ca5  argus-3.0.8.2.tar.gz
+
+# Locally computed
+sha256	ca4e3bd5b9d4a8ff7c01cc96d1bffd46dbd6321237ec94c52f8badd51032eeff  argus-3.0.8.2.tar.gz
+sha256	c68221f7207486bfce863fada4ba9b2aaf4adc9e1c672f965ae98e88143e5f16  README
+
diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index 941f439fc6..0441df49ea 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARGUS_VERSION = 3.0.8
+ARGUS_VERSION = 3.0.8.2
 ARGUS_SITE = http://qosient.com/argus/src
 ARGUS_DEPENDENCIES = libpcap
 ARGUS_CONF_ENV = arg_cv_sys_errlist=yes
