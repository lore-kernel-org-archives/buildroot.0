From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:40:36 +0200
Subject: [Buildroot] [git commit] package/libshairplay: bump version
Message-ID: <20160605200530.6568D81E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e77f9eee8557c42a6ec453d84fdfb175b7e32e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libshairplay/libshairplay.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
index 35bbeac..4bdd1a0 100644
--- a/package/libshairplay/libshairplay.mk
+++ b/package/libshairplay/libshairplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSHAIRPLAY_VERSION = 64d59e3087f829006d091fa0d114efb50972a2bf
+LIBSHAIRPLAY_VERSION = ce80e005908f41d0e6fde1c4a21e9cb8ee54007b
 LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
 LIBSHAIRPLAY_INSTALL_STAGING = YES
 LIBSHAIRPLAY_AUTORECONF = YES
