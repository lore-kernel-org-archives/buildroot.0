From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 22:35:43 +0200
Subject: [Buildroot] [git commit] package/oniguruma: bump to version 6.9.7.1
Message-ID: <20210419200912.C96A283D61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a48f2c180d7e85dedb556f9ea253af468967867
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (update in year:
https://github.com/kkos/oniguruma/commit/56255e8b3e209453938b62cb2a5045d29e3c3ff9)

https://github.com/kkos/oniguruma/blob/v6.9.7.1/HISTORY

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/oniguruma/oniguruma.hash | 7 ++++---
 package/oniguruma/oniguruma.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index 668f21d37f..3a6112e832 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,3 +1,4 @@
-# Locally calculated
-sha256  bd0faeb887f748193282848d01ec2dad8943b5dfcb8dc03ed52dcc963549e819  onig-6.9.6.tar.gz
-sha256  6c7038393e8f30fee16257e713f77e383712f1465d6d25929596746b10b42bd3  COPYING
+# From https://github.com/kkos/oniguruma/releases/download/v6.9.7/onig-6.9.7.1.tar.gz.sha256
+sha256  6444204b9c34e6eb6c0b23021ce89a0370dad2b2f5c00cd44c342753e0b204d9  onig-6.9.7.1.tar.gz
+# Hash for license file
+sha256  70ba5469ea0bab6e18a32d7009068f996503168d27be57747e08da34337ff26f  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index 6ea5e1e691..31c8d8e512 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.6
+ONIGURUMA_VERSION = 6.9.7.1
 ONIGURUMA_SITE = \
 	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
