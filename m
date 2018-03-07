From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Mar 2018 21:58:35 +0100
Subject: [Buildroot] [PATCH 10/19] package/x11r7/xapp_listres: bump version
 to 1.0.4
In-Reply-To: <20180307205844.3240-1-bernd.kuhls@t-online.de>
References: <20180307205844.3240-1-bernd.kuhls@t-online.de>
Message-ID: <20180307205844.3240-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_listres/xapp_listres.hash | 9 +++++++--
 package/x11r7/xapp_listres/xapp_listres.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_listres/xapp_listres.hash b/package/x11r7/xapp_listres/xapp_listres.hash
index ffc9f7eecb..1e1c11953a 100644
--- a/package/x11r7/xapp_listres/xapp_listres.hash
+++ b/package/x11r7/xapp_listres/xapp_listres.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2012-February/001838.html
-sha256	c3d71e9a01650e3fd470189a749cd0202ef03d9e399350a7a7443d7595ed478e	listres-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002848.html
+md5 24e05349f2881aaa58cbe160e49223ac  listres-1.0.4.tar.bz2
+sha1 903857c7a9ec3d8edc8a88101aef33cd27796649  listres-1.0.4.tar.bz2
+sha256 6a1229f478796e141d6658762f432ebbe1f6083b27550847d52239b3f7ec2b10  listres-1.0.4.tar.bz2
+sha512 925bceab6ff96fcf91f58ba2f858905d6e2eff7074ba29cfc02def7c19fb493545837884f1070dc004422451f749cd459000c01e8c9bb51a7cce7f7ab4067b8a  listres-1.0.4.tar.bz2
+# Locally computed
+sha256 aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index 88cdd4f033..b4ac3e1de8 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_LISTRES_VERSION = 1.0.3
+XAPP_LISTRES_VERSION = 1.0.4
 XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.bz2
 XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LISTRES_LICENSE = MIT
-- 
2.11.0
