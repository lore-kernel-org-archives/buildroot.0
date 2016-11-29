From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Nov 2016 23:42:14 +0100
Subject: [Buildroot] [git commit] vala: bump version to 0.34.3
Message-ID: <20161201222140.D29EF8026C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6e77c91e81a39e2910f320870441cdb16156974
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 95566d1..b5abcc3 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.34/vala-0.34.2.sha256sum
-sha256	765e9c2b429a66db93247940f8588319b43f35c173d057bcae5717a97d765c41	vala-0.34.2.tar.xz
+# From https://download.gnome.org/sources/vala/0.34/vala-0.34.3.sha256sum
+sha256 f0fad71aca03cdeadf749ca47f56296a4ddd1a25f4e2f09f0ff9e1e3afbcac3f  vala-0.34.3.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index a208bdc..6eaa7c4 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.34
-VALA_VERSION = $(VALA_VERSION_MAJOR).2
+VALA_VERSION = $(VALA_VERSION_MAJOR).3
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
