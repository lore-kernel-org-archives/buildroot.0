From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:03:46 +0100
Subject: [Buildroot] [git commit] cairo: bump to 1.12.12
Message-ID: <20141101140727.3C2C09D860@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=214f37a0fccf46e7f195d741b1a2d81794f8738c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump cairo to version 1.12.12.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 4b5fdfe..e6fb007 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.12.10
+CAIRO_VERSION = 1.12.12
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPLv2.1+
 CAIRO_LICENSE_FILES = COPYING
