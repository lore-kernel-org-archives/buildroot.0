From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Feb 2012 16:32:28 +0100
Subject: [Buildroot] [git commit] vala: bump version
Message-ID: <20120301130636.8376B90BF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e4936dfa4c3d2c3192c6c69e9b51f1d4a646fa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vala/vala.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 52a8510..a3ad037 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 VALA_VERSION_MAJOR = 0.15
-VALA_VERSION_MINOR = 1
+VALA_VERSION_MINOR = 2
 VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
