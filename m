From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 09:33:31 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_iceauth: bump version
 to 1.0.8
Message-ID: <20180311084455.BD1F48007A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=427e229d9281232358bbde102942854ad46a32a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_iceauth/xapp_iceauth.hash | 9 +++++++--
 package/x11r7/xapp_iceauth/xapp_iceauth.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.hash b/package/x11r7/xapp_iceauth/xapp_iceauth.hash
index 90c5f70bfa..f1ea73a7af 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.hash
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-January/002519.html
-sha256	1216af2dee99b318fcf8bf9a259915273bcb37a7f1e7859af4f15d0ebf6f3f0a	iceauth-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002850.html
+md5 3b9b79fa0f9928161f4bad94273de7ae  iceauth-1.0.8.tar.bz2
+sha1 2ce23c40a17d98badeb8ce70d26e81a5ac0e178c  iceauth-1.0.8.tar.bz2
+sha256 e6ee213a217265cc76050e4293ea70b98c32dce6505c6421227efbda62ab60c6  iceauth-1.0.8.tar.bz2
+sha512 9d4520adf951b16a3e784349dbb70d5d8176b74b956f8adc63abf55d049745c113b03ccfa60a281fc39b487db3742302dc6287c9985ce83a0157bf4674df2af1  iceauth-1.0.8.tar.bz2
+# Locally computed
+sha256 fdd9ba8ccb92af2f31f542e7b7a18c27257e6cdce147d231bc9ba3654ad84976  COPYING
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index d30ff6f786..0e0e001705 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_ICEAUTH_VERSION = 1.0.7
+XAPP_ICEAUTH_VERSION = 1.0.8
 XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.bz2
 XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICEAUTH_LICENSE = MIT
