From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 Oct 2017 21:14:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: bump version to 2.4.29
Message-ID: <20171023191436.27733-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://www.apache.org/dist/httpd/CHANGES_2.4.29

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index d5e985f678..6471c38b62 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.28.tar.bz2.sha256
-sha256 c1197a3a62a4ab5c584ab89b249af38cf28b4adee9c0106b62999fd29f920666 httpd-2.4.28.tar.bz2
+# From http://www.apache.org/dist/httpd/httpd-2.4.29.tar.bz2.sha256
+sha256 777753a5a25568a2a27428b2214980564bc1c38c1abf9ccc7630b639991f7f00 httpd-2.4.29.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index d8f8580036..e1b1a209cb 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.28
+APACHE_VERSION = 2.4.29
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.11.0
