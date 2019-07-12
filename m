From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Jul 2019 21:37:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xauth: bump version to
 1.1
Message-ID: <20190712193715.2091-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xauth/xapp_xauth.hash | 9 +++++++--
 package/x11r7/xapp_xauth/xapp_xauth.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
index f6987c1c0c..0251c083a7 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.hash
+++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002772.html
-sha256 5afe42ce3cdf4f60520d1658d2b17face45c74050f39af45dccdc95e73fafc4d  xauth-1.0.10.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003005.html
+md5 e50587c1bb832aafd1a19d91a0890a0b  xauth-1.1.tar.bz2
+sha1 16180e36d75a23cb182cb91e78f24273f1a63967  xauth-1.1.tar.bz2
+sha256 6d1dd1b79dd185107c5b0fdd22d1d791ad749ad6e288d0cdf80964c4ffa7530c  xauth-1.1.tar.bz2
+sha512 b6ecd59a853a491ef45bf8cfbff63bed36645f81cb79ae9d18458b57f7502bccf92f0d979d3337578518646f680ad379e67b1dac15a927cbb11372733e7a3a0c  xauth-1.1.tar.bz2
+# Locally computed
+sha256 dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index 80ac6a42d5..cd900f0055 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XAUTH_VERSION = 1.0.10
+XAPP_XAUTH_VERSION = 1.1
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XAUTH_LICENSE = MIT
-- 
2.20.1
