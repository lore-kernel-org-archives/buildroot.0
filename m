From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 22:42:56 +0200
Subject: [Buildroot] [git commit] syslog-ng: bump to version 3.10.1
Message-ID: <20170621205509.C38AE81672@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aad92bb177d370d3e869c4848f878cabb8a77c87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index ba066d1..d9c51e9 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5678856a550ae790618fabde9d1447f932ce7a9080d55dca8fc5df1202c70a17  syslog-ng-3.9.1.tar.gz
+sha256 a905fe7bad09dcf40bf03650ef1c287b511bf262d004464b8993a28ce58c9136  syslog-ng-3.10.1.tar.gz
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 980c783..bc49fad 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSLOG_NG_VERSION = 3.9.1
+SYSLOG_NG_VERSION = 3.10.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING
