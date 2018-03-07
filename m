From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Mar 2018 21:58:37 +0100
Subject: [Buildroot] [PATCH 12/19] package/x11r7/xapp_oclock: bump version
 to 1.0.4
In-Reply-To: <20180307205844.3240-1-bernd.kuhls@t-online.de>
References: <20180307205844.3240-1-bernd.kuhls@t-online.de>
Message-ID: <20180307205844.3240-12-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_oclock/xapp_oclock.hash | 9 +++++++--
 package/x11r7/xapp_oclock/xapp_oclock.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_oclock/xapp_oclock.hash b/package/x11r7/xapp_oclock/xapp_oclock.hash
index ad54499c5e..b345b448f9 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.hash
+++ b/package/x11r7/xapp_oclock/xapp_oclock.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2012-February/001820.html
-sha256	54f5fb85f5828705683f457e559fb18753332db15ae82da561b0ae5a63915091	oclock-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002856.html
+md5 973f6d25a6f0990720b98a15c9436b92  oclock-1.0.4.tar.bz2
+sha1 0bc8f3f44290950f60af894e20e0ceb0c5e8e862  oclock-1.0.4.tar.bz2
+sha256 cc20cfc1c0d5128d89e1eecd9ba52e58f111075be163e0aeda5690dbaafbaefe  oclock-1.0.4.tar.bz2
+sha512 6e0d36a84572a153226b2929f2253cb7adc3c9e5e3af168aeaf8c487ade2e43517b271a8e9cdb2a2c4a67ca56ed0b99c194ca63a4a822b68bfc72ca6518335e7  oclock-1.0.4.tar.bz2
+# Locally computed
+sha256 f6cae4b0c603ef5bd76da2df96b38aa43aa7547e482adb8cb8b83f09af35e4a2  COPYING
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index 17d544ccc4..833d151404 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_OCLOCK_VERSION = 1.0.3
+XAPP_OCLOCK_VERSION = 1.0.4
 XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.bz2
 XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_OCLOCK_LICENSE = MIT
-- 
2.11.0
