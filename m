From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Jan 2013 19:22:43 +0100
Subject: [Buildroot] [git commit] cairo: bump version to 1.12.10
Message-ID: <20130119182312.C988C9A3B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bf238751c5a4b4db563589d733ffe0a11d25b5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cairo/cairo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index b3fc438..ab0615c 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -3,7 +3,7 @@
 # cairo
 #
 #############################################################
-CAIRO_VERSION = 1.12.8
+CAIRO_VERSION = 1.12.10
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPLv2.1+
 CAIRO_LICENSE_FILES = COPYING
