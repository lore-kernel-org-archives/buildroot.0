From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 17:17:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/apache: bump
 version to 2.4.29
Message-ID: <20180411154834.F22FE88454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=763319e86cfc3e03f7506a1691af94ede7fce90e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Changelog: http://www.apache.org/dist/httpd/CHANGES_2.4.29

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 386ca343c514b4c7e30217ee688eb2d273585661)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
