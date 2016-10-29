From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Oct 2016 14:08:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/x264: bump version
Message-ID: <20161029120859.25473-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x264/x264.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 6055a8a..19111f0 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = 3b70645597bea052d2398005bc723212aeea6875
+X264_VERSION = 72d53ab2ac7af24597a824e868f2ef363a22f5d4
 X264_SITE = git://git.videolan.org/x264.git
 X264_LICENSE = GPLv2+
 X264_DEPENDENCIES = host-pkgconf
-- 
2.10.1
