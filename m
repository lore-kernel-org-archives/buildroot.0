From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 16 Mar 2016 16:43:14 +0100
Subject: [Buildroot] [PATCH 1/2] libmbim: bump to version 1.12.4
Message-ID: <1458142995-23540-1-git-send-email-yegorslists@googlemail.com>
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
index f066e96..2c10b4f 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  949351d3e3d69b81e40a49f1d187944c26149e0647a415f0227ccdc112047b29  libmbim-1.12.2.tar.xz
+sha256  7bd9af154e88ee1cccaf2fedd05e0f5cb82e3359ab6ad2a75cfec98bf57f973a  libmbim-1.12.4.tar.xz
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 3cb9235..746596e 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.12.2
+LIBMBIM_VERSION = 1.12.4
 LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
2.1.4
