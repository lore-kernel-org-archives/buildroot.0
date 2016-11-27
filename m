From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Nov 2016 11:40:22 +0100
Subject: [Buildroot] [PATCH/next 1/2] package/ffmpeg: bump version to 3.2.1
Message-ID: <20161127104023.31345-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 541f421..aa9f0f7 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 88f70c1b8cab108f494ecbab5ba302cdb35d59a84cea88008b5fe49be068d5da  ffmpeg-3.2.tar.xz
+sha256 1ecf93da5d601e6fb3096c65cbe33fdaf042d690a3c50c4efadb0a9b74f2badf  ffmpeg-3.2.1.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index de6d841..699de2a 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.2
+FFMPEG_VERSION = 3.2.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.10.2
