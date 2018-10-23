From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Oct 2018 18:19:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: bump version to 2.4.37
Message-ID: <20181023161908.24591-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://www.apache.org/dist/httpd/CHANGES_2.4.37
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.hash | 2 +-
 package/apache/apache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 32743656fd..6d21f0f614 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,4 +1,4 @@
 # From http://archive.apache.org/dist/httpd/httpd-2.4.35.tar.bz2.sha256
-sha256 2607c6fdd4d12ac3f583127629291e9432b247b782396a563bec5678aae69b56 httpd-2.4.35.tar.bz2
+sha256 3498dc5c6772fac2eb7307dc7963122ffe243b5e806e0be4fb51974ff759d726 httpd-2.4.37.tar.bz2
 # Locally computed
 sha256 c49c0819a726b70142621715dae3159c47b0349c2bc9db079070f28dadac0229 LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 3ac317216d..283c3cbd50 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.35
+APACHE_VERSION = 2.4.37
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.19.1
