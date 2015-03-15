From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:22 +0100
Subject: [Buildroot] [PATCH 13/14] package/x11r7/xproto_randrproto: bump
	version to 1.4.1, add hash
In-Reply-To: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426418363-22738-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xproto_randrproto/xproto_randrproto.hash |    3 +++
 package/x11r7/xproto_randrproto/xproto_randrproto.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xproto_randrproto/xproto_randrproto.hash

diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.hash b/package/x11r7/xproto_randrproto/xproto_randrproto.hash
new file mode 100644
index 0000000..8b17d6e
--- /dev/null
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2015-March/002547.html
+sha1	7cd1daf5c56336079303d675b5a6788c90204016				randrproto-1.4.1.tar.bz2
+sha256	543dcb2ebb0622d8a506dcef6470c6dd066f3e3f866552a5060b91ab6129e1dc	randrproto-1.4.1.tar.bz2
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index a8fb232..b94d084 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RANDRPROTO_VERSION = 1.4.0
+XPROTO_RANDRPROTO_VERSION = 1.4.1
 XPROTO_RANDRPROTO_SOURCE = randrproto-$(XPROTO_RANDRPROTO_VERSION).tar.bz2
 XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RANDRPROTO_LICENSE = MIT
-- 
1.7.10.4
