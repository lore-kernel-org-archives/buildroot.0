From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 15:26:56 +0200
Subject: [Buildroot] [PATCH-2017.02.x] package/ffmpeg: security bump to
	version 3.2.8
Message-ID: <20170921132656.12904-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a number of integer overflows and DoS issues.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index f4470f9c85..dcfc8aa8c6 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 28e75fc32485a88035a7ebf0a956a1e5c7e93b440dd4bbd6bc30c7268cf34fe9  ffmpeg-3.2.7.tar.xz
+sha256 42e7362692318afc666f14378dd445effa9a1b09787504a6ab5811fe442674cd  ffmpeg-3.2.8.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 00db404593..9b287c7aaa 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.2.7
+FFMPEG_VERSION = 3.2.8
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.11.0
