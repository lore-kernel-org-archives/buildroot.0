From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 15 May 2017 13:25:43 +0100
Subject: [Buildroot] [PATCH next] ffmpeg: bump version to 3.3.1
Message-ID: <20170515122543.29566-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index e243acc74..ab7ba5eee 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 599e7f7c017221c22011c4037b88bdcd1c47cd40c1e466838bc3c465f3e9569d  ffmpeg-3.3.tar.xz
+sha256 b702a7fc656ac23e276b8c823a2f646e4e6f6309bb2788435a708e69bea98f2f  ffmpeg-3.3.1.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 10e4e74d7..d69923b84 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.3
+FFMPEG_VERSION = 3.3.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.13.0
