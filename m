From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Dec 2016 22:05:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/znc: bump version to 1.6.4
Message-ID: <20161227210514.1452-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index f243d4ab0..368235141 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	631c46de76fe601a41ef7676bc974958e9a302b72b25fc92b4a603a25d89b827	znc-1.6.3.tar.gz
+sha256 431097eb17860bfc980f3e68fdd75f98af4bdeecd793c84835c6cb11c3320d1c  znc-1.6.4.tar.gz
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 31e1bcf6c..5b96ee529 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.6.3
+ZNC_VERSION = 1.6.4
 ZNC_SITE = http://znc.in/releases
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
-- 
2.11.0
