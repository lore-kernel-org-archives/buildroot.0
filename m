From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:29:12 +0200
Subject: [Buildroot] [git commit] apache: bump to version 2.4.17
Message-ID: <20151014202916.1E52E80760@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b87447a50fcb57c483cab1143ae40c434d29f06f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apache/apache.hash |    4 ++--
 package/apache/apache.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 9dffe12..e99253a 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.16.tar.bz2.sha1
-sha1	9963e7482700dd50c53e47abfe2d1c5068875a9c	httpd-2.4.16.tar.bz2
+# From http://www.apache.org/dist/httpd/httpd-2.4.17.tar.bz2.sha1
+sha1 3a1b0db8b6c71b9c9ac507ba8723b95a8d3da1df  httpd-2.4.17.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index acd242d..daf8fe2 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.16
+APACHE_VERSION = 2.4.17
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
