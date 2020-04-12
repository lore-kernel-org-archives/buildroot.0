From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2020 16:14:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump version to 1.13.5
Message-ID: <20200412141439.1325730-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://www.mutt.org/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index f0b0153221..f822cfee6e 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 78423016b5f2fcb31bfd156999ff6638177be4459230d2ee61a81e5641d07378  mutt-1.13.3.tar.gz
+sha256 6cd71b5b3e6b255afef6bed3b5e1e8ee9819b3d7c9839fd95e798045882aa653  mutt-1.13.5.tar.gz
 sha256 732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 9cf8304bfe..a71c0e3551 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.13.3
+MUTT_VERSION = 1.13.5
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.25.0
