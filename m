From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:13:30 +0200
Subject: [Buildroot] [git commit] gettext: bump to version 0.19.8
Message-ID: <20160609221335.943EC80AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8b4d40f27c855db18cbb03b50e7893b7b28d17b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.hash | 6 +++---
 package/gettext/gettext.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
index 3236fda..adaeb3eb 100644
--- a/package/gettext/gettext.hash
+++ b/package/gettext/gettext.hash
@@ -1,3 +1,3 @@
-# From http://lists.gnu.org/archive/html/bug-gettext/2015-12/msg00019.html
-md5	f81e50556da41b44c1d59ac93474dca5	gettext-0.19.7.tar.xz
-sha1	4b2574b76d14c98270bf607a2a62f033524d8e8c	gettext-0.19.7.tar.xz
+# From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00002.html
+md5	3e7ed1ac886b9b1a4e23e71113da6358	gettext-0.19.8.tar.xz
+sha1	dc551d4783edf691c1f0095ca927d3128b5093e8	gettext-0.19.8.tar.xz
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 0b4e5dd..fa43f7b 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.19.7
+GETTEXT_VERSION = 0.19.8
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
