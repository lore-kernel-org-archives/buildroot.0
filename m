From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 08:35:02 +0100
Subject: [Buildroot] [git commit] libidn: bump to version 1.30
Message-ID: <20150303074049.73A7D80481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98f083dd2cc2f9e54ace11dd5d52594a792b0ff4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libidn/libidn.hash |    4 ++--
 package/libidn/libidn.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index f486626..d41443e 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,2 +1,2 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2014-08/msg00006.html
-sha256	fb82747dbbf9b36f703ed27293317d818d7e851d4f5773dedf3efa4db32a7c7c	libidn-1.29.tar.gz
+# From http://lists.gnu.org/archive/html/help-libidn/2015-03/msg00001.html
+sha1	557e1e37f0978e975b21bcdc243c198cb708bb75	libidn-1.30.tar.gz
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index fac9816..13436e9 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.29
+LIBIDN_VERSION = 1.30
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
