From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Apr 2012 22:10:24 +0200
Subject: [Buildroot] [git commit] directfb: bump to 1.4.16
Message-ID: <20120405111656.116E796A10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=360b31caf71477b07ed1c54b9ae4de5aa3c3176c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 977d272..071cdf4 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR = 1.4
-DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).15
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).16
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = YES
