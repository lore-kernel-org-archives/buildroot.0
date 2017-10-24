From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Oct 2017 08:00:12 +0200
Subject: [Buildroot] [git commit] package/apache: bump version to 2.4.29
Message-ID: <20171024055603.21080807BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=386ca343c514b4c7e30217ee688eb2d273585661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: http://www.apache.org/dist/httpd/CHANGES_2.4.29

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index d5e985f..6471c38 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.28.tar.bz2.sha256
-sha256 c1197a3a62a4ab5c584ab89b249af38cf28b4adee9c0106b62999fd29f920666 httpd-2.4.28.tar.bz2
+# From http://www.apache.org/dist/httpd/httpd-2.4.29.tar.bz2.sha256
+sha256 777753a5a25568a2a27428b2214980564bc1c38c1abf9ccc7630b639991f7f00 httpd-2.4.29.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index d8f8580..e1b1a20 100644
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
