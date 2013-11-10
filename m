From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 10:05:31 +0100
Subject: [Buildroot] [git commit] gutenprint: fix download url
Message-ID: <20131110090700.8ABEC9BB4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=058f37fb6af5af5e6991f670106007167c2435e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gutenprint/gutenprint.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 33abf48..0924cb6 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUTENPRINT_VERSION = 5.2.9
-GUTENPRINT_SITE = http://downloads.sourceforge.net/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
+GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
 GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
 GUTENPRINT_LICENSE = GPLv2+
 GUTENPRINT_LICENSE_FILES = COPYING
