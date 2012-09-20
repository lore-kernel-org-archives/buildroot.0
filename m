From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 12:23:53 +0200
Subject: [Buildroot] [git commit] vala: bump version
Message-ID: <20120920124823.C72ED9964E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=238f3f860a660b0aafdc6a4ae4abcf0e31b21d93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vala/vala.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 1cbbbc4..73ac8ee 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 VALA_VERSION_MAJOR = 0.17
-VALA_VERSION_MINOR = 6
+VALA_VERSION_MINOR = 7
 VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
