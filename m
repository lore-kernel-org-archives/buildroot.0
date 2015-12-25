From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 25 Dec 2015 22:51:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/luvi: bump to version 2.5.1
Message-ID: <1451080302-13464-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luvi/luvi.hash | 2 +-
 package/luvi/luvi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index c967558..325c84f 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9d13baba7870160bd0f9be9d52f8ef1dafe282490d5f83a8e14765aa43387765  luvi-src-v2.3.5.tar.gz
+sha256  883fca4d50c18dc5b248144a00526b718e7c4c91841123b4a0732fef2b8791f4  luvi-src-v2.5.1.tar.gz
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 7611c11..ef1c2e1 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.3.5
+LUVI_VERSION = v2.5.1
 LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
-- 
2.6.4
