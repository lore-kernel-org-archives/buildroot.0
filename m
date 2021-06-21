From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:22:12 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/librsvg: bump to
 version 2.50.5
Message-ID: <20210621190356.1BBB48B37D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2578c2bd6b92e5d275910ccbf9403c460ef1170
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b1f282243744264f5eb207b3b5931052a5bfd49c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 1b3c26687b..cb558f1479 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.50/librsvg-2.50.2.sha256sum
-sha256  6211f271ce4cd44a7318190d36712e9cea384a933d3e3570004edeb210a056d3  librsvg-2.50.2.tar.xz
+# From https://ftp.gnome.org/pub/gnome/sources/librsvg/2.50/librsvg-2.50.5.sha256sum
+sha256  32701574c234fed352520c6d0bd5081f728184bc1a9b9c87d423dd27c32b9272  librsvg-2.50.5.tar.xz
 
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 5eeb68f9b8..5f3d688391 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.50
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).2
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).5
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
