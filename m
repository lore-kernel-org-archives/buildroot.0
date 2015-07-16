From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 16 Jul 2015 18:49:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump to version
	2.4.16
Message-ID: <1437065357-23614-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2015-3183, CVE-2015-3185, CVE-2015-0253, CVE-2015-0228
http://marc.info/?l=apache-httpd-announce&m=143704705330655&w=2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.hash |    4 ++--
 package/apache/apache.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 51fd3ca..9dffe12 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.12.tar.bz2.sha1
-sha1	bc4681bfd63accec8d82d3cc440fbc8264ce0f17	httpd-2.4.12.tar.bz2
+# From http://www.apache.org/dist/httpd/httpd-2.4.16.tar.bz2.sha1
+sha1	9963e7482700dd50c53e47abfe2d1c5068875a9c	httpd-2.4.16.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 296e27e..acd242d 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.12
+APACHE_VERSION = 2.4.16
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
1.7.10.4
