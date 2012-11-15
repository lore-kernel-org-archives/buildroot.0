From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 10:13:58 +0100
Subject: [Buildroot] [git commit] vala: bump version
Message-ID: <20121115113938.D273499FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62652478541c4bde626c218e747c067e431d2507
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vala/vala.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 5c333c5..6abcdd8 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 VALA_VERSION_MAJOR = 0.18
-VALA_VERSION_MINOR = 0
+VALA_VERSION_MINOR = 1
 VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
