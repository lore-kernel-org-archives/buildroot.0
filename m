From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Feb 2012 22:26:26 +0100
Subject: [Buildroot] [git commit] ffmpeg: fix altivec typo
Message-ID: <20120213212853.7D16C90A8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c61d732098c7eacc23ad9f4322a637739ce71d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index dc572de..bed3728 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -150,7 +150,7 @@ endif
 # Set powerpc altivec appropriately
 ifeq ($(BR2_powerpc),y)
 ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
-FFMPEG_CONF_OPT -= --enable-altivec
+FFMPEG_CONF_OPT += --enable-altivec
 else
 FFMPEG_CONF_OPT += --disable-altivec
 endif
