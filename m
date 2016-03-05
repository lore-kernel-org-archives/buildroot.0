From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Mar 2016 11:40:27 +0100
Subject: [Buildroot] [PATCH 1/4] package/znc: bump version to 1.6.3
Message-ID: <1457174430-30849-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/znc/znc.hash | 4 ++--
 package/znc/znc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index a0b27aa..f243d4a 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	eef17727c0c6433fed1affba0ea76ec7fd60198d2f3c234d8529bd5fb26f0593	znc-1.6.2.tar.gz
+# Locally calculated
+sha256	631c46de76fe601a41ef7676bc974958e9a302b72b25fc92b4a603a25d89b827	znc-1.6.3.tar.gz
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 0844b0f..31e1bcf 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.6.2
+ZNC_VERSION = 1.6.3
 ZNC_SITE = http://znc.in/releases
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
-- 
2.7.0
