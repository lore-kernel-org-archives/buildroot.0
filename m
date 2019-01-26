From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Jan 2019 10:48:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.9.4
Message-ID: <20190126094852.23546-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://www.samba.org/samba/history/samba-4.9.4.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 41c670059f..de349c3049 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.3.tar.asc
-sha256 cf8fd8707e9ad7bce7832006aac5644155165745ba371170661b3004fa2135cf  samba-4.9.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.4.tar.asc
+sha256 6d98a8d8bcccbe788e4bbb406362e6676311aca711a3f3cc9b3a404bb9ff0b4f  samba-4.9.4.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 89e39dab55..9f771cf82f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.3
+SAMBA4_VERSION = 4.9.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.20.1
