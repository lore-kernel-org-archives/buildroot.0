From: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Date: Tue, 23 Jul 2019 16:41:53 +0200
Subject: [Buildroot] [PATCH] dejavu: Add missing license name and license
 hash
Message-ID: <20190723144153.12830-1-mickael.tansorier@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Micka?l Tansorier <mickael.tansorier@smile.fr>
---
 package/dejavu/dejavu.hash | 3 +++
 package/dejavu/dejavu.mk   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/dejavu/dejavu.hash b/package/dejavu/dejavu.hash
index db7365a1c3..57ae504fac 100644
--- a/package/dejavu/dejavu.hash
+++ b/package/dejavu/dejavu.hash
@@ -1,2 +1,5 @@
 # From https://dejavu-fonts.github.io/Download.html
 sha256 fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7  dejavu-fonts-ttf-2.37.tar.bz2
+
+# Hashes for license file:
+sha256 7a083b136e64d064794c3419751e5c7dd10d2f64c108fe5ba161eae5e5958a93 LICENSE
diff --git a/package/dejavu/dejavu.mk b/package/dejavu/dejavu.mk
index 9b57f0992e..5ce6fef5b3 100644
--- a/package/dejavu/dejavu.mk
+++ b/package/dejavu/dejavu.mk
@@ -7,6 +7,7 @@
 DEJAVU_VERSION = 2.37
 DEJAVU_SITE = https://sourceforge.net/projects/dejavu/files/dejavu/$(DEJAVU_VERSION)
 DEJAVU_SOURCE = dejavu-fonts-ttf-$(DEJAVU_VERSION).tar.bz2
+DEJAVU_LICENSE = Bitstream Vera
 DEJAVU_LICENSE_FILES = LICENSE
 
 DEJAVU_FONTS_INSTALL =
-- 
2.22.0
