From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Jun 2019 19:20:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.9.9
Message-ID: <20190622172045.10483-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.9.9.html

Fixes CVE-2019-12435.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 7e82261b4e..60c724e4b8 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.8.tar.asc
-sha256 82ebb7c3f1847c39341dd97ff8b73f40fa83f5f794daeceb80f3c349ace3cf56  samba-4.9.8.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.9.tar.asc
+sha256 af0bf46abc74c62c5a8fe7b567103684b7bf4ce086d32bcd2f6681f592bf63ca  samba-4.9.9.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 6e80e473c1..6aaf81bf13 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.8
+SAMBA4_VERSION = 4.9.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.20.1
