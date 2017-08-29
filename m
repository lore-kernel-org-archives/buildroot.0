From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Aug 2017 21:10:05 +0200
Subject: [Buildroot] [PATCH 6/6] package/linphone: fix URL of Debian patches
In-Reply-To: <20170829191005.19697-1-bernd.kuhls@t-online.de>
References: <20170829191005.19697-1-bernd.kuhls@t-online.de>
Message-ID: <20170829191005.19697-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linphone/linphone.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index fb5e18db6..12b0f10a6 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -16,10 +16,10 @@ LINPHONE_DEPENDENCIES = host-pkgconf libeXosip2 speex
 LINPHONE_LICENSE = GPL-2.0+
 LINPHONE_LICENSE_FILES = COPYING
 LINPHONE_PATCH = \
-	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/libav9.patch \
-	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/libav10.patch \
-	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/libav11.patch \
-	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/ffmpeg_2.9.patch
+	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/libav9.patch \
+	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/libav10.patch \
+	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/libav11.patch \
+	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/ffmpeg_2.9.patch
 
 ifeq ($(BR2_arc),y)
 # toolchain __arc__ define conflicts with libosip2 source
-- 
2.11.0
