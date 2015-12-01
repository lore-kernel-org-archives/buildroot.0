From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Dec 2015 10:49:19 -0300
Subject: [Buildroot] [PATCH] dhcpcd: bump to version 6.9.4
Message-ID: <1448977759-12855-1-git-send-email-gustavo@zacarias.com.ar>
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
index 71d0e28..94ab89e 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	6089471ed695fa62ac8351466b96b4b6365fd14ec455a120a6524663808eae53	dhcpcd-6.9.3.tar.xz
+sha256	c3f3ff7473ef158a1e71db9aea7424df2c3477ad064e2b542f27948a5abc9ba0	dhcpcd-6.9.4.tar.xz
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 66928e2..2d0cb0c 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.9.3
+DHCPCD_VERSION = 6.9.4
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.4.10
