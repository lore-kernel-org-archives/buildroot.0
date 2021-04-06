From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 17:57:26 +0000
Subject: [Buildroot] [PATCH 3/9] package/s6: bump to version 2.10.0.2
Message-ID: <mBtB1JLFal3KyJRrSxPEWuK9yM5DFzLx0FLT0BoGdg@cp4-web-032.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1535:lpehbljhhcpaopbnkkbf

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/s6/s6.hash | 2 +-
 package/s6/s6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 9b355351ea..3220fefec5 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 e0cdbaf26e3ba1c41ecc0a8d1f45fb78194f96109b55cabeb849528b7e966c57  s6-2.9.0.1.tar.gz
+sha256 b23afce87080b848b89499e85ebd93c20269e6db23f6ef65e58386c9cecd6c21  s6-2.10.0.2.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index ec1407381e..443ecbbffd 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.9.0.1
+S6_VERSION = 2.10.0.2
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
-- 
2.30.2
