From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 26 Jul 2016 16:47:41 +0200
Subject: [Buildroot] [PATCH 1/3] libmbim: bump to version 1.14.0
Message-ID: <1469544463-19881-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 2c10b4f..21921c9 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  7bd9af154e88ee1cccaf2fedd05e0f5cb82e3359ab6ad2a75cfec98bf57f973a  libmbim-1.12.4.tar.xz
+sha256  ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b  libmbim-1.14.0.tar.xz
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 746596e..0f757c0 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.12.4
+LIBMBIM_VERSION = 1.14.0
 LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
2.1.4
