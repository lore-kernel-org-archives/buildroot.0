From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 19:36:57 +0200
Subject: [Buildroot] [git commit] package/libshairplay: bump git snapshot
Message-ID: <20141005184629.B833CB0A1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=baf81e922a4e7d47f7ad1d22388c9da36b4b9a86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libshairplay/libshairplay.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
index fc397d7..35bbeac 100644
--- a/package/libshairplay/libshairplay.mk
+++ b/package/libshairplay/libshairplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSHAIRPLAY_VERSION = 139d5ef55564514c31f02dd82cef91236c9ff523
+LIBSHAIRPLAY_VERSION = 64d59e3087f829006d091fa0d114efb50972a2bf
 LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
 LIBSHAIRPLAY_INSTALL_STAGING = YES
 LIBSHAIRPLAY_AUTORECONF = YES
