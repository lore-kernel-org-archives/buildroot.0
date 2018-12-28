From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Dec 2018 08:04:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/wget: bump to version 1.20.1
Message-ID: <8e7b99203d2d931a90f1386c9cbd7823e1bcc647.1545977060.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wget/wget.hash | 5 +++--
 package/wget/wget.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index eee4a5194ec9..7d1a1c5521f2 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.19.5.tar.lz.sig
-sha256 29fbe6f3d5408430c572a63fe32bd43d5860f32691173dfd84edc06869edca75  wget-1.19.5.tar.lz
+# https://ftp.gnu.org/gnu/wget/wget-1.20.1.tar.lz.sig
+# with key 1CB27DBC98614B2D5841646D08302DB6A2670428
+sha256 0f63e84dd23dc53ab3ab6f483c3afff8301e54c165783f772101cdd9b1c64928  wget-1.20.1.tar.lz
 # Locally calculated
 sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 28bd0a264fdd..8d65364016b2 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.19.5
+WGET_VERSION = 1.20.1
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.19.2
