From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sun, 28 Aug 2016 14:41:03 +0200
Subject: [Buildroot] [PATCH] wine: Bump to version 1.8.4
Message-ID: <1472388063-7485-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping to stable version 1.8.4

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 3f856ba..d58ac02 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 d7cecdf7aab93bfe950e6f83ec526681b8770788c7b2a802bfe50ff97fc17a6c wine-1.8.3.tar.bz2
+sha256 515d10439777a4816fe5b0a0fc9a4ce498a2ecfd23eba0c25dc00f3d6c805079 wine-1.8.4.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 632eed3..aceea35 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 1.8.3
+WINE_VERSION = 1.8.4
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
 WINE_SITE = https://dl.winehq.org/wine/source/1.8
 WINE_LICENSE = LGPLv2.1+
-- 
2.7.4
