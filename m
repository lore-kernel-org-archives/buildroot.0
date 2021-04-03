From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 09:48:57 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libsoundtouch:
 use gitlab macro
Message-ID: <20210403072612.C4348803D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28d9a20f862e00282e1b94d75f321b16a0388528
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2a446bac1ddb0a9f9e604b1bf8e2d03caaf5a795)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
