From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 Jan 2017 15:50:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/x265: bump version to 2.2
Message-ID: <20170122145028.13360-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x265/x265.hash | 2 +-
 package/x265/x265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 92b5beaa9d..5672d79e0c 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256	3e4654133ed957a98708fdb4cb9a154d9e80922b84e26e43fc462a101c5b15c8	x265_1.9.tar.gz
+sha256 b872552535e41fbffa03ba7cbcd3479c42c4053868309292e78e147b7773ac4b  x265_2.2.tar.gz
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index e737c31375..0fbdb01071 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 1.9
+X265_VERSION = 2.2
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPLv2+
-- 
2.11.0
