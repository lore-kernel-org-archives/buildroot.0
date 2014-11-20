From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 19:40:13 +0100
Subject: [Buildroot] [git commit] clamav: security bump to version 0.98.5
Message-ID: <20141120184133.3224C7FDCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59119da778cfaacfebdb56816cba1fbf7aade4a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2013-6497 - the jwplayer.js file causes ClamAV to seg fault when
scanned with the -a (list archived files).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash |    4 ++--
 package/clamav/clamav.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 4f21a50..dabda19 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,2 +1,2 @@
-# From http://sourceforge.net/projects/clamav/files/clamav/0.98.4/
-sha1	f1003d04f34efb0aede05395d3c7cc22c944e4ef	clamav-0.98.4.tar.gz
+# From http://sourceforge.net/projects/clamav/files/clamav/0.98.5/
+sha1	5f5e45735819e3ca61610899b779172a5639f70f	clamav-0.98.5.tar.gz
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index c064d4e..fb3730c 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.98.4
+CLAMAV_VERSION = 0.98.5
 CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
 CLAMAV_LICENSE = GPLv2
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
