From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Aug 2011 19:58:16 +0200
Subject: [Buildroot] [git commit] directfb: bump to version 1.4.13
Message-ID: <20110812193535.B33A58C57B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e35921b3a0d148098f08d2f0533b238a65ff3e86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's an even newer stable release available (1.4.14), but it
has problems with cross-compilation that we are still resolving
on the directfb-dev mailing-list.

[Peter: rename ppc patch to match]
Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...patch => directfb-1.4.13-ppc-compile-fix.patch} |    0
 package/directfb/directfb.mk                       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename package/directfb/{directfb-1.4.11-ppc-compile-fix.patch => directfb-1.4.13-ppc-compile-fix.patch} (100%)

diff --git a/package/directfb/directfb-1.4.11-ppc-compile-fix.patch b/package/directfb/directfb-1.4.13-ppc-compile-fix.patch
similarity index 100%
rename from package/directfb/directfb-1.4.11-ppc-compile-fix.patch
rename to package/directfb/directfb-1.4.13-ppc-compile-fix.patch
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
1.7.3.4
