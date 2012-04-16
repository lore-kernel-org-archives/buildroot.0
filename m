From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Apr 2012 22:08:06 +0200
Subject: [Buildroot] [git commit] ffmpeg: security bump to version 0.8.11
Message-ID: <20120416200913.2A6A696AB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39c8e4d80cc31c1d7391dfeaa6926531fab9e01f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes for CVE-2012-0853, CVE-2012-0858, CVE-2011-3929, CVE-2011-3936,
CVE-2011-3937, CVE-2011-3940, CVE-2011-3945 and CVE-2011-3947.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 92eb14f..4cc29ee 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FFMPEG_VERSION = 0.8.10
+FFMPEG_VERSION = 0.8.11
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
