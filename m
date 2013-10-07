From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 22:16:41 +0200
Subject: [Buildroot] [git commit] ffmpeg: security bump to version 0.8.15
Message-ID: <20131007201928.006069B97C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f92c64fd60d8d58db67eb06c3e39b790b230385
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes several vulnerabilities.
TODO: update to a more modern branch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b102af1..6685110 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 0.8.12
+FFMPEG_VERSION = 0.8.15
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
