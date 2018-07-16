From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 16 Jul 2018 21:34:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: bump version to 2.4.34
Message-ID: <20180716193457.13841-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://www.apache.org/dist/httpd/CHANGES_2.4.34

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.hash | 5 +++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 76c7c766cb..74a48ae914 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,3 +1,4 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.33.tar.bz2.sha256
-sha256 de02511859b00d17845b9abdd1f975d5ccb5d0b280c567da5bf2ad4b70846f05 httpd-2.4.33.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.34.tar.bz2.sha256
+sha256 fa53c95631febb08a9de41fd2864cfff815cf62d9306723ab0d4b8d7aa1638f0 httpd-2.4.34.tar.bz2
+# Locally computed
 sha256 c49c0819a726b70142621715dae3159c47b0349c2bc9db079070f28dadac0229 LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 6ebd30ca40..d50e3774ff 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.33
+APACHE_VERSION = 2.4.34
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.18.0
