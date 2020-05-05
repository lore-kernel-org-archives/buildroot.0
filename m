From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  5 May 2020 22:23:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.11.9
Message-ID: <20200505202356.1127133-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.11.9.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index f2ae8b5b58..ad34489317 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.8.tar.asc
-sha256  bb140caa37d2bbbb1f15f849aa86b1d5f787729443099139936f0ea06a5100ca  samba-4.11.8.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.11.9.tar.asc
+sha256  ad8cef354cf3f3a8835b04c896906b839270bee763d941db52af037ab5ec8dcc  samba-4.11.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9ec4c1eabe..4124032264 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.8
+SAMBA4_VERSION = 4.11.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.26.2
