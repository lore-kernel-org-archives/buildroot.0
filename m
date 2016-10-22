From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Oct 2016 11:25:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: bump version to 3.1.5
In-Reply-To: <20161022092511.1854-1-bernd.kuhls@t-online.de>
References: <20161022092511.1854-1-bernd.kuhls@t-online.de>
Message-ID: <20161022092511.1854-2-bernd.kuhls@t-online.de>
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
index 160e31d..7b1e140 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a80cb378dda5c9bbcdbd62a99bdec0e4eedbcb47f290e72845af4855c1146b5b  ffmpeg-3.1.4.tar.xz
+sha256 49cc3105f7891c5637f8fabb1b75ebb19c9b5123b311a3ccc6182aa35d58b89a  ffmpeg-3.1.5.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 52a39de..52d2f38 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.1.4
+FFMPEG_VERSION = 3.1.5
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.9.3
