From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Mar 2021 13:59:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xkbcomp: bump version to
 1.4.5
Message-ID: <20210327125947.1724901-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.x.org/archives/xorg-announce/2021-March/003075.html

Update license hash after upstream removed trailing whitespaces:
https://cgit.freedesktop.org/xorg/app/xkbcomp/commit/COPYING?id=3b3d25dd32ba48fd6d15ca98baf7109af21e1d97

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash | 9 +++++----
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
index 7191d5520e..bccaae6f57 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -1,5 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-November/003063.html
-sha256  59cce603a607a17722a0a1cf99010f4894e7812beb5d695abbc08474d59af27e  xkbcomp-1.4.4.tar.bz2
-sha512  971eb06277a49083b42154472596f1452fa94cdee28bad345bbcd85b028441bfd975763c20ed92aa69d6605b3fb23d27fee89df91501963b77c863667bae41c4  xkbcomp-1.4.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-March/003075.html
+sha256  6851086c4244b6fd0cc562880d8ff193fb2bbf1e141c73632e10731b31d4b05e  xkbcomp-1.4.5.tar.bz2
+sha512  2e84f8d6b083e2e818cb95e5d2a184da00e50d71b280e92d1a71465a9a4348f922f4ddccb42cfeee6f76705bbfc8580ef67aedd0d958aaa1ae6bbcc66ccd8154  xkbcomp-1.4.5.tar.bz2
+
 # Locally computed
-sha256  f1a78f5796fe2374f2b93e579328a02283e57d2a8316484b31799b12debe7ee3  COPYING
+sha256  6b833fdc05906ce57f016dc791db86830d49ee4da2861ce45806c50b3f4dda9e  COPYING
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 69d4aefb94..b52f5e6850 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBCOMP_VERSION = 1.4.4
+XAPP_XKBCOMP_VERSION = 1.4.5
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
-- 
2.29.2
