From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:23:39 +0100
Subject: [Buildroot] [git commit] libplayer: add licensing info
Message-ID: <20131211213614.EBB0E9A383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12a35c90b74a6d165f6972549c680e096cab8605
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libplayer/libplayer.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index 061c87a..b4ff500 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -7,6 +7,8 @@
 LIBPLAYER_VERSION = 2.0.1
 LIBPLAYER_SITE = http://libplayer.geexbox.org/releases/
 LIBPLAYER_SOURCE = libplayer-$(LIBPLAYER_VERSION).tar.bz2
+LIBPLAYER_LICENSE = LGPLv2.1+
+LIBPLAYER_LICENSE_FILES = COPYING
 
 # When passing the standard buildroot configure arguments, the configure script
 # breaks on --target and --host options. Thus we need to define a configure cmd
