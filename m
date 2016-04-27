From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:16:34 +0200
Subject: [Buildroot] [git commit] package/x264: bump version
Message-ID: <20160427201638.41F2581D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d8cae4dbec5d9ab717bb628dae72f725fcd087c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x264/x264.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index cf5e385..6055a8a 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = a01e33913655f983df7a4d64b0a4178abb1eb618
+X264_VERSION = 3b70645597bea052d2398005bc723212aeea6875
 X264_SITE = git://git.videolan.org/x264.git
 X264_LICENSE = GPLv2+
 X264_DEPENDENCIES = host-pkgconf
