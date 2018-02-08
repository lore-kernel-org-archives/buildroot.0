From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  8 Feb 2018 21:36:17 +0200
Subject: [Buildroot] [PATCH] wget: bump to version 1.19.4
Message-ID: <48c8e39a4a88f4f12df6b688245b27c2fe68158c.1518118577.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license hash; s/http/https/ of in-text URLs.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wget/wget.hash | 5 +++--
 package/wget/wget.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 004855794625..ab0d1d1dfd46 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,4 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 d59a745ad2c522970660bb30d38601f9457b151b322e01fa20a5a0da0f55df07  wget-1.19.2.tar.lz
+# https://ftp.gnu.org/gnu/wget/wget-1.19.4.tar.lz.sig
+sha256 2fc0ffb965a8dc8f1e4a89cbe834c0ae7b9c22f559ebafc84c7874ad1866559a  wget-1.19.4.tar.lz
 # Locally calculated
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 3fee8e1b0c2d..23e4c8accaa2 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.19.2
+WGET_VERSION = 1.19.4
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.15.1
