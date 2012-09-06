From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Sep 2012 15:48:19 +0200
Subject: [Buildroot] [git commit] vala: bump version
Message-ID: <20120906210346.550A49959E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf5f225dca807b70f80168a23dadc9e29e71cf20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ... => vala-dont-add-dirty-to-valac-version.patch} |    0
 package/vala/vala.mk                               |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vala/vala-0.15.2-dont-add-dirty-to-valac-version.patch b/package/vala/vala-dont-add-dirty-to-valac-version.patch
similarity index 100%
rename from package/vala/vala-0.15.2-dont-add-dirty-to-valac-version.patch
rename to package/vala/vala-dont-add-dirty-to-valac-version.patch
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 7c0ea9f..984043c 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-VALA_VERSION_MAJOR = 0.15
-VALA_VERSION_MINOR = 2
+VALA_VERSION_MAJOR = 0.17
+VALA_VERSION_MINOR = 6
 VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
