From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Mar 2017 22:16:07 +0100
Subject: [Buildroot] [git commit] vala: bump version to 0.34.7
Message-ID: <20170321211619.AC7E382630@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a2a87af107bce07a4dde9428920e4c62b6492b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 390eb44..48212b2 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.34/vala-0.34.6.sha256sum
-sha256 d1e32d6c55c2d66964d30b7410b78f5f313f1231fc3502da9980c3c80a797bb1  vala-0.34.6.tar.xz
+# From https://download.gnome.org/sources/vala/0.34/vala-0.34.7.sha256sum
+sha256 1b2cb14f377d4c41fa3a86d3d01b93017015ce91b6714a85f27346073b4034fa  vala-0.34.7.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index c59ba25..70dc4b9 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.34
-VALA_VERSION = $(VALA_VERSION_MAJOR).6
+VALA_VERSION = $(VALA_VERSION_MAJOR).7
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
