From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jun 2017 15:09:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/guile: bump version to 2.0.14
Message-ID: <20170604130925.30318-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/guile/guile.hash | 2 +-
 package/guile/guile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index 43f0dd776..63651cf74 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	3744f2addc282a0de627aaef048f062982b44564d54ac31ff5217972529ed88b	guile-2.0.13.tar.xz
+sha256 e8442566256e1be14e51fc18839cd799b966bc5b16c6a1d7a7c35155a8619d82  guile-2.0.14.tar.xz
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 2ccd8e63b..da94d0568 100644
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
-- 
2.11.0
