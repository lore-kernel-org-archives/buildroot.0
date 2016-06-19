From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 18 Jun 2016 23:58:22 -0300
Subject: [Buildroot] [PATCH] dhcpcd: bump to version 6.11.1
Message-ID: <1466305102-29164-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcpcd/dhcpcd.hash | 2 +-
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 7d01ab8..2e74ecc 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	31c2cd327657f11c427fe5044f74c5b942e70450fa43ceabf4b25f3fd4999959	dhcpcd-6.11.0.tar.xz
+sha256	5c823d607ed1d7513d16ec51c54e21657f1324899e0ba333a497682d88a8c6ee	dhcpcd-6.11.1.tar.xz
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 0cb9118..59abaa5 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.11.0
+DHCPCD_VERSION = 6.11.1
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.7.3
