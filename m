From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  8 May 2018 18:43:02 +0300
Subject: [Buildroot] [PATCH] wget: security bump to version 1.19.5
Message-ID: <e453953371b3ff38359cb895d57bab0fd078f6c1.1525794182.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-0494: cookie injection vulnerability.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wget/wget.hash | 4 ++--
 package/wget/wget.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index ab0d1d1dfd46..eee4a5194ec9 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.19.4.tar.lz.sig
-sha256 2fc0ffb965a8dc8f1e4a89cbe834c0ae7b9c22f559ebafc84c7874ad1866559a  wget-1.19.4.tar.lz
+# https://ftp.gnu.org/gnu/wget/wget-1.19.5.tar.lz.sig
+sha256 29fbe6f3d5408430c572a63fe32bd43d5860f32691173dfd84edc06869edca75  wget-1.19.5.tar.lz
 # Locally calculated
 sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 23e4c8accaa2..72a73cce7971 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.19.4
+WGET_VERSION = 1.19.5
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.17.0
