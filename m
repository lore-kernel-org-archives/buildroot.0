From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Dec 2015 12:01:25 +0100
Subject: [Buildroot] [PATCH 05/12] package/libva: bump version to 1.6.2
In-Reply-To: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1450522892-14611-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 4 ++--
 package/libva/libva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 07284d2..4d7cdaa 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2015-September/003520.html
-sha1	84a026dfa8e3985a250ca92b135ae859ba5e9728	libva-1.6.1.tar.bz2
+# From http://lists.freedesktop.org/archives/libva/2015-December/003819.html
+sha1	8a857db50305e9e3ddb8fe4e342ddd2924ae16f6	libva-1.6.2.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index f8eab0f..4adfd52 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.6.1
+LIBVA_VERSION = 1.6.2
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
-- 
2.6.4
