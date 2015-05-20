From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 May 2015 10:26:35 +0200
Subject: [Buildroot] [PATCH/next 4/7] package/x11r7/xproto_randrproto: bump
	version to 1.5.0
In-Reply-To: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
References: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1432110398-22791-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xproto_randrproto/xproto_randrproto.hash |    6 +++---
 package/x11r7/xproto_randrproto/xproto_randrproto.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.hash b/package/x11r7/xproto_randrproto/xproto_randrproto.hash
index 8b17d6e..c71df7f 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.hash
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.hash
@@ -1,3 +1,3 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002547.html
-sha1	7cd1daf5c56336079303d675b5a6788c90204016				randrproto-1.4.1.tar.bz2
-sha256	543dcb2ebb0622d8a506dcef6470c6dd066f3e3f866552a5060b91ab6129e1dc	randrproto-1.4.1.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-May/002605.html
+sha1	bc420745dc4af011988e9dcabdadf8829cbc2374				randrproto-1.5.0.tar.bz2
+sha256	4c675533e79cd730997d232c8894b6692174dce58d3e207021b8f860be498468	randrproto-1.5.0.tar.bz2
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index b94d084..f6c4878 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RANDRPROTO_VERSION = 1.4.1
+XPROTO_RANDRPROTO_VERSION = 1.5.0
 XPROTO_RANDRPROTO_SOURCE = randrproto-$(XPROTO_RANDRPROTO_VERSION).tar.bz2
 XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RANDRPROTO_LICENSE = MIT
-- 
1.7.10.4
