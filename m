From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Jan 2016 08:27:44 -0300
Subject: [Buildroot] [PATCH] dhcpcd: bump to version 6.10.1
Message-ID: <1453375664-510-1-git-send-email-gustavo@zacarias.com.ar>
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
index 18ffaed..ea05f86 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	ab56af9b2e86913c55a965cb0f835e87749df78318564acf90d5d698f413ad35	dhcpcd-6.10.0.tar.xz
+sha256	284abf8c3be0580bbac5eaca95359346ab0d78d4072317b6ce87cc68f2e8ae7b	dhcpcd-6.10.1.tar.xz
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 27e0666..5d1388d 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.10.0
+DHCPCD_VERSION = 6.10.1
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.4.10
