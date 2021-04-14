From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Apr 2021 23:08:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/oniguruma: bump to version 6.9.7
Message-ID: <20210414210839.1376139-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash of COPYING (update in year:
https://github.com/kkos/oniguruma/commit/56255e8b3e209453938b62cb2a5045d29e3c3ff9)

https://github.com/kkos/oniguruma/releases/tag/v6.9.7
https://github.com/kkos/oniguruma/blob/v6.9.7/HISTORY

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oniguruma/oniguruma.hash | 7 ++++---
 package/oniguruma/oniguruma.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index 668f21d37f..5f8c004ce6 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,3 +1,4 @@
-# Locally calculated
-sha256  bd0faeb887f748193282848d01ec2dad8943b5dfcb8dc03ed52dcc963549e819  onig-6.9.6.tar.gz
-sha256  6c7038393e8f30fee16257e713f77e383712f1465d6d25929596746b10b42bd3  COPYING
+# From https://github.com/kkos/oniguruma/releases/download/v6.9.7/onig-6.9.7.tar.gz.sha256
+sha256  34274cd4d11b26413f99c212cf88d8782c4f699c8aba0a4a4772cc9b28043c7b  onig-6.9.7.tar.gz
+# Hash for license file
+sha256  70ba5469ea0bab6e18a32d7009068f996503168d27be57747e08da34337ff26f  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index 6ea5e1e691..280e649f2d 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.6
+ONIGURUMA_VERSION = 6.9.7
 ONIGURUMA_SITE = \
 	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
-- 
2.30.2
