From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  4 Aug 2017 14:55:18 -0400
Subject: [Buildroot] [PATCH 07/10] softether: bump to version
	471de39ddf91be0a6a020a68fd6c4c20ef5ba702cb8b5da12ae8350493819ed8
In-Reply-To: <20170804185521.12320-1-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
Message-ID: <20170804185521.12320-8-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While this version isn't 100% compatible with LibreSSL, it makes it much
easier to apply a small patch that makes it compatible.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/softether/softether.hash | 2 +-
 package/softether/softether.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index 961990baf..2f77df1db 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4bdcc05fcd163eea735444283264e40b86626d24fddf110aa416f2c8cb82448b softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
+sha256 471de39ddf91be0a6a020a68fd6c4c20ef5ba702cb8b5da12ae8350493819ed8 softether-e9006faf0c8739147ab97e27fe11c5cdd20ed9e6.tar.gz
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 33d20c40b..31504cfb1 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = 1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a
+SOFTETHER_VERSION = e9006faf0c8739147ab97e27fe11c5cdd20ed9e6
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
-- 
2.13.3
