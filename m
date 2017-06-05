From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:15:16 +0200
Subject: [Buildroot] [git commit] package/guile: bump version to 2.0.14
Message-ID: <20170605091751.4140C829FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=069393311cb9568a7e86e950ac04123cd5c9c0e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/guile/guile.hash | 2 +-
 package/guile/guile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index 43f0dd7..63651cf 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	3744f2addc282a0de627aaef048f062982b44564d54ac31ff5217972529ed88b	guile-2.0.13.tar.xz
+sha256 e8442566256e1be14e51fc18839cd799b966bc5b16c6a1d7a7c35155a8619d82  guile-2.0.14.tar.xz
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 2ccd8e6..da94d05 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 2.0.13
+GUILE_VERSION = 2.0.14
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
