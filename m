From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:39:44 +0200
Subject: [Buildroot] [git commit] package/apache: security bump to version
	2.4.16
Message-ID: <20150716213947.B4C1E81DA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd9abf873a5c25f34a54338a8f9afc456c09c433
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2015-3183, CVE-2015-3185, CVE-2015-0253, CVE-2015-0228
http://marc.info/?l=apache-httpd-announce&m=143704705330655&w=2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
