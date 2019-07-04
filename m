From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  4 Jul 2019 07:53:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.9.11
Message-ID: <20190704055323.16345-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.9.11.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 60c724e4b8..28cbe7d9b2 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.9.tar.asc
-sha256 af0bf46abc74c62c5a8fe7b567103684b7bf4ce086d32bcd2f6681f592bf63ca  samba-4.9.9.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.11.tar.asc
+sha256 bb736624d16f7369e395de2f15fec153b554f76f95864015b4ce1f2ae53e817b  samba-4.9.11.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 6aaf81bf13..3690dbd7c5 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.9
+SAMBA4_VERSION = 4.9.11
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.20.1
