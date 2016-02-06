From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 21:19:57 +0100
Subject: [Buildroot] [git commit] package/xvkbd: bump version to 3.7
Message-ID: <20160206202000.E6FEF80771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25bcd8bbbfbc0201d084790c1f8b3de45e9aafca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch upstream URL to new host as mentioned on old site.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xvkbd/Config.in  | 2 +-
 package/xvkbd/xvkbd.hash | 2 +-
 package/xvkbd/xvkbd.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xvkbd/Config.in b/package/xvkbd/Config.in
index bd3f2aa..464a6ef 100644
--- a/package/xvkbd/Config.in
+++ b/package/xvkbd/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_XVKBD
 	help
 	  on-screen keyboard for X
 
-	  http://homepage3.nifty.com/tsato/xvkbd
+	  http://t-sato.in.coocan.jp/xvkbd
diff --git a/package/xvkbd/xvkbd.hash b/package/xvkbd/xvkbd.hash
index a9fa10d..18148e5 100644
--- a/package/xvkbd/xvkbd.hash
+++ b/package/xvkbd/xvkbd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 93c4bdced9f13f22c367d990e98ffbc53f8210fa28a816fa9c610d86e78bf807 xvkbd-3.2.tar.gz
+sha256	895f768269820e7c0379b0daac3687bda0c670d192ebb7e61e5613a5939ec90b	xvkbd-3.7.tar.gz
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 0411fa4..e03f723 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XVKBD_VERSION = 3.2
-XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
+XVKBD_VERSION = 3.7
+XVKBD_SITE = http://t-sato.in.coocan.jp/xvkbd
 XVKBD_LICENSE = GPLv2+
 XVKBD_LICENSE_FILES = README
 
