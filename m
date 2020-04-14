From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Apr 2020 19:02:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/comix-cursors: bump version to 0.9.1
Message-ID: <20200414170235.347489-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://gitlab.com/limitland/comixcursors/-/blob/master/NEWS

Original repository was moved to gitlab.com, changed _SITE accordingly.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/comix-cursors/comix-cursors.hash | 2 +-
 package/comix-cursors/comix-cursors.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/comix-cursors/comix-cursors.hash b/package/comix-cursors/comix-cursors.hash
index d7f33ca078..e03808c3f8 100644
--- a/package/comix-cursors/comix-cursors.hash
+++ b/package/comix-cursors/comix-cursors.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	3109e4d19d930a6a2a5c3422ebaaa2002640169118f9b12c042bb64995f3ec31	ComixCursors-0.8.2.tar.bz2
+sha256	9e68ea8ff230dcc793528aa5da9a38b9bf61c478cd6868b4e4f5da659746a019	ComixCursors-0.9.1.tar.bz2
diff --git a/package/comix-cursors/comix-cursors.mk b/package/comix-cursors/comix-cursors.mk
index 6cc73764ad..7b034ccee7 100644
--- a/package/comix-cursors/comix-cursors.mk
+++ b/package/comix-cursors/comix-cursors.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-COMIX_CURSORS_VERSION = 0.8.2
-COMIX_CURSORS_SITE = http://limitland.de/downloads/comixcursors
+COMIX_CURSORS_VERSION = 0.9.1
+COMIX_CURSORS_SITE = https://limitland.gitlab.io/comixcursors
 COMIX_CURSORS_SOURCE = ComixCursors-$(COMIX_CURSORS_VERSION).tar.bz2
 COMIX_CURSORS_LICENSE = GPL-3.0
 COMIX_CURSORS_STRIP_COMPONENTS = 0
-- 
2.25.0
