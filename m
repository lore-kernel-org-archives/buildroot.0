From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:21 +0200
Subject: [Buildroot] [PATCH 28/28] package/hidapi: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-28-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/hidapi/hidapi.hash | 2 +-
 package/hidapi/hidapi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hidapi/hidapi.hash b/package/hidapi/hidapi.hash
index ba00df2..ed22c78 100644
--- a/package/hidapi/hidapi.hash
+++ b/package/hidapi/hidapi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 33e206f5e145fc1bc6aeb55084d71b55d686533d23ad5bb762746ceba81e728b  hidapi-d17db57b9d4354752e0af42f5f33007a42ef2906.tar.gz
+sha256 f2ffe5dbba12dfa0a647ae71b1ec5612fed4c20322ef6f6fd46f6f9713ed1a8e  hidapi-b5b2e1779b6cd2edda3066bbbf0921a2d6b1c3c0.tar.gz
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 270836c..9922efc 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -6,7 +6,7 @@
 
 # Use master version as the current stable is very old and some bugs
 # have been fixed since then.
-HIDAPI_VERSION = d17db57b9d4354752e0af42f5f33007a42ef2906
+HIDAPI_VERSION = b5b2e1779b6cd2edda3066bbbf0921a2d6b1c3c0
 HIDAPI_SITE = $(call github,signal11,hidapi,$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
 # No configure provided, so we need to autoreconf.
-- 
2.8.1
