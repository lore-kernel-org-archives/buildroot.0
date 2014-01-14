From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2014 22:36:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/ola: bump to 0.8.33
Message-ID: <1389735365-20795-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ola/ola.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 542aa77..843ec0b 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OLA_VERSION = 0.8.32
+OLA_VERSION = 0.8.33
 OLA_SITE = https://open-lighting.googlecode.com/files
 
 OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
-- 
1.8.1.2
