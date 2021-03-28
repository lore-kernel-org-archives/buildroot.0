From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 22:44:57 +0200
Subject: [Buildroot] [git commit] package/libsoundtouch: use gitlab macro
Message-ID: <20210328202028.967D77FB91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a446bac1ddb0a9f9e604b1bf8e2d03caaf5a795
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsoundtouch/libsoundtouch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 98b5cc75b3..8a0e807d7a 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUNDTOUCH_VERSION = 2.2
-LIBSOUNDTOUCH_SITE = https://gitlab.com/soundtouch/soundtouch/-/archive/$(LIBSOUNDTOUCH_VERSION)
+LIBSOUNDTOUCH_SITE = $(call gitlab,soundtouch,soundtouch,$(LIBSOUNDTOUCH_VERSION))
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
 LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
 LIBSOUNDTOUCH_AUTORECONF = YES
