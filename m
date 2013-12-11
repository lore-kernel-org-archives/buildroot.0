From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:38 -0300
Subject: [Buildroot] [PATCH 05/16] libplayer: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libplayer/libplayer.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.3.2
