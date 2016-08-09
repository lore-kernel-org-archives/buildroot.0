From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 Aug 2016 10:07:37 +0100
Subject: [Buildroot] [PATCH 1/2] diffutils: bump version to 3.4
Message-ID: <1470733658-55267-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/diffutils/diffutils.hash | 2 +-
 package/diffutils/diffutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
index 27eace2..2094e97 100644
--- a/package/diffutils/diffutils.hash
+++ b/package/diffutils/diffutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a25e89a8ab65fded1731e4186be1bb25cda967834b6df973599cdcd5abdfc19c	diffutils-3.3.tar.xz
+sha256 db53c025f2ac3d217bcf753dad6dee7b410b33d0948495ff015aaf8b91189ce2  diffutils-3.4.tar.xz
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 191fd2e..9370f66 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.3
+DIFFUTILS_VERSION = 3.4
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-- 
2.7.3
