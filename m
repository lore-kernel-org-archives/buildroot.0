From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] libao: bump to version 1.1.0
Message-ID: <20110912052629.112998D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0cc80d1e60327909c87aa2d97ef99ef071a7a5a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libao/libao.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libao/libao.mk b/package/multimedia/libao/libao.mk
index ee02d18..83d3154 100644
--- a/package/multimedia/libao/libao.mk
+++ b/package/multimedia/libao/libao.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBAO_VERSION = 1.0.0
+LIBAO_VERSION = 1.1.0
 LIBAO_SITE = http://downloads.xiph.org/releases/ao
 LIBAO_DEPENDENCIES = host-pkg-config
 LIBAO_INSTALL_STAGING = YES
-- 
1.7.3.4
