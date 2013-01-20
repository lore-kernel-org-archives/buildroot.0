From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 20:42:20 +0100
Subject: [Buildroot] [git commit] libogg: add license informations
Message-ID: <20130120202430.F073082750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4be060773ce3a7411509c034808df76ae98c104
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libogg/libogg.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 519ba9d..606c004 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -5,8 +5,10 @@
 #############################################################
 LIBOGG_VERSION = 1.3.0
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
-LIBOGG_INSTALL_STAGING = YES
+LIBOGG_LICENSE = BSD-3c
+LIBOGG_LICENSE_FILES = COPYING
 
+LIBOGG_INSTALL_STAGING = YES
 LIBOGG_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
