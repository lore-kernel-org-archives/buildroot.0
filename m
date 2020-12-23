From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 09:51:33 +0100
Subject: [Buildroot] [git commit] package/librsvg: bump to version 2.50.2
Message-ID: <20201223085640.F405E81540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61b54fa31bb2bfd44367355e86566f97750de5a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/librsvg/-/blob/2.50.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index da9f758f48..1b3c26687b 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.50/librsvg-2.50.0.sha256sum
-sha256  b3fadba240f09b9c9898ab20cb7311467243e607cf8f928b7c5f842474ee3df4  librsvg-2.50.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.50/librsvg-2.50.2.sha256sum
+sha256  6211f271ce4cd44a7318190d36712e9cea384a933d3e3570004edeb210a056d3  librsvg-2.50.2.tar.xz
 
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 120f71c792..6a45fc97e2 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.50
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).0
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).2
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
