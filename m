From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 11 Aug 2011 12:44:07 +0200
Subject: [Buildroot] [PATCH] directfb: bump to version 1.4.13
Message-ID: <1313059447-17209-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's an even newer stable release available (1.4.14), but it
has problems with cross-compilation that we are still resolving
on the directfb-dev mailing-list.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/directfb/directfb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 5af65d7..c32fcdb 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR = 1.4
-DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).11
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).13
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = YES
-- 
1.7.4.1
