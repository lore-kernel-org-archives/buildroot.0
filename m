From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Oct 2016 14:09:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/x265: bump version to 2.1
Message-ID: <20161029120934.25522-1-bernd.kuhls@t-online.de>
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
index 92b5bea..d6dec12 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256	3e4654133ed957a98708fdb4cb9a154d9e80922b84e26e43fc462a101c5b15c8	x265_1.9.tar.gz
+sha256 88fcb9af4ba52c0757ac9c0d8cd5ec79951a22905ae886897e06954353d6a643  x265_2.1.tar.gz
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index e737c31..ba284da 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 1.9
+X265_VERSION = 2.1
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPLv2+
-- 
2.10.1
