From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Mar 2016 19:16:17 +0100
Subject: [Buildroot] [PATCH 2/3] package/x11r7/xproto_videoproto: bump
	version to 2.3.3
In-Reply-To: <1457892978-10165-1-git-send-email-bernd.kuhls@t-online.de>
References: <1457892978-10165-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1457892978-10165-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xproto_videoproto/xproto_videoproto.hash | 4 ++--
 package/x11r7/xproto_videoproto/xproto_videoproto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.hash b/package/x11r7/xproto_videoproto/xproto_videoproto.hash
index 41c98cd..471a0a3 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.hash
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.hash
@@ -1,2 +1,2 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2005
-sha256	8dae168cb820fcd32f564879afb3f24d27c176300d9af66819a18265539bd4b6	videoproto-2.3.2.tar.bz2
+# From https://lists.freedesktop.org/archives/xorg-announce/2016-March/002680.html
+sha256	c7803889fd08e6fcaf7b68cc394fb038b2325d1f315e571a6954577e07cca702	videoproto-2.3.3.tar.bz2
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 9226c73..896398f 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_VIDEOPROTO_VERSION = 2.3.2
+XPROTO_VIDEOPROTO_VERSION = 2.3.3
 XPROTO_VIDEOPROTO_SOURCE = videoproto-$(XPROTO_VIDEOPROTO_VERSION).tar.bz2
 XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_VIDEOPROTO_LICENSE = MIT
-- 
2.7.0
