From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 23:55:42 +0200
Subject: [Buildroot] [git commit] gettext: bump to version 0.19.8.1
Message-ID: <20160611215726.B6DB1802D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79411223f846d78f913e5da62fa2528a08b72287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.hash | 6 +++---
 package/gettext/gettext.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
index adaeb3eb..cff6eb1 100644
--- a/package/gettext/gettext.hash
+++ b/package/gettext/gettext.hash
@@ -1,3 +1,3 @@
-# From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00002.html
-md5	3e7ed1ac886b9b1a4e23e71113da6358	gettext-0.19.8.tar.xz
-sha1	dc551d4783edf691c1f0095ca927d3128b5093e8	gettext-0.19.8.tar.xz
+# From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
+md5	df3f5690eaa30fd228537b00cb7b7590	gettext-0.19.8.1.tar.xz
+sha1	e0fe90ede22f7f16bbde7bdea791a835f2773fc9	gettext-0.19.8.1.tar.xz
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index fa43f7b..71fcb00 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.19.8
+GETTEXT_VERSION = 0.19.8.1
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
