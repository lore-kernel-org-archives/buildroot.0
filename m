From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Nov 2017 06:59:45 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/x11r7/xapp_bdftopcf: bump
 version to 1.1
Message-ID: <20171110055945.26381-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash | 7 +++++--
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
index 7bb7fd363e..65973a500f 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
@@ -1,2 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-December/002509.html
-sha256	38f447be0c61f94c473f128cf519dd0cff63b5d7775240a2e895a183a61e2026	bdftopcf-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-November/002821.html
+md5 2a455d3c02390597feb9cefb3fe97a45  bdftopcf-1.1.tar.bz2
+sha1 48a783337a5aa49ebc102c9788ff0f43ea35c5c4  bdftopcf-1.1.tar.bz2
+sha256 4b4df05fc53f1e98993638d6f7e178d95b31745c4568cee407e167491fd311a2  bdftopcf-1.1.tar.bz2
+sha512 7b790e8d512ca2812ac889c156ef91c48798b4744a6857e5b17e0128764b5afa8c5426fe5de05a9819d64745116718db4221b3e657e3c2633465e87179c44bec  bdftopcf-1.1.tar.bz2
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 489bbba4be..7ee618d641 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_BDFTOPCF_VERSION = 1.0.5
+XAPP_BDFTOPCF_VERSION = 1.1
 XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
 XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BDFTOPCF_LICENSE = MIT
-- 
2.11.0
